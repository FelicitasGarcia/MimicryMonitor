```
▗▖  ▗▖▄ ▄▄▄▄  ▄ ▗▞▀▘ ▄▄▄ ▄   ▄  ▗▖  ▗▖ ▄▄▄  ▄▄▄▄  ▄    ■   ▄▄▄   ▄▄▄ 
▐▛▚▞▜▌▄ █ █ █ ▄ ▝▚▄▖█    █   █  ▐▛▚▞▜▌█   █ █   █ ▄ ▗▄▟▙▄▖█   █ █    
▐▌  ▐▌█ █   █ █     █     ▀▀▀█  ▐▌  ▐▌▀▄▄▄▀ █   █ █   ▐▌  ▀▄▄▄▀ █    
▐▌  ▐▌█       █          ▄   █  ▐▌  ▐▌            █   ▐▌             
                          ▀▀▀                         ▐▌             

```
## Project Overview

MimicryMonitor is a tool that builds monitors to compare a Program Under Analysis (PUA) against a known Oracle Program (OP). It constructs an automaton by comparing both programs' control flow graphs (CFGs) and variable behavior, and instruments the PUA to monitor runtime behavior.

This tool:

1. Analyzes both programs using LLVM to extract control flow graphs (CFGs)
2. Uses a specialized LLVM pass to identify variable read/write operations
3. Constructs a monitor automaton based on "sigma pairs" that match instructions between the programs
4. Instruments the PUA with the generated monitor
5. Produces an executable that validates PUA's behavior against the OP model at runtime

This approach leverages common code fragments between trusted and untrusted programs to create a powerful verification mechanism.

## Prerequisites

- LLVM (version 19.1.7 recommended)
- Clang compiler
- Java JDK 22 
  - (If using another version, be sure to change the `pom.xml` file, or run the Java code with your own configurations)
- Maven (for building the Java component)
- GraphViz (`dot` command for rendering CFGs)
- Bash shell environment
- Ninja build system (recommended)

## Project Structure

```
mimicrymonitor/
├── monitor/                # Java monitor constructor (Maven project)
│   ├── pom.xml
│   └── src/main/java/org/mimicry/   # Automata, MonitorConstructor, ... 
├── instrumentation/        # LLVM passes (out-of-tree) + C monitor runtime
│   ├── CMakeLists.txt       #   builds LLVMMimicryPasses.so against the pinned LLVM
│   ├── MimicryInstrument.cpp / FeliDefUseInfo.cpp
│   ├── include/llvm/Transforms/Mimicry/*.h
│   └── monitor_runtime.c / mm_*_reporter.c
├── pipeline/               # all scripts: setup, run-mimicry, analyze, instrument, fuzz
├── inputs/                 # default programOP.c / programPUA.c / sigma.txt
├── examples/               # extra example targets (catCU, lsCU, mvCU, ...)
├── evaluation/             # tests/ (coreutils PUA tests) and seeds/ (AFL seeds)
├── work/                   # ALL generated output — IR, CFGs, monitors, renders, fuzz output [gitignored]
├── docs/                   # FUZZING.md, README-CoreUtilTests.md
└── llvm/llvm-project/      # pinned LLVM 19.1.7 submodule (vendored; stays here, see note)
```

## Installation

> **LLVM project location:** The scripts expect `llvm-project` to be located at `mimicrymonitor/llvm/llvm-project/` (i.e., the `llvm/` subdirectory of this repo). If you place it elsewhere, you must manually update the `BUILD_DIR` variable in the relevant scripts (e.g., `pipeline/analyze.sh`, `pipeline/instrument.sh`).

### Quick Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/mimicrymonitor.git
   cd mimicrymonitor
   ```

2. Run the setup script, and follow the prompts:
   ```bash
   ./pipeline/setup.sh
   ```

## Usage

### Step 1: Prepare Input Files

1. Create or obtain two C programs:
    - Oracle Program (OP): The reference implementation with correct behavior
    - Program Under Analysis (PUA): The program to be verified

2Create a sigma pairing file that maps nodes between the two programs:
   ```
   (op_node_id1, pua_node_id1), (op_node_id2, pua_node_id2), ...
   ```

### Step 2: Run the Analysis Pipeline

You can run the entire pipeline with a single command. If you need certain files or libraries to be included at
compilation time, you can specify them with -IAnalyze, -Iinstrument

```bash
./pipeline/run-mimicry.sh -pua PATH/TO/pua.c -op PATH/TO/op.c -sigma  PATH/TO/sigma.txt (-IAnalyze PATH) (-Iinstrument PATH)
```

This will:
1. Analyze both programs to generate LLVM IR and CFGs
2. Build the monitor automaton
3. Instrument the PUA
4. Compile the instrumented program 
5. If desired, run the instrumented version

### Step-by-Step Execution

Alternatively, you can run each step manually:

#### Analysis

```bash
cd pipeline
./analyze.sh
```

This generates:
- LLVM IR files (`programOP.ll`, `programPUA.ll`)
- CFG dot files (`mainOP.dot`, `mainPUA.dot`) and PNG renders
- Def-use information (`defUseOP.txt`, `defUseUA.txt`)

#### Java Monitor Construction

```bash
# If using Maven
mvn -f monitor/pom.xml exec:java -Dexec.mainClass="org.mimicry.Main"

# If using Java directly
java -cp monitor/target/MM-1.0-SNAPSHOT.jar org.mimicry.Main
```

This creates a monitor automaton saved as `work/outputs/monitor.dot`.

#### Instrumentation

```bash
cd pipeline
./instrument.sh
```

This instruments the PUA with the monitor and compiles it.

#### Monitor Logging

You can enable runtime monitor logs with:

```bash
cd pipeline
./instrument.sh -log /tmp/mm_monitor.log
```

The log is now human-readable (no timestamp/pid prefix) and includes section headers/dividers when needed, for example:

```text
------------------------------------------------------------
NEW MONITORING ITERATION
------------------------------------------------------------
log file cleared for new iteration: /tmp/mm_monitor.log
------------------------------------------------------------
AUTOMATON SNAPSHOT
------------------------------------------------------------
init automaton: nodes=4, initial_node=1, policy=stop-iv
node 1: verdict=No Verdict yet, terminal=no, condition=(none), transitions=2
   transition: 1 --then--> 2
   transition: 1 --else--> 3
------------------------------------------------------------
MONITOR START
------------------------------------------------------------
start at node 1, verdict: No Verdict yet
instruction executed: i++, node: 4, verdict: No Verdict yet
------------------------------------------------------------
MONITOR ABORT
------------------------------------------------------------
ABORT: policy 'stop-iv' triggered at node 4 with verdict IV
```

### Step 3: Run the Instrumented Program

```bash
./instrumentedPUA params
```

The program will report any deviations from the expected behavior defined by the OP.

## Technical Details

### Automata Construction Process

1. **CFG Generation**: LLVM passes analyze both programs to generate control flow graphs and def-use chains
2. **Data Flow Tracking**: Data Flow Tracking Automata (DFTA) track read/write operations on shared variables
3. **Composition**: The Java program combines CFGs with DFTAs to create a unified monitor automaton
4. **Verdict Propagation**: States in the automaton are labeled with verdicts about PUA behavior
5. **Minimization**: The automaton is compacted to reduce size while preserving behavior

### Instrumentation

The LLVM pass:
1. Parses the monitor automaton
2. Identifies instrumentation points in the PUA
3. Inserts runtime verification code
4. Produces an executable that validates PUA behavior

### Reporter Architecture (New)

The monitor runtime now uses an explicit reporter pipeline, enabled only by instrumentation parameters.

1. **Reporter core (`mm_verdict_reporter`)**:
   - Keeps an in-memory list of reporters.
   - Exposes `mm_add_reporter`, `mm_clear_reporters`, `mm_report_verdict`, and `mm_report_abort`.
2. **Runtime-controlled registration (`monitor_runtime`)**:
   - `configureReporters()` is called from `initAutomaton()`.
   - Registration happens once per process (`reportersConfigured` guard).
   - No automatic constructor-based registration is used.
3. **Compile-time gates (set by `instrument.sh`)**:
   - `MM_ENABLE_LOG_REPORTER=1` only when `-log` is passed.
   - `MM_ENABLE_AFL_REPORTER=1` only when `-afl` is passed.
4. **Log reporter (`mm_log_reporter`)**:
   - Logs human-readable runtime events.
   - Clears the log at each new automaton iteration (`mm_log_clear_file`).
   - Adds section headers/dividers for important phases (snapshot, start, abort, terminal).
5. **AFL reporter (`mm_afl_reporter`)**:
   - Registered only when AFL mode is requested.
   - Uses weak AFL symbols and non-coverage attributes to avoid linker/runtime issues in helper code.

### Instrumentation Mechanic (New)

Current instrumentation behavior is split into two layers: LLVM IR instrumentation and runtime assembly/link configuration.

1. **IR instrumentation phase**:
   - `opt` loads `LLVMMimicryPasses` and runs `mimicry-instrument`.
   - The pass injects monitor calls and monitor-policy initialization into the generated IR.
2. **Runtime composition phase (in `instrument.sh`)**:
   - Always links `monitor_runtime.c` + `mm_verdict_reporter.c`.
   - Conditionally links `mm_log_reporter.c` when `-log` is set.
   - Conditionally enables AFL reporter when `-afl` is set.
3. **AFL-specific build detail**:
   - Final target is still compiled with `afl-clang-fast` in AFL mode.
   - `mm_afl_reporter.c` is compiled separately with `clang` and then linked, to prevent AFL self-instrumentation side effects.
4. **Runtime execution flow**:
   - `initAutomaton()` configures reporters, clears per-iteration logs (if enabled), logs automaton snapshot, and emits initial verdict.
   - `monitorAction()` logs each instruction transition, updates verdict, and reports abort/terminal states with explicit sections.

## Included tests:
In the examples/ dir there are a few test cases available. Most of them borrowed from the Core Utils GNU Project,
1. cat
2. timeout 

For them to work, you need to have a working coreutils dir and copy the OP and PUA files into their src dir. Otherwise the ll IR wont be able to compile, because of includes and such nonsense.
Later run the MM as usual:

   1. cat:
   ```
      ./pipeline/run-mimicry.sh -pua /PATH/TO/coreutils/src/catPUA.c 
                       -op /PATH/TO/coreutils/src/catOP.c 
                       -sigma examples/catCU/catSigma.txt 
                       -Ianalyze /PATH/TO/coreutils/lib                   # Include directory at the moment of analysis
                       -Iinstrument /PATH/TO/coreutils/lib/libcoreutils.a # Include directory at the moment onf instrumentation
   ```
   - Input for V verdict: 
   ```bash
    ./instrumentedPUA catTest.txt
  ```
   - Input for IV verdict: 
   ```bash
         # Open the same file twice with different file descriptors
            exec 3>file.txt
            exec 4<file.txt
         # Run cat with the input from fd 4 and output to fd 3
            ./instrumentedPUA <&4 >&3 
   ```
   2. timeout:
   ```
      ./pipeline/run-mimicry.sh -pua /PATH/TO/coreutils/src/timeoutPUA.c 
                       -op /PATH/TO/coreutils/src/timeout.c 
                       -sigma /PATH/TO/coreutils/feli/sigma.txt 
                       -Ianalyze /PATH/TO/coreutils/lib                   # Include directory at the moment of analysis
                       -Iinstrument /PATH/TO/coreutils/lib/libcoreutils.a # Include directory at the momento onf instrumentation
   ```
   - Input for V verdict: 
   ```bash
    ./instrumentedPUA 
   ```
   - Input for IV verdict: 
     ```bash
     ./instrumentedPUA 1 true
     ```
     
   3. demo (runs with demo files at /inputs):
   ```
      ./pipeline/run-mimicry.sh 
      
   ```
- Input for V verdict:
   ```bash
    ./instrumentedPUA -1  
   ```
  - Input for IV verdict:
    ```bash
    ./instrumentedPUA 1
    ```
  
     4. ls:
    ```
       ./pipeline/run-mimicry.sh  -pua /Users/felicitasgarcia/coreutils/src/lsPUA.c 
                         -op /Users/felicitasgarcia/coreutils/src/lsOP.c 
                         -sigma examples/lsCU/sigmaLs.txt 
                         -Ianalyze /Users/felicitasgarcia/coreutils/lib 
                         -Iinstrument /Users/felicitasgarcia/coreutils/lib/libcoreutils.a /Users/felicitasgarcia/coreutils/src/ls-ls.o /Users/felicitasgarcia/coreutils/src/version.o

    ```
    5. mv:
    ```
    ./pipeline/run-mimicry.sh  -pua /path/to/coreutils/src/mvPUA.c 
                      -op /path/to/coreutils/src/mvOP.c 
                      -sigma /Users/felicitasgarcia/TESIS/mimicrymonitor/examples/mvCU/mvSigma.txt 
                      -Ianalyze /path/to/coreutils/lib 
                      -Iinstrument /path/to/coreutils/src/copy.o /path/to/coreutils/src/remove.o /path/to/coreutils/src/version.o /path/to/coreutils/src/force-link.o /path/to/coreutils/src/cp-hash.o /path/to/coreutils/lib/libcoreutils.a
    ```
  
## Troubleshooting

### Common Issues

1. **LLVM Pass Build Errors**:
    - Ensure you have the correct LLVM version (19.1.7 recommended)
    - Check that LLVM development headers are available
    - Verify pass installation paths

2. **CFG Generation Issues**:
    - Check the `analyze.sh` script's output for errors
    - The script looks for generated dot files in system-dependent directories
    - Adjust paths if necessary

3. **Java Execution Errors**:
    - Ensure all required input files exist
    - Check file paths in the Java code

4. **Instrumentation Failures**:
    - Verify that the `opt` tool is available
    - Check that the monitor DOT file is properly formatted



## Thank you

```
                  ^~^  ,
                 ('Y') )
                 /   \/
                (\|||/) miau
```

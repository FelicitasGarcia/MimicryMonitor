```
▗▖  ▗▖▄ ▄▄▄▄  ▄ ▗▞▀▘ ▄▄▄ ▄   ▄  ▗▖  ▗▖ ▄▄▄  ▄▄▄▄  ▄    ■   ▄▄▄   ▄▄▄ 
▐▛▚▞▜▌▄ █ █ █ ▄ ▝▚▄▖█    █   █  ▐▛▚▞▜▌█   █ █   █ ▄ ▗▄▟▙▄▖█   █ █    
▐▌  ▐▌█ █   █ █     █     ▀▀▀█  ▐▌  ▐▌▀▄▄▄▀ █   █ █   ▐▌  ▀▄▄▄▀ █    
▐▌  ▐▌█       █          ▄   █  ▐▌  ▐▌            █   ▐▌             
                          ▀▀▀                         ▐▌             
```

# MimicryMonitor

MimicryMonitor builds a **runtime monitor** that checks a *Program Under Analysis* (PUA)
against a trusted *Oracle Program* (OP). The two programs share code (e.g. a patched vs.
original version of a coreutils tool); the monitor watches the PUA as it runs and decides
whether its behavior still matches the OP's model.

At runtime the monitor emits a **verdict**:

| Verdict | Meaning |
|---------|---------|
| **V**  (valid)   | The PUA's observed behavior is consistent with the OP model. |
| **IV** (invalid) | The PUA deviated from the OP model — a *mimicry* divergence was detected. |

---

## What it does (functionality)

Given an OP source file, a PUA source file, and a **sigma pairing** (which maps
corresponding program points between the two), MimicryMonitor:

1. **Analyzes both programs with LLVM** — compiles each to LLVM IR, extracts the
   control-flow graph (CFG) of `main`, and computes variable read/write (def-use)
   information with a custom LLVM pass.
2. **Reconstructs a source-level CFG** — the Java component maps each IR instruction back
   to its C source line and rebuilds one node per source statement, contracting away
   compiler-only blocks.
3. **Builds the monitor automaton** — it combines the OP and PUA CFGs with their def-use
   data and the sigma pairing, tracks variable consistency, labels and propagates
   **verdicts** across states, and minimizes the result.
4. **Instruments the PUA** — a second LLVM pass injects monitor calls into the PUA so that,
   as it executes, it drives the automaton and reports V / IV verdicts according to a
   chosen **policy**.

The end product is `instrumentedPUA`, a normal executable that self-checks at runtime.

### Pipeline at a glance

```
                inputs (OP.c, PUA.c, sigma.txt)
                            │
   ┌────────────────────────┼──────────────────────────┐
   │ 1. analyze   (pipeline/analyze.sh)                 │
   │    clang-19  → work/temps/*.ll      (LLVM IR)      │
   │    opt-19 dot-cfg → work/cfgs/*.dot (CFGs)         │
   │    opt-19 + LLVMMimicryPasses(defuse)             │
   │              → work/temps/defUse*.txt              │
   └────────────────────────┼──────────────────────────┘
                            │
   ┌────────────────────────┼──────────────────────────┐
   │ 2. construct (monitor/, Java)                      │
   │    CFG reconstruction → DFTA → composition →       │
   │    verdict labeling/propagation → minimization     │
   │              → work/outputs/monitor.dot            │
   └────────────────────────┼──────────────────────────┘
                            │
   ┌────────────────────────┼──────────────────────────┐
   │ 3. instrument (pipeline/instrument.sh)             │
   │    opt-19 + LLVMMimicryPasses(mimicry-instrument)  │
   │    + monitor runtime/reporters, link PUA           │
   │              → work/outputs/instrumentedPUA        │
   └────────────────────────┴──────────────────────────┘
```

All generated files land under `work/` (git-ignored).

---

## Prerequisites

- **LLVM 19.1.7** — vendored as a submodule and built by `setup.sh` (see the reproducibility note below)
- **clang-19** — used to emit LLVM IR (must match the LLVM/`opt` version)
- **Java JDK 22** and **Maven** — the monitor constructor (`monitor/`)
- **Graphviz** (`dot` on `PATH`) — renders the CFG / automaton PNGs
- **Ninja** — recommended for the LLVM build
- **AFL++** (`afl-clang-fast`, `afl-fuzz`) — only for fuzzing (see `docs/FUZZING.md`)

> **Reproducibility:** the LLVM toolchain is pinned to commit `llvmorg-19.1.7` in the
> `llvm/llvm-project` submodule and built locally, so `clang`/`opt`/the plugin behave
> identically across machines. The Mimicry passes are built **out-of-tree** against that
> pinned build (`instrumentation/CMakeLists.txt`) — fast to rebuild, no LLVM source edits.

---

## Installation

```bash
git clone <repo-url> mimicrymonitor
cd mimicrymonitor
./pipeline/setup.sh
```

`setup.sh` will:
1. Fetch/check out the pinned LLVM (`llvm/llvm-project`) and build it (one-time, slow).
2. Build the Mimicry passes out-of-tree → `llvm/llvm-project/build/lib/LLVMMimicryPasses.so`.
3. Build the Java monitor (`mvn -f monitor/pom.xml clean package`).
4. Optionally run the demo pipeline.

> The LLVM submodule must stay at `llvm/llvm-project/` — the build caches absolute paths,
> so moving it would require a full rebuild.

---

## Usage

### One-shot pipeline

```bash
./pipeline/run-mimicry.sh \
  -pua PATH/TO/pua.c \
  -op  PATH/TO/op.c \
  -sigma PATH/TO/sigma.txt \
  [-Ianalyze DIR ...] [-Iinstrument FILE ...] \
  [-policy stop-v|stop-iv|n] [-log [PATH]] [-afl] [-no-render]
```

Run with no arguments to use the demo inputs in `inputs/`:

```bash
./pipeline/run-mimicry.sh
```

> **Paths can be relative or absolute, and you can run the scripts from any directory.**
> All path arguments (`-pua`, `-op`, `-sigma`, `-Ianalyze`, `-Iinstrument`, `-log`, and
> `analyze.sh`/`instrument.sh`/`fuzz.sh` inputs) are resolved to absolute paths internally,
> relative to your current working directory. Each script also locates the repo root from
> its own location, so e.g. `cd examples && ../pipeline/analyze.sh -op catCU/catOP.c ...`
> works and still writes output to the repo-root `work/`.

#### Options

| Flag | Meaning |
|------|---------|
| `-pua PATH`            | PUA C source (default `inputs/programPUA.c`) |
| `-op PATH`             | OP C source (default `inputs/programOP.c`) |
| `-sigma PATH`          | Sigma pairing file (default `inputs/sigma.txt`) |
| `-Ianalyze DIR ...`    | Include dirs needed to compile the sources to IR |
| `-Iinstrument FILE ...`| Extra objects/libraries to link into `instrumentedPUA` |
| `-policy POLICY`       | `stop-v` (exit cleanly on V), `stop-iv` (exit cleanly on IV), `n` (run to completion) |
| `-log [PATH]`          | Enable the human-readable monitor log (default `/tmp/mm_monitor.log`) |
| `-afl`                 | Build with `afl-clang-fast` for fuzzing |
| `-no-render`           | Skip PNG rendering of intermediate graphs |

### The sigma pairing

A comma-separated list of `(op_node_id, pua_node_id)` pairs that tells the monitor which
OP program points correspond to which PUA program points:

```
(0, 0), (1, 1), (12, 14), ...
```

### Step-by-step (instead of the one-shot script)

```bash
# 1. Analyze (emits IR, CFGs, def-use into work/)
./pipeline/analyze.sh -op inputs/programOP.c -pua inputs/programPUA.c \
                      -sigma inputs/sigma.txt [-I DIR ...] [-no-render]

# 2. Build the monitor (reads work/, writes work/outputs/monitor.dot)
mvn -f monitor/pom.xml exec:java -Dexec.mainClass="org.mimicry.Main"

# 3. Instrument the PUA (reads monitor.dot, writes work/outputs/instrumentedPUA)
./pipeline/instrument.sh [-policy stop-v] [-log] [-afl] [-I FILE ...]
```

### Running the result

```bash
./work/outputs/instrumentedPUA <args>      # self-checks against the OP model
```

With `-log`, the monitor writes a readable trace (snapshot, per-instruction transitions,
and the abort/terminal verdict) to the log file.

---

## Outputs

Everything generated lives under `work/` (git-ignored, recreated each run):

| Path | Contents |
|------|----------|
| `work/temps/`   | LLVM IR (`*.ll`), def-use info, intermediate objects |
| `work/cfgs/`    | LLVM CFG dot files (`mainOP.dot`, `mainPUA.dot`) |
| `work/dots/`    | reconstructed CFGs and monitor-construction graphs (`.dot`) |
| `work/renders/` | PNG renders of the above |
| `work/outputs/` | `monitor.dot`, `instrumentedPUA`, logs |

---

## Project structure

```
mimicrymonitor/
├── monitor/                Java monitor constructor (Maven project, pkg org.mimicry)
│   ├── pom.xml
│   └── src/main/java/org/mimicry/   Automata, LLVMProcessing, MonitorConstructor, ...
├── instrumentation/        LLVM passes (out-of-tree) + C monitor runtime
│   ├── CMakeLists.txt              builds LLVMMimicryPasses.so against the pinned LLVM
│   ├── MimicryInstrument.cpp       the mimicry-instrument pass
│   ├── FeliDefUseInfo.cpp          the defuse pass
│   ├── include/llvm/Transforms/Mimicry/*.h
│   └── monitor_runtime.c, mm_verdict_reporter.c, mm_log_reporter.c, mm_afl_reporter.c
├── pipeline/               all scripts: setup, run-mimicry, analyze, instrument, fuzz
├── inputs/                 default programOP.c / programPUA.c / sigma.txt (demo)
├── examples/               extra targets (catCU, lsCU, mvCU, timeoutCU, ...)
├── evaluation/             tests/ (coreutils PUA test suites), seeds/ (AFL seeds),
│                           bench/ (targetbench — target-reachability benchmark)
├── work/                   ALL generated output [git-ignored]
├── docs/                   FUZZING.md, README-CoreUtilTests.md
└── llvm/llvm-project/      pinned LLVM 19.1.7 submodule (vendored; stays here)
```

---

## Worked examples

The `examples/` directory contains ready-made OP/PUA pairs (mostly from GNU coreutils).
Compiling these to IR needs a working coreutils checkout for the headers/objects, passed
via `-Ianalyze` (compile time) and `-Iinstrument` (link time).

**cat**

```bash
./pipeline/run-mimicry.sh \
  -pua examples/catCU/catPUA.c \
  -op  examples/catCU/catOP.c \
  -sigma examples/catCU/catSigma.txt \
  -Ianalyze    /PATH/TO/coreutils/src /PATH/TO/coreutils/lib \
  -Iinstrument /PATH/TO/coreutils/lib/libcoreutils.a /PATH/TO/coreutils/src/version.o \
  -policy stop-v
```

- **V verdict** (behaves like the OP):
  ```bash
  ./work/outputs/instrumentedPUA catTest.txt
  ```
- **IV verdict** (input file is also the output file — exercises the patched region):
  ```bash
  exec 3>file.txt; exec 4<file.txt
  ./work/outputs/instrumentedPUA <&4 >&3
  ```

**demo** (uses the bundled `inputs/`):

```bash
./pipeline/run-mimicry.sh
./work/outputs/instrumentedPUA -1   # V
./work/outputs/instrumentedPUA  1   # IV
```

---

## Fuzzing

The instrumented PUA can be fuzzed with AFL++ (build with `-afl`). See **`docs/FUZZING.md`**
for the full workflow (instrumented vs. plain modes, seeds, and reading crashes).
`evaluation/bench/targetbench.py` automates multi-trial runs and produces coverage/hit-rate
plots; see `evaluation/bench/README.md`.

---

## Runtime monitor internals

The monitor runtime uses an explicit **reporter pipeline**, enabled only by instrumentation flags:

- **Core (`mm_verdict_reporter`)** — keeps a reporter list; exposes `mm_add_reporter`,
  `mm_report_verdict`, `mm_report_abort`.
- **Registration (`monitor_runtime`)** — `configureReporters()` runs once from `initAutomaton()`.
- **Compile-time gates (set by `instrument.sh`)** — `MM_ENABLE_LOG_REPORTER` (`-log`),
  `MM_ENABLE_AFL_REPORTER` (`-afl`).
- **Log reporter (`mm_log_reporter`)** — human-readable trace, cleared per iteration, with
  section headers (snapshot / start / abort / terminal).
- **AFL reporter (`mm_afl_reporter`)** — registered only in AFL mode; compiled separately
  with plain `clang` to avoid AFL self-instrumentation.

`mm_afl_reporter.c` aside, instrumentation works in two layers: the `mimicry-instrument`
LLVM pass injects monitor calls + policy init into the IR, and `instrument.sh` links the
runtime and the requested reporters into the final binary.

---

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| Pass build errors | Confirm LLVM 19.1.7 is built and `llvm/llvm-project/build/lib/cmake/llvm` exists |
| Empty/garbage CFG | Make sure `analyze.sh` used **clang-19** (it must match `opt`); check its output for errors |
| Java can't find inputs | Re-run `analyze.sh` so generated files exist under `work/` (input paths can be relative or absolute, resolved automatically) |
| Instrumentation fails | Ensure `opt` and the plugin exist, and `work/outputs/monitor.dot` was produced |
| `dot` / render errors | Install Graphviz; PNGs are optional — use `-no-render` to skip |

---

```
                  ^~^  ,
                 ('Y') )
                 /   \/
                (\|||/) miau
```

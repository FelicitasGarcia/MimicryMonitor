# CoreUtils Testing Guide

This guide provides instructions for setting up and running tests for CoreUtils implementations, specifically focusing on PUA (Personal User Applications) versions of the standard utilities with runtime monitoring capabilities.

## Prerequisites

- Basic knowledge of Unix/Linux systems
- Git installed
- Build tools (GCC, Make, Autotools)
- LLVM/Clang for instrumentation
- Monitor instrumentation pass configured

## Setup Process

### 1. Clone the CoreUtils Repository

```bash
git clone https://github.com/coreutils/coreutils.git
cd coreutils
```

### 2. Follow the README-hacking Instructions

Execute the bootstrap process as described in the README-hacking file:

```bash
./bootstrap
./configure
make
```

### 3. Add Your PUA Executable

Place your instrumented PUA executable in the `coreutils/src` directory. Ensure the executable has been compiled with the monitoring instrumentation pass.

### 4. Modify the Test Configuration

Edit the `test/local.mk` file by adding your PUA command to the built_programs variable around line 68:

```make
built_programs='$(built_programs) $(single_binary_progs) cuPUA'
```

Replace "cuPUA" with the name of your specific utility (e.g., `lsPUA`, `catPUA`, etc.).

### 5. Clone Tests for Your Command

Copy the test directory for the original command and modify it for your PUA version:

```bash
cp -r tests/cu tests/cuPUA
```

### 6. Replace Command References

In the test files, replace all occurrences of the original command with your PUA version:

```bash
cd tests/cuPUA
sed -i 's/cu/cuPUA/g' *.sh
```
Beware of unintended replacements...
(TODO: A more sophisticated approach to replacing appearances).

### 7. Run Tests

To run a specific test:

```bash
make check TESTS=tests/cuPUA/specific_test.sh
```

To run all tests for your PUA command:

```bash
make check TESTS="tests/cuPUA/*.sh"
```

## Using the Test Helper Script

For your convenience, a script named `multiple_tests` is provided to run tests on a directory and collect results with detailed monitoring information.

### Usage

```bash
./multiple_tests <test_directory> [results_filename]
```

### Example

```bash
./multiple_tests tests/lsPUA ls_test_results
```

This will:
1. Execute all tests in the `tests/lsPUA` directory
2. Store results in `mimicrymonitor/work/outputs/ls_test_results`
3. Analyze monitor output for each test case
4. Provide detailed verdict information

## Interpreting Test Results

The test helper script provides comprehensive output that includes both traditional test results and runtime monitoring information.

### Test Result Format

```
Test Results for Program: lsPUA
========================================

test_basic.sh                  OK
----------------------------------------
  Test Case 1:              IV (Final)
  Test Case 2:              V (Early Abort)
  Test Case 3:              Completed normally

test_advanced.sh               FAIL
----------------------------------------
  Test Case 1:              V (Early Abort)
  Single Test Case:         Monitor Error
```

### Understanding Test Status Codes

- **0 (OK)**: Test passed successfully
- **1 (FAIL)**: Test failed
- **77 (SKIP)**: Test was skipped (usually due to missing dependencies)
- **99 (FATAL)**: Fatal error occurred during test execution

### Understanding Monitor Verdicts

#### Final Verdicts
- **IV (Final)**: Program reached an "Invalid" terminal state through normal execution
- **V (Final)**: Program reached a "Valid" terminal state through normal execution

#### Early Abort Cases
- **IV (Early Abort)**: Program was terminated early due to policy violation when IV verdict was reached
- **V (Early Abort)**: Program was terminated early due to policy violation when V verdict was reached

#### Other Monitor States
- **Completed normally**: Program finished execution without reaching a terminal automaton state
- **Monitor Error**: The monitor encountered an invalid state transition or other error
- **No monitor output**: No monitoring information was recorded (possible instrumentation issue)
- **Monitoring incomplete**: Monitoring started but didn't complete (possible program crash)
- **No monitoring activity**: Monitor initialized but no transitions were recorded
- **Monitor initialization error**: The automaton failed to initialize properly

### Monitor Policy Configuration

The monitoring behavior can be configured using the `-monitor-policy` flag during compilation:

- **`stop-v`**: Terminate program execution when verdict "V" is reached
- **`stop-iv`**: Terminate program execution when verdict "IV" is reached
- **`n` or empty**: Allow normal execution without early termination (default)

### Monitor Output File

Detailed monitoring information is logged to `/Users/felicitasgarcia/monitor_output.txt` (configurable in the source). This file:

- **Appends results** from multiple test runs
- **Separates executions** with timestamps and dividers
- **Provides detailed transition logs** for debugging
- **Records policy violations** and early termination reasons

#### Sample Monitor Output
```
================================
NEW EXECUTION - Tue May 27 10:30:45 2025
================================
Automaton initialized with 5 nodes. Initial state: 1
Monitor policy: stop-v
Continuing monitoring

--- Monitoring ---
Current state: 1
Verdict: 
Processing transition: cond
Transition successful. New state: 2

EARLY ABORT: Policy 'stop-v' triggered on verdict 'V'
Program terminating due to policy violation.
================================
```

### Test Case Analysis

Each test script may contain multiple test cases. The helper script automatically:

1. **Detects multiple executions** within a single test script
2. **Reports individual verdicts** for each test case
3. **Distinguishes between normal and early termination**
4. **Provides debugging information** for failed cases

### Troubleshooting Monitor Issues

If you see unexpected monitor states:

1. **"No monitor output"**: Check if the executable is properly instrumented
2. **"Monitor initialization error"**: Verify the automaton DOT file is valid and accessible
3. **"Monitoring incomplete"**: The program may have crashed before completing
4. **"Monitor Error"**: Invalid state transitions suggest automaton design issues

## Demo Tests

Pre-configured test directories are available in `evaluation/tests`. To use them:

1. Complete steps 1-2 from the setup process above
2. Copy the desired test directory to `coreutils/tests/`
3. Run the tests using the `multiple_tests` script or directly with `make check`

## Advanced Usage

### Running Tests with Different Policies

To test different monitoring policies, recompile your PUA executable with different policy settings:

```bash
# Compile with early abort on V verdict
clang -Xclang -load -Xclang MimicryInstrument.so -monitor-policy=stop-v ...

# Compile with early abort on IV verdict  
clang -Xclang -load -Xclang MimicryInstrument.so -monitor-policy=stop-iv ...
```

### Analyzing Specific Test Cases

To examine detailed execution traces for a specific test case, check the monitor output file after running the test.

## Notes

- The script runs from the parent directory of the specified test directory
- Test results are stored in `mimicrymonitor/work/outputs`
- Monitor output accumulates across multiple test runs for comparison
- Each test execution is clearly separated with timestamps in the monitor log

## Troubleshooting

If you encounter issues:
- Make sure your PUA executable has proper permissions and is properly instrumented
- Verify that the command name is correctly updated in all test files
- Check that the `local.mk` file has been properly modified
- Ensure the automaton DOT file is accessible and valid
- Verify monitor policy settings match your testing requirements

For additional help, refer to the CoreUtils documentation, check the monitor output file for detailed execution traces, or create an issue on the repository.
# CoreUtils Testing Guide

How to run a PUA (Program Under Analysis) build through the GNU coreutils
test suite, and how to read the runtime monitor's verdicts alongside the
usual pass/fail result. Complements `docs/FUZZING.md` (fuzzing) — this is
for coreutils' own `make check` regression tests.

## Prerequisites

- A coreutils checkout (see `README.md` for the general build/instrumentation
  prerequisites — LLVM 19.1.7, clang-19, the Mimicry passes)
- Build tools (GCC, Make, Autotools) to build coreutils itself

## Setup

### 1. Clone and bootstrap coreutils

```bash
git clone https://github.com/coreutils/coreutils.git
cd coreutils
./bootstrap
./configure
make
```

### 2. Add your instrumented PUA executable

Place the instrumented binary (built via `pipeline/run-mimicry.sh`, see the
root `README.md`) in `coreutils/src`, then register it as a built program in
`tests/local.mk`:

```make
built_programs='$(built_programs) $(single_binary_progs) cuPUA'
```

Replace `cuPUA` with the name of your specific utility (e.g. `lsPUA`, `catPUA`).

### 3. Clone the test directory for the original command

```bash
cp -r tests/cu tests/cuPUA
cd tests/cuPUA
sed -i 's/cu/cuPUA/g' *.sh   # check the diff — this can over-match
```

### 4. Run tests

```bash
make check TESTS=tests/cuPUA/specific_test.sh   # one test
make check TESTS="tests/cuPUA/*.sh"              # all tests for this PUA
```

## Using the test helper script (`pipeline/multiple_tests.sh`)

Runs every `*.sh` test in a directory and cross-references coreutils'
pass/fail result with the monitor's verdict for that execution.

```bash
./pipeline/multiple_tests.sh <test_directory> [results_filename]
# e.g.
./pipeline/multiple_tests.sh tests/lsPUA ls_test_results
```

Results are written to `mimicrymonitor/work/outputs/<results_filename>`
(default `results_<test_directory>.txt`).

> **Known issue:** the script reads the monitor's human-readable trace from
> a path hardcoded at the top of `multiple_tests.sh`
> (`MONITOR_OUTPUT="/Users/felicitasgarcia/monitor_output.txt"`) — a leftover
> from an earlier macOS setup. On Linux this path won't exist, so the
> per-test-case verdict breakdown will silently show "No monitor output
> available" even though `make check` results are still correct. Point that
> variable at wherever you configured the log reporter's output (see `-log`
> in `README.md`) before relying on the verdict breakdown.

### Sample output

```
Test Results for Program: lsPUA
========================================

test_basic.sh                  OK
----------------------------------------
  Test Case 1:              IV (Final)
  Test Case 2:              V (Early Abort)
  Test Case 3:              Completed normally
```

- **Status codes:** `0` OK, `1` FAIL, `77` SKIP (missing deps), `99` FATAL.
- **Verdict tags:** `IV`/`V` reached normally ("Final") or via early abort
  under a `stop-v`/`stop-iv` policy ("Early Abort"); or `Completed normally`
  (no terminal state reached), `Monitor Error` (invalid transition), `No
  monitor output` (instrumentation or path issue — see the known issue above).

## Demo tests

`evaluation/tests/` has pre-made test directories for several PUAs
(`catPUA`, `expandPUA`, `lsPUA`, `mvPUA`, `timeoutPUA`). Copy the one you
want into `coreutils/tests/` and run it with `multiple_tests.sh` or
`make check` directly.

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| "No monitor output available" for every case | Fix `MONITOR_OUTPUT` in `multiple_tests.sh` (see known issue above), and confirm the PUA was built with `-log` |
| `sed` renamed something it shouldn't have | Diff `tests/cuPUA` against `tests/cu` before committing |
| Test fails but monitor shows a normal verdict | The coreutils test itself is failing independently of the monitor — debug with `make check TESTS=... VERBOSE=yes` |

# Fuzzing with AFL++

Two fuzzing modes are supported:

| Mode | What runs | Crashes mean |
|------|-----------|--------------|
| **Instrumented** | PUA with Mimicry monitor embedded | PUA has a real bug (SIGFPE, SIGSEGV, …) that the monitor did not catch as IV |
| **Plain** | PUA compiled directly, no monitor | PUA has a real bug regardless of monitor behaviour |

Run both and compare crashes to understand which inputs are caught by the monitor vs. which ones bypass it and still crash.

---

## Prerequisites

- AFL++ installed and on `PATH` (`afl-clang-fast`, `afl-fuzz`)
- LLVM build complete (`setup.sh` ran successfully)
- Maven build complete (`mvn package` or `setup.sh`)

Fix the kernel core pattern once per boot (required for AFL to detect crashes):

```bash
echo core | sudo tee /proc/sys/kernel/core_pattern
```

---

## Mode 1 — Instrumented PUA (Mimicry monitor active)

### Step 1 — Run the full pipeline with AFL instrumentation

From the project root:

```bash
./run-mimicry.sh -afl -policy stop-v
```

`-policy stop-v` makes the monitor exit cleanly on a V verdict (AFL ignores clean exits).  
`-policy n` lets the program run to completion without monitor interference.  
`-policy stop-iv` makes the monitor exit cleanly on an IV verdict (use if IV itself is the signal of interest).

This script runs analyze → monitor construction → instrument in one shot.  
The output binary is `llvm/feli/outputs/instrumentedPUA`.

### Step 2 — Compile the AFL wrapper

The wrapper reads the fuzz input file and passes its content as `argv[1]` to `instrumentedPUA` (AFL passes a file path via `@@`, not a raw string).

```bash
afl-clang-fast llvm/feli/scripts/afl_fuzz_wrapper.c \
  -o llvm/feli/scripts/afl_fuzz_wrapper
```

Recompile the wrapper whenever `afl_fuzz_wrapper.c` changes. The `instrumentedPUA` path is the default target baked into the wrapper.

### Step 3 — Add seeds

Seeds live in `llvm/feli/afl_seeds/`. Each file contains one input (a plain integer string). Current seeds:

```
seed1    → "1"
seed127  → "127"
seed255  → "255"
seedNeg  → "-1"
```

Do **not** include inputs that always crash (e.g. `"0"` for this PUA — `atoi("0")=0` → division by zero on every run). AFL silently drops crashing seeds during calibration.

### Step 4 — Fuzz

```bash
# Run for 60 seconds, clean previous output
bash llvm/feli/scripts/fuzz.sh -t 60 -clean

# Run until Ctrl+C
bash llvm/feli/scripts/fuzz.sh

# Custom timeout, keep previous corpus
bash llvm/feli/scripts/fuzz.sh -t 120
```

Output goes to `llvm/feli/afl_out/`.

---

## Mode 2 — Plain PUA (no monitor)

No manual compilation needed. `fuzz.sh -plain` compiles everything automatically:

```bash
bash llvm/feli/scripts/fuzz.sh -plain -t 60 -clean
```

This will:
1. Compile `llvm/feli/inputs/programPUA.c` with `afl-clang-fast` → `llvm/feli/outputs/pua_plain`
2. Compile a wrapper pointing at `pua_plain` → `llvm/feli/scripts/afl_fuzz_wrapper_plain`
3. Run AFL with the plain wrapper

Output goes to `llvm/feli/afl_out_plain/`.

---

## fuzz.sh reference

```
Usage: bash llvm/feli/scripts/fuzz.sh [options]

Options:
  -plain       Fuzz plain PUA (no Mimicry monitor, AFL coverage only)
  -i DIR       Input seeds directory (default: llvm/feli/afl_seeds)
  -o DIR       Output directory (default: auto per mode)
  -t SECS      Stop after SECS seconds (default: run until Ctrl+C)
  -clean       Remove previous output before running
  -h           Show this help
```

---

## How the wrapper works

AFL replaces `@@` in the command with a path to a temp file containing the mutated input. Because the PUA reads its input from `argv[1]` (not from a file), a C wrapper is needed:

```
AFL → wrapper (argv[1] = /tmp/afl-tmp-XXXX)
        │
        ├─ reads file content into buf
        └─ execl(target, target, buf, NULL)
                 │
                 └─ target reads buf as argv[1]
```

The wrapper is compiled with `afl-clang-fast` so it owns the AFL fork server and coverage SHM. The exec'd target inherits the coverage SHM and writes its own coverage into it.

---

## Reading results

After a run, `fuzz.sh` prints a summary. You can also inspect manually:

```bash
# Crash inputs (instrumented run)
ls llvm/feli/afl_out/default/crashes/
cat llvm/feli/afl_out/default/crashes/id:000000,*

# Crash inputs (plain run)
ls llvm/feli/afl_out_plain/default/crashes/

# Stats
cat llvm/feli/afl_out/default/fuzzer_stats
```

AFL deduplicates crashes by coverage bitmap — only unique crash paths are saved, so 12 000 executions hitting the same bug still produce 1 saved crash file.

---

## Troubleshooting

| Symptom | Cause | Fix |
|---------|-------|-----|
| All seeds skip with "results in a crash" | Seeds always hit division by zero | Remove the crashing seed (e.g. `seed0`) |
| "Fork server handshake failed" | `AFL_DEFER_FORKSRV=1` set in the shell environment | Unset it: `unset AFL_DEFER_FORKSRV` |
| No crashes found despite obvious bug | `core_pattern` routes dumps through apport, delaying crash detection | `echo core \| sudo tee /proc/sys/kernel/core_pattern` |
| `afl-clang-fast not found` | AFL++ not on PATH | `export PATH=$PATH:/path/to/AFLplusplus` |
| Only 1 crash saved despite many inputs | AFL deduplicates by coverage fingerprint | Expected — unique crash paths, not total crash count |

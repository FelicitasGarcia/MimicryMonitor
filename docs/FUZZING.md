# Fuzzing with AFL++

`pipeline/fuzz.sh` drives AFL++ along two independent axes.

**Target** — which binary is fuzzed:

| Target | What runs | Crashes mean |
|--------|-----------|--------------|
| **Instrumented** (default) | PUA with the Mimicry monitor embedded (`work/outputs/instrumentedPUA`) | a real bug (SIGFPE/SIGSEGV) the monitor did not catch as IV |
| **Plain** (`-plain`) | PUA compiled directly, no monitor | a real bug regardless of monitor behaviour |

**Input delivery** (`-input`) — how AFL's mutated bytes reach the program:

| `-input` | AFL runs | Use for |
|----------|----------|---------|
| `argv` (default) | `wrapper @@` → bytes as `argv[1]` | the demo PUA (`pua <integer>`) |
| `file` | `prog [args] @@` (program opens the mutated file) | cat & co. reading a file |
| `stdin` | `prog [args]` (AFL feeds stdin) | cat & co. reading stdin |

Run both targets and compare crashes to see which inputs the monitor catches vs. which bypass it.

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
./pipeline/run-mimicry.sh -afl -policy stop-v
```

`-policy stop-v` makes the monitor exit cleanly on a V verdict (AFL ignores clean exits).  
`-policy n` lets the program run to completion without monitor interference.  
`-policy stop-iv` makes the monitor exit cleanly on an IV verdict (use if IV itself is the signal of interest).

This script runs analyze → monitor construction → instrument in one shot.  
The output binary is `work/outputs/instrumentedPUA`.

### Step 2 — Add seeds

Seeds live in `evaluation/seeds/` (one input per file). Match the corpus to the program
and the input mode:

- **demo PUA** (`-input argv`) — integer strings: `evaluation/seeds/` (`1`, `127`, `255`, `-1`).
- **cat** (`-input file`/`stdin`) — byte/text inputs: `evaluation/seeds-cat/`.

Do **not** include inputs that always crash (e.g. `"0"` for the demo PUA — `atoi("0")=0` →
division by zero on every run); AFL drops crashing seeds during calibration.

### Step 3 — Fuzz

`fuzz.sh` builds the argv wrapper automatically when needed — no manual compile step.

```bash
# demo PUA (argv): 60s, clean previous output
bash pipeline/fuzz.sh -t 60 -clean

# instrumented cat reading a file, with -A; seeds = byte corpus
bash pipeline/fuzz.sh -input file -targs "-A" -i evaluation/seeds-cat -t 60 -clean

# instrumented cat reading stdin
bash pipeline/fuzz.sh -input stdin -targs "-A" -i evaluation/seeds-cat -t 60 -clean
```

Output goes to `work/afl_out/`. (For cat, build the instrumented binary first with
`./pipeline/run-mimicry.sh -afl …`, see the cat example in the main README.)

---

## Mode 2 — Plain PUA (no monitor)

No manual compilation needed. `fuzz.sh -plain` compiles everything automatically:

```bash
bash pipeline/fuzz.sh -plain -t 60 -clean
```

`fuzz.sh -plain` compiles the target from source (default `inputs/programPUA.c`) and fuzzes
it. The **input mode** is independent of `-plain`:

```bash
# demo PUA, plain, argv input (default)
bash pipeline/fuzz.sh -plain -t 60 -clean

# plain cat reading stdin — needs its headers (-I) and link objects (-link)
bash pipeline/fuzz.sh -plain -input stdin -targs "-A" \
  -pua  examples/catCU/catPUA.c \
  -I    /PATH/TO/coreutils/src /PATH/TO/coreutils/lib \
  -link /PATH/TO/coreutils/lib/libcoreutils.a /PATH/TO/coreutils/src/version.o \
  -i evaluation/seeds-cat -t 60 -clean
```

Output goes to `work/afl_out_plain/`. (`-pua`/`-I`/`-link` apply to `-plain` only.)

---

## fuzz.sh reference

```
Usage: bash pipeline/fuzz.sh [options]

Target:
  -plain          Fuzz the plain PUA (no monitor); compiled from -pua
  (default)       Fuzz work/outputs/instrumentedPUA (built by instrument.sh -afl)

Input delivery:
  -input MODE     argv (default) | file | stdin
  -targs "ARGS"   Args passed to the program in file/stdin modes (e.g. "-A")

Plain-compile (only with -plain):
  -pua PATH       PUA source to compile (default: inputs/programPUA.c)
  -I DIR [DIR..]  Include dirs for the compile (e.g. coreutils headers)
  -link F [F..]   Extra objects/libraries to link (e.g. libcoreutils.a version.o)

Run:
  -i DIR          Input seeds directory (default: evaluation/seeds)
  -o DIR          Output directory (default: auto per target)
  -t SECS         Stop after SECS seconds (default: run until Ctrl+C)
  -clean          Remove previous output before running
  -h              Show this help
```

---

## How the `argv` wrapper works

In `-input argv` mode, AFL replaces `@@` with a path to a temp file containing the mutated input. Because the demo PUA reads its input from `argv[1]` (not from a file), a small C wrapper bridges the two (`file/stdin` modes skip the wrapper and run the program directly):

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
ls work/afl_out/default/crashes/
cat work/afl_out/default/crashes/id:000000,*

# Crash inputs (plain run)
ls work/afl_out_plain/default/crashes/

# Stats
cat work/afl_out/default/fuzzer_stats
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

# Fuzzing with AFL++

`pipeline/fuzz.sh` drives AFL++ along two independent axes.

**Target** — which binary is fuzzed:

| Target | What runs | Crashes mean |
|--------|-----------|--------------|
| **Instrumented** (default) | PUA with the Mimicry monitor embedded (`work/outputs/instrumentedPUA`) | a real bug the monitor did not catch as IV |
| **Plain** (`-plain`) | PUA compiled directly, no monitor | a real bug regardless of monitor behaviour |

**Input delivery** (`-input`) — how AFL's mutated bytes reach the program:

| `-input` | AFL runs | Use for |
|----------|----------|---------|
| `argv` (default) | `wrapper @@` → bytes as `argv[1]` | the demo PUA (`pua <integer>`) |
| `file` | `prog [args] @@` (program opens the mutated file) | cat, expand and co. reading a file |
| `stdin` | `prog [args]` (AFL feeds stdin) | cat and co. reading stdin |

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

## Target reachability telemetry (MM\_STOP\_LOG)

Both the instrumented and plain builds support a lightweight per-execution log.
Set `MM_STOP_LOG` to a file path before fuzzing and each process exit appends one line:

```
early=N verdict=X steps=N target=N
```

- `target=1` — the instrumented patch was reached during that execution.
- `target=0` — it was not.

In the instrumented build this is written by `monitor_runtime.c`.  
In the plain build it is written by `instrumentation/mm_target_stub.c` (linked via `-link`).

```bash
export MM_STOP_LOG=/tmp/my_run.txt
# … run fuzz.sh …
grep -c "target=1" /tmp/my_run.txt   # hits
grep -c "target=0" /tmp/my_run.txt   # misses
```

---

## Example — catCU (file input, with monitor)

### Step 1 — Build

```bash
./pipeline/run-mimicry.sh -afl -policy stop-v \
  -pua   examples/catCU/catPUA.c \
  -op    examples/catCU/catOP.c \
  -sigma examples/catCU/catSigma.txt \
  -Ianalyze    /PATH/TO/coreutils/src /PATH/TO/coreutils/lib \
  -Iinstrument /PATH/TO/coreutils/lib/libcoreutils.a \
               /PATH/TO/coreutils/src/version.o \
  -log   work/outputs/log.txt -policy stop-v
```

### Step 2 — Fuzz

```bash
bash pipeline/fuzz.sh -input file -targs "-A" -i evaluation/seeds-cat -t 60 -clean
```

### Step 3 — Plain baseline

```bash
bash pipeline/fuzz.sh -plain -input file -targs "-A" \
  -pua  examples/catCU/catPUA.c \
  -I    /PATH/TO/coreutils/src /PATH/TO/coreutils/lib \
  -link /PATH/TO/coreutils/lib/libcoreutils.a \
        /PATH/TO/coreutils/src/version.o \
  -i evaluation/seeds-cat -t 60 -clean
```

---

## Example — expandCU (tab-expansion patch, target reachability)

expandCU measures how quickly AFL finds inputs that reach the tab-expansion
patch (`if (c == '\t')` in `main`). A probe sets `mm_target_reached = 1`
on every execution that triggers the branch; `MM_STOP_LOG` records the result.

Seeds in `evaluation/seeds-expand/` cover tab inputs, no-tab inputs, and mixed.

### Step 1 — Build instrumented binary

```bash
./pipeline/run-mimicry.sh -afl -policy stop-v \
  -pua   examples/expandCU/expandPUA.c \
  -op    examples/expandCU/expandOP.c \
  -sigma examples/expandCU/expandSigma.txt \
  -Ianalyze    /PATH/TO/coreutils/src /PATH/TO/coreutils/lib \
  -Iinstrument /PATH/TO/coreutils/src/expand-common.o \
               /PATH/TO/coreutils/lib/libcoreutils.a \
               /PATH/TO/coreutils/src/version.o
```

> **Link order matters**: `expand-common.o` must come before `libcoreutils.a`
> because the archive resolves `expand-common.o`'s dependencies (`fadvise`,
> `rpl_fopen`).

### Step 2 — Fuzz instrumented

```bash
export MM_STOP_LOG=/tmp/expand_instrumented_log.txt
rm -f $MM_STOP_LOG
bash pipeline/fuzz.sh -input file -i evaluation/seeds-expand -t 60 -clean
```

### Step 3 — Fuzz plain

```bash
export MM_STOP_LOG=/tmp/expand_plain_log.txt
rm -f $MM_STOP_LOG
bash pipeline/fuzz.sh -plain -input file \
  -pua  examples/expandCU/expandPUA.c \
  -I    /PATH/TO/coreutils/src /PATH/TO/coreutils/lib \
  -link instrumentation/mm_target_stub.c \
        /PATH/TO/coreutils/src/expand-common.o \
        /PATH/TO/coreutils/lib/libcoreutils.a \
        /PATH/TO/coreutils/src/version.o \
  -i evaluation/seeds-expand -t 60 -clean
```

### Step 4 — Compare results

```bash
echo "=== Instrumented ==="
echo "hit:   $(grep -c 'target=1' /tmp/expand_instrumented_log.txt)"
echo "miss:  $(grep -c 'target=0' /tmp/expand_instrumented_log.txt)"
echo "total: $(wc -l < /tmp/expand_instrumented_log.txt)"

echo "=== Plain ==="
echo "hit:   $(grep -c 'target=1' /tmp/expand_plain_log.txt)"
echo "miss:  $(grep -c 'target=0' /tmp/expand_plain_log.txt)"
echo "total: $(wc -l < /tmp/expand_plain_log.txt)"
```

### Step 5 — Automated benchmark with plots

`evaluation/bench/targetbench.py` runs both variants for N trials, parses the
logs and AFL's `plot_data`, prints a summary table, and saves a 4-panel PNG:

```bash
evaluation/bench/.venv/bin/python evaluation/bench/targetbench.py \
  --trials 3 --time 60
```

Output: `evaluation/bench/results/targetbench/targetbench.png`

| Panel | Shows |
|-------|-------|
| Cumulative hits over executions | mean + shaded min/max across trials |
| Hit rate per trial | grouped bar chart (instrumented vs plain) |
| Exec/sec box plot | monitor overhead vs plain throughput |
| AFL edge coverage over time | exploration speed |

Options: `--skip-build` (binary already built), `--skip-fuzz` (re-plot only),
`--dry-run` (print commands without running).

---

## Grammar-guided fuzzing (AFL Grammar Mutator)

`fuzz.sh` supports the [AFL Grammar Mutator](https://github.com/AFLplusplus/Grammar-Mutator)
via three flags. The mutator generates structurally valid inputs from a grammar (e.g. well-formed
`cat` command lines), which helps AFL explore more meaningful program paths than random
byte-level mutations alone.

### Prerequisites

The grammar mutator must already be built for your target grammar. The cat grammar is
pre-built at `/home/felicitas/Grammar-Mutator/`:

```
libgrammarmutator-cat.so   ← custom mutator loaded by AFL++
grammar_generator-cat       ← (re-)generates seeds + tree cache
seeds-cat/                  ← 100 pre-generated seed inputs
trees-cat/                  ← tree representations for those seeds
```

### Flags

| Flag | Meaning |
|------|---------|
| `-grammar LIB`   | Path to `libgrammarmutator-*.so`; sets `AFL_CUSTOM_MUTATOR_LIBRARY` |
| `-grammar-only`  | Also set `AFL_CUSTOM_MUTATOR_ONLY=1` — suppress AFL's own byte mutations |
| `-trees DIR`     | Pre-generated tree cache; copied to `<out>/default/trees/` before fuzzing starts |

> **Why copy the trees?** The grammar mutator stores tree representations of each seed
> alongside the AFL output queue. Pre-seeding `<out>/default/trees/` with the matching
> tree files for your seeds avoids the mutator having to re-parse every seed from scratch
> on the first run, which matters for seeds that don't parse cleanly as plain text.

### Example — catCU with grammar-guided mutations

```bash
# 1. Build the instrumented binary (once)
./pipeline/run-mimicry.sh -afl -policy stop-v \
  -pua   examples/catCU/catPUA.c \
  -op    examples/catCU/catOP.c \
  -sigma examples/catCU/catSigma.txt \
  -Ianalyze    /PATH/TO/coreutils/src /PATH/TO/coreutils/lib \
  -Iinstrument /PATH/TO/coreutils/lib/libcoreutils.a \
               /PATH/TO/coreutils/src/version.o

# 2. Fuzz with grammar mutations (combined with AFL's own mutations)
bash pipeline/fuzz.sh \
  -input file \
  -i /home/felicitas/Grammar-Mutator/seeds-cat \
  -grammar /home/felicitas/Grammar-Mutator/libgrammarmutator-cat.so \
  -trees   /home/felicitas/Grammar-Mutator/trees-cat \
  -t 120 -clean

# 3. Grammar mutations only (no random byte mutations from AFL)
bash pipeline/fuzz.sh \
  -input file \
  -i /home/felicitas/Grammar-Mutator/seeds-cat \
  -grammar      /home/felicitas/Grammar-Mutator/libgrammarmutator-cat.so \
  -grammar-only \
  -trees        /home/felicitas/Grammar-Mutator/trees-cat \
  -t 120 -clean
```

The same flags work with `-plain` for the baseline:

```bash
bash pipeline/fuzz.sh -plain -input file \
  -pua  examples/catCU/catPUA.c \
  -I    /PATH/TO/coreutils/src /PATH/TO/coreutils/lib \
  -link /PATH/TO/coreutils/lib/libcoreutils.a /PATH/TO/coreutils/src/version.o \
  -i    /home/felicitas/Grammar-Mutator/seeds-cat \
  -grammar      /home/felicitas/Grammar-Mutator/libgrammarmutator-cat.so \
  -grammar-only \
  -trees        /home/felicitas/Grammar-Mutator/trees-cat \
  -t 120 -clean
```

### Regenerating seeds

```bash
cd /home/felicitas/Grammar-Mutator
./grammar_generator-cat 100 1000 seeds-cat trees-cat
```

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

## Reading AFL results

After a run, `fuzz.sh` prints a summary. You can also inspect manually:

```bash
# Crash inputs (instrumented run)
ls work/afl_out/default/crashes/

# Crash inputs (plain run)
ls work/afl_out_plain/default/crashes/

# Full stats
cat work/afl_out/default/fuzzer_stats

# Edge coverage / timing
cat work/afl_out/default/plot_data
```

AFL deduplicates crashes by coverage bitmap — only unique crash paths are saved.

---

## Troubleshooting

| Symptom | Cause | Fix |
|---------|-------|-----|
| All seeds skip with "results in a crash" | Seeds always crash | Remove the crashing seed |
| "Fork server handshake failed" | `AFL_DEFER_FORKSRV=1` in environment | `unset AFL_DEFER_FORKSRV` |
| No crashes despite obvious bug | `core_pattern` routes dumps through apport | `echo core \| sudo tee /proc/sys/kernel/core_pattern` |
| `afl-clang-fast not found` | AFL++ not on PATH | `export PATH=$PATH:/path/to/AFLplusplus` |
| Undefined reference to `mm_target_reached` (plain build) | Stub not linked | Add `instrumentation/mm_target_stub.c` to `-link` |
| Undefined reference to `fadvise` / `rpl_fopen` | Wrong link order for expand | Put `expand-common.o` **before** `libcoreutils.a` |
| Only 1 crash saved despite many inputs | AFL deduplicates by coverage fingerprint | Expected behaviour |

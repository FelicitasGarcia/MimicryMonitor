# Fuzzing efficiency benchmark

Measures whether fuzzing the **instrumented** PUA (Mimicry monitor embedded) finds
crashes faster / more efficiently than the **plain** PUA (no monitor).

It runs N independent AFL++ trials of each target for a fixed time budget (via
`pipeline/fuzz.sh`, reusing its build + input-delivery logic), parses AFL's per-trial
`plot_data` time series, aggregates across trials, and produces graphs + stats.

## Setup (once)

```bash
python3 -m venv evaluation/bench/.venv
evaluation/bench/.venv/bin/pip install matplotlib
```

Then run via the launcher (uses the venv automatically):

```bash
evaluation/bench/fuzzbench --help
```

## Prerequisites for a valid run

1. **Crash detection** — AFL needs the kernel core pattern set to `core` (once per boot):
   ```bash
   echo core | sudo tee /proc/sys/kernel/core_pattern
   ```
   The tool warns if this isn't set; without it, crashes are missed and results are invalid.
2. **Instrumented binary built** (for the `instrumented` arm):
   ```bash
   ./pipeline/run-mimicry.sh -afl -policy stop-v \
     -pua examples/catCU/catPUA.c -op examples/catCU/catOP.c -sigma examples/catCU/catSigma.txt \
     -Ianalyze /PATH/coreutils/src /PATH/coreutils/lib \
     -Iinstrument /PATH/coreutils/lib/libcoreutils.a /PATH/coreutils/src/version.o
   ```
   The `plain` arm is compiled by the benchmark itself from `--plain-pua` (+ `--plain-include`/`--plain-link`).

## Usage

Fuzz **cat**, instrumented vs plain, file input, with `-A`:

```bash
evaluation/bench/fuzzbench \
  --seeds evaluation/seeds-cat --input file --targs=-A \
  --trials 5 --time 120 \
  --plain-pua examples/catCU/catPUA.c \
  --plain-include /PATH/coreutils/src /PATH/coreutils/lib \
  --plain-link /PATH/coreutils/lib/libcoreutils.a /PATH/coreutils/src/version.o
```

Other handy forms:

```bash
# only one arm
evaluation/bench/fuzzbench --targets plain  ...

# demo PUA (integer on argv)
evaluation/bench/fuzzbench --targets instrumented plain --input argv --seeds evaluation/seeds

# re-plot from an existing results dir without re-running
evaluation/bench/fuzzbench --plot-only --results evaluation/bench/results

# preview the exact fuzz.sh commands without running
evaluation/bench/fuzzbench --dry-run ...
```

## Options

| Flag | Meaning |
|------|---------|
| `--time S`           | seconds per trial (default 120) |
| `--trials N`         | trials per target (default 5) — more trials = more reliable averages |
| `--seeds DIR`        | seed corpus (default `evaluation/seeds-cat`) |
| `--input MODE`       | `argv` \| `file` \| `stdin` (how mutations reach the program) |
| `--targs ARGS`       | program args for file/stdin modes. For dash args use `=`, e.g. `--targs=-A` (argparse rejects `--targs "-A"`) |
| `--targets ...`      | subset of `instrumented plain` (default both) |
| `--plain-pua PATH`   | PUA source compiled for the plain arm |
| `--plain-include ...`| include dirs for the plain compile |
| `--plain-link ...`   | extra objects/libs to link (e.g. `libcoreutils.a version.o`) |
| `--results DIR`      | output dir (default `evaluation/bench/results`) |
| `--plot-only`        | parse + plot existing results, no fuzzing |
| `--dry-run`          | print commands only |

## Outputs (in `--results`)

- `fuzzbench.png` — 4 panels: cumulative crashes vs time, edge coverage vs time,
  time-to-first-crash per trial, and mean throughput (execs/sec).
- `summary.json` / `summary.csv` — per-target metrics.
- `<target>/t<i>/` — each trial's full AFL output dir (incl. `default/plot_data`, `fuzz.log`).

## How to read it

- **Time-to-first-crash (TTFC)** — the headline "faster?" metric (wall-clock).
- **Execs-to-first-crash** — efficiency per execution; removes the throughput confound
  (the monitor makes each run slower, so a fair "smarter?" comparison normalizes by execs).
- **Detection rate** — fraction of trials that found any crash within the budget.
- **Throughput** — execs/sec; expect the instrumented target to be slower (monitor overhead).
- **Verdict** — printed when both arms have crashing trials, incl. a Mann-Whitney U
  p-value on TTFC (needs ≥3 crashing trials per arm).

Fuzzing is noisy — prefer several trials and a budget long enough that both arms
actually crash (otherwise TTFC is censored and the comparison is weak).

---

# Monitor early-stop stats (`stopstats`)

Separate tool that answers: **how often, and how early, does the monitor stop the
instrumented program early** under its policy (e.g. `stop-v`)?

AFL can't see this — a policy stop is a clean `exit()`, indistinguishable from
normal completion. So the monitor runtime records it itself: when
`$MM_STOP_LOG` is set, each run appends one line
`early=<0|1> verdict=<V|IV|NV> steps=<n>` (the telemetry hook in
`instrumentation/monitor_runtime.c`; zero overhead when the env var is unset).

`stopstats` replays a corpus through the instrumented binary with that env var
set, then aggregates.

```bash
# Replay the instrumented corpus a fuzzbench run produced
evaluation/bench/stopstats --results evaluation/bench/results --input file --targs=-A

# Or point at any dir(s) of inputs
evaluation/bench/stopstats --corpus evaluation/seeds-cat --input file --targs=-A
```

Key options: `--bin` (default `work/outputs/instrumentedPUA`), `--corpus DIR…`,
`--results <fuzzbench dir>` (auto-pulls `instrumented/t*/default/{queue,crashes}`),
`--input argv|file|stdin`, `--targs`, `--timeout`, `--limit`.

Outputs (in `--out`, default `results/stopstats/`): `stopstats.png` (outcome bars +
a `steps`-at-stop histogram), `summary.json`, `details.csv`. The summary gives the
**early-stop rate** (split V/IV) and the **steps-at-stop** distribution (how early).

Prereq: rebuild the instrumented binary (`run-mimicry.sh -afl …`) so it contains
the telemetry hook. If every run shows `no_record`, the binary predates the hook
(or every input crashed).

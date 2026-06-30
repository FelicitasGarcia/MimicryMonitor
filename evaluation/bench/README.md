# Target-reachability benchmark (`targetbench`)

Measures how quickly instrumented vs. plain AFL++ reaches the patched region
of the PUA (`mm_target_reached=1`).

Both fuzz sessions write per-execution telemetry to `MM_STOP_LOG` via
`monitor_runtime.c` (instrumented) or `mm_target_stub.c` (plain). Each line:

```
early=N verdict=X steps=N target=N
```

The script runs N trials of each variant, parses the stop-logs and AFL's
`plot_data`, prints a summary table, and saves a 4-panel PNG.

## Setup (once)

```bash
python3 -m venv evaluation/bench/.venv
evaluation/bench/.venv/bin/pip install matplotlib numpy
```

## Usage

```bash
# demo integer-classifier PUA (argv input)
evaluation/bench/.venv/bin/python evaluation/bench/targetbench.py \
  --example default --trials 3 --time 60

# expandCU (file input; needs coreutils build)
evaluation/bench/.venv/bin/python evaluation/bench/targetbench.py \
  --example expandcu --trials 3 --time 60
```

Useful flags:

| Flag | Meaning |
|------|---------|
| `--trials N`    | trials per target (default 5) |
| `--time S`      | seconds per AFL trial (default 60) |
| `--example`     | `default` \| `expandcu` |
| `--skip-build`  | binary already built, skip `run-mimicry.sh` |
| `--skip-fuzz`   | re-plot from existing results only |
| `--dry-run`     | print commands without running |

## Output panels

Output PNG: `evaluation/bench/results/targetbench/targetbench.png`

| Panel | Shows |
|-------|-------|
| Cumulative hits over executions | mean + shaded min/max across trials |
| Hit rate per trial              | grouped bar chart (instrumented vs plain) |
| Exec/sec box plot               | monitor overhead vs plain throughput |
| AFL edge coverage over time     | exploration speed |

## Prerequisites

- AFL++ on `PATH` (`afl-clang-fast`, `afl-fuzz`)
- LLVM + Maven builds complete (`./pipeline/setup.sh`)
- Kernel core pattern set once per boot:
  ```bash
  echo core | sudo tee /proc/sys/kernel/core_pattern
  ```

See **`docs/FUZZING.md`** for fuzz.sh options and how to interpret AFL output.

# Target-reachability benchmark (`targetbench`)

Scripts are grouped by which research question they serve, mirroring
`results/rq1_effect/`, `results/rq2_overhead/`, `results/rq3_genealogy/`:

| Folder / file | Purpose | Depends on |
|---|---|---|
| `rq1_effect/targetbench.py` | Core campaign runner: instrumented vs. plain, N trials | `notion/notion_publish.py` (optional `--notion`) |
| `rq1_effect/run_iv_feedback_experiment.py` | 4-condition A/B/C/D IV-feedback experiment | `rq1_effect/targetbench.py` |
| `rq2_overhead/overhead_micro.py` | Direct-replay CPU/wall-time overhead micro-benchmark | — |
| `rq2_overhead/build_seed_pool.py` | Pools/dedupes AFL queues across campaigns for `overhead_micro.py --queue-dir` | — |
| `rq3_genealogy/afl_provenance.py` | Traces one queue entry's AFL ancestry | — |
| `rq3_genealogy/afl_provenance_label.py` | Labels queue entries by target-hit descent | `rq2_overhead/overhead_micro.py` (wrapper builder) |
| `rq3_genealogy/afl_provenance_export.py` | Exports ancestry as CSV edges + DOT graph | `afl_provenance.py`, `afl_provenance_label.py` |
| `rq3_genealogy/tests/test_afl_provenance.py` | Unit tests for `afl_provenance.py` | `afl_provenance.py` |
| `notion/notion_publish.py` | Publishes a campaign's toggle (chart + table) to Notion | — |
| `notion/notion_panorama.py` | Idempotent upsert into the Notion panorama table | used by `notion_publish.py` |
| `campaign_dashboard.py` | Live terminal dashboard watching a running campaign | — |
| `sync_context.py` | Regenerates `CLAUDE.md`'s `AUTO` block from repo state | — |

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
evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/targetbench.py \
  --example default --trials 3 --time 60

# expandCU (file input; needs coreutils build)
evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/targetbench.py \
  --example expandcu --trials 3 --time 60
```

Useful flags:

| Flag | Meaning |
|------|---------|
| `--trials N`      | trials per target (default 5) |
| `--time S`        | seconds per AFL trial (default 60) |
| `--example`       | `default` \| `expandcu` \| `cat` |
| `--seeds DIR`     | override seed directory |
| `--skip-build`    | binary already built, skip `run-mimicry.sh` |
| `--skip-fuzz`     | re-plot from existing results only |
| `--dry-run`       | print commands without running |
| `--grammar LIB`   | path to `libgrammarmutator-*.so`; enables grammar-guided mutations |
| `--grammar-only`  | suppress AFL's own byte mutations (`AFL_CUSTOM_MUTATOR_ONLY=1`) |
| `--trees DIR`     | pre-generated tree cache dir (passed to `fuzz.sh -trees`) |

**Grammar Mutator example (catCU):**

```bash
evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/targetbench.py \
  --example cat --trials 3 --time 120 \
  --seeds  /home/felicitas/Grammar-Mutator/seeds-cat \
  --grammar      /home/felicitas/Grammar-Mutator/libgrammarmutator-cat.so \
  --grammar-only \
  --trees        /home/felicitas/Grammar-Mutator/trees-cat
```

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

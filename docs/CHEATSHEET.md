# catCU / IV-feedback experimentation — command cheatsheet

Quick reference for the commands used to run and inspect the cat_sleep /
IV-feedback experiments. All commands run from the repo root.

## Single campaign (targetbench.py) — cat_sleep, instrumented vs plain

Fresh run (10 trials × 1800s, sleep-injected cat):
```bash
evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/targetbench.py \
  --example cat_sleep --trials 10 --time 1800 --policy stop-v \
  --results evaluation/bench/results/V_sleep/cat_sleep
```

Re-render report.md + PNG from existing trial data, no re-fuzzing
(use after editing `targetbench.py`'s plotting code, or just to redraw):
```bash
evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/targetbench.py \
  --example cat_sleep --trials 10 --time 1800 --policy stop-v \
  --results evaluation/bench/results/V_sleep/cat_sleep \
  --skip-fuzz --skip-build
```

Add `--no-grammar` to either command to fuzz with plain AFL++ mutations
instead of the grammar mutator.

## IV-feedback experiment (run_iv_feedback_experiment.py) — 4 conditions

Conditions: `stop_only`, `fb_only`, `fb_stop` (each its own instrumented
build), `none` (one shared plain AFL baseline, fuzzed once, not per-arm).

Fresh run:
```bash
evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/run_iv_feedback_experiment.py \
  --example cat_sleep --trials 10 --time 1800 \
  --experiment-dir 2026-08-03_10x1800s_abcd-only-sleep
```

Same, but plain AFL++ mutations instead of the grammar mutator:
```bash
evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/run_iv_feedback_experiment.py \
  --example cat_sleep --trials 10 --time 1800 \
  --experiment-dir 2026-08-03_10x1800s_abcd-only-sleep-no-grammar --no-grammar
```

Re-render the combined comparison chart + summary table + per-condition
reports from existing trial data (after Ctrl-C, or just to redraw):
```bash
evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/run_iv_feedback_experiment.py \
  --example cat_sleep --trials 10 --time 1800 \
  --experiment-dir 2026-08-03_10x1800s_abcd-only-sleep --skip-fuzz
```

Results land in `evaluation/bench/results/iv_feedback/<experiment-dir>/`:
- `<condition>/report.md`, `<condition>/cat_sleep.png` — per-condition detail
- `iv_feedback_comparison.png` — 4-bar campaign totals + ranked hit rate +
  throughput + summary table
- `iv_feedback_summary.md` — same summary table as markdown

## Live dashboard (campaign_dashboard.py)

```bash
evaluation/bench/.venv/bin/python evaluation/bench/campaign_dashboard.py
```

Run in a real terminal (not piped). It's read-only and just watches
whatever's in `CAMPAIGNS` at the top of the file — **edit `_EXP` and
`CAMPAIGNS` by hand** to point at a new experiment/campaign dir before
watching it; nothing is auto-detected. Each `CAMPAIGNS` row now also lists
which target(s) actually exist on disk for it (`["instrumented"]`,
`["plain"]`, or both) — get this wrong and a row will either never show
`COMPLETE` or show a bogus perpetual "pending" line.

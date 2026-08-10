#!/usr/bin/env python3
"""
build_seed_pool.py — merge AFL queue/ dirs from many already-run campaigns
into one deduplicated pool, for use as overhead_micro.py's --queue-dir.

Why: overhead_micro.py's regression (steps vs Δtime) is only well-constrained
if the sampled inputs span a wide range of automaton depth. A single AFL
campaign's queue/ tends to be narrow (correlated mutations from one run).
This script pools queue/ dirs across many independent campaigns — different
seeds, different AFL configs (overhead/overhead_long/sleep/no_sleep/default),
both instrumented and plain — that all fuzz the same target/grammar, so their
saved inputs remain valid replay inputs for that target.

Files are deduplicated by content hash (AFL queues from related campaigns
overlap heavily — the initial seed corpus is shared, and independent runs
often converge on the same mutations), so the pool reflects genuinely
distinct inputs rather than N copies of the same handful of files.

Usage:
  evaluation/bench/.venv/bin/python evaluation/bench/build_seed_pool.py \\
    --glob 'results/*/*/instrumented/t*/default/queue' \\
    --glob 'results/*/*/plain/t*/default/queue' \\
    --out results/pooled/queue

Since the 2026-07-29 results reorg, campaigns are grouped by research question
(results/<experiment>/<campaign>/<variant>/tN/default) rather than all living
under one results/cat/ tree -- the default globs below name the specific
experiment/campaign pairs this tool has historically pooled from (matches
afl_provenance_label.py's CAMPAIGN_LOCATIONS) rather than a blanket
results/*/*/... glob, which would also sweep in unrelated experiments
(iv_feedback's dated sub-batches, trial_duration_calibration, etc).
"""

import argparse
import hashlib
import shutil
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
BENCH = REPO / "evaluation/bench"

DEFAULT_GLOBS = [
    "results/rq1_effect/baseline_pilot/default/*/t*/default/queue",
    "results/rq2_overhead/overhead_long/*/t*/default/queue",
    "results/rq1_effect/sleep_nosleep/*/*/t*/default/queue",
    "results/rq1_effect/grammar_mutator_comparison/grammar/*/t*/default/queue",
]


def parse_args():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--glob", action="append", dest="globs", default=None,
                   help="glob (relative to evaluation/bench/) matching queue/ dirs to pool; "
                        "repeatable. Default: the historical default/overhead_long/sleep/"
                        "no_sleep/grammar campaigns, instrumented+plain.")
    p.add_argument("--out", type=Path, default=BENCH / "results/pooled/queue",
                   help="output dir for the pooled, deduplicated queue")
    p.add_argument("--force", action="store_true",
                   help="wipe --out first if it already exists")
    return p.parse_args()


def campaign_tag(queue_dir):
    """.../<campaign>/<variant>/t3/default/queue -> <campaign>_<variant>_t3 -- indexed
    from the end, not the start, so it doesn't care how many wrapper directories
    (results/rq1_effect/..., results/rq2_overhead/..., etc.) precede <campaign>."""
    parts = queue_dir.relative_to(BENCH).parts  # (..., campaign, variant, 't3', 'default', 'queue')
    campaign, variant, trial = parts[-5], parts[-4], parts[-3]
    return f"{campaign}_{variant}_{trial}"


def main():
    args = parse_args()
    globs = args.globs or DEFAULT_GLOBS

    queue_dirs = []
    for g in globs:
        matched = sorted(BENCH.glob(g))
        matched = [d for d in matched if d.is_dir()]
        if not matched:
            print(f"[warn] glob matched nothing: {g}", file=sys.stderr)
        queue_dirs.extend(matched)

    if not queue_dirs:
        sys.exit("[error] no queue dirs matched any --glob")

    if args.out.exists():
        if not args.force:
            sys.exit(f"[error] {args.out} already exists (use --force to overwrite)")
        shutil.rmtree(args.out)
    args.out.mkdir(parents=True, exist_ok=True)

    seen_hashes = set()
    scanned = 0
    kept = 0
    per_source = []

    for qdir in queue_dirs:
        tag = campaign_tag(qdir)
        src_kept = 0
        for f in sorted(qdir.iterdir()):
            if not f.is_file():
                continue
            scanned += 1
            digest = hashlib.sha256(f.read_bytes()).hexdigest()
            if digest in seen_hashes:
                continue
            seen_hashes.add(digest)
            dest = args.out / f"{tag}__{f.name}"
            shutil.copy2(f, dest)
            kept += 1
            src_kept += 1
        per_source.append((tag, src_kept))

    print(f"{'─'*60}")
    for tag, n in per_source:
        print(f"  {tag:40s} +{n}")
    print(f"{'─'*60}")
    print(f"[pool] {len(queue_dirs)} campaigns scanned, {scanned} files seen, "
          f"{kept} unique kept ({100*kept/scanned:.1f}%)")
    print(f"[pool] saved -> {args.out}")


if __name__ == "__main__":
    main()

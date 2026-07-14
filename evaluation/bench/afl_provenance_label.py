#!/usr/bin/env python3
"""
afl_provenance_label.py -- label which AFL queue entries reach the target
patch, using this project's own instrumentation (mm_target_reached, exposed
via MM_STOP_LOG's target=N) rather than afl-showmap edge-coverage diffing.

Why not afl-showmap: this repo has no notion of "which coverage-map edges
belong to the patch" to diff against -- that mapping was never built. What it
DOES have is an exact, already-instrumented signal: catPUA.c sets
mm_target_reached=1 directly at the vulnerable code path (examples/catCU/
catPUA.c, the self-copy-detection branch), and monitor_runtime.c /
mm_target_stub.c both log it verbatim as target=N on every exec via
MM_STOP_LOG. Replaying a queue entry once through either binary variant says,
exactly, whether that specific input reaches the patch -- no proxy needed.

Binary choice: this replays through the PLAIN binary (work/outputs/pua_plain*),
not the instrumented one. mm_target_reached is set by catPUA.c itself,
independent of which runtime it's linked against -- but the instrumented
binaries built for the original 120 campaigns use the default 'stop-v' policy
(early-abort on a policy violation). An early abort occurring before the probe
line executes would silently produce a false negative. The plain binary never
runs the monitor at all, so it always runs to completion -- no policy
confound, and no rebuild needed (see overhead_micro.py's docstring for the
same -policy n caveat in a different context).

Deterministic + content-hash cached: target_hit is a pure function of
(file bytes, binary), so identical queue entries -- common across sibling
trials of the same campaign, see build_seed_pool.py -- are only replayed once
per campaign group.

Usage:
    python3 afl_provenance_label.py CAMPAIGN_TRIAL_DIR [CAMPAIGN_TRIAL_DIR ...]
    python3 afl_provenance_label.py --all-campaigns
"""
import argparse
import hashlib
import json
import os
import subprocess
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from overhead_micro import build_wrapper, DEFAULT_WRAPPER_SRC  # noqa: E402

REPO = Path(__file__).resolve().parents[2]
RESULTS_ROOT = REPO / "evaluation/bench/results/cat"

# campaign name (results/cat/<name>/<variant>/tN/default) -> plain binary
# built for that campaign. Every trial/variant subdir under a given campaign
# name shares one binary (targetbench.py builds it once per campaign, not
# per trial), so this is a 5-entry map, not 120.
CAMPAIGN_PLAIN_BIN = {
    "default":       REPO / "work/outputs/pua_plain",
    "overhead":      REPO / "work/outputs/pua_plain_overhead",
    "overhead_long": REPO / "work/outputs/pua_plain_overhead_long",
    "sleep":         REPO / "work/outputs/pua_plain_sleep",
    "no_sleep":      REPO / "work/outputs/pua_plain_no_sleep",
}


def campaign_name_from_path(campaign_trial_dir):
    """.../results/cat/overhead_long/instrumented/t1/default -> 'overhead_long'"""
    parts = Path(campaign_trial_dir).resolve().parts
    idx = parts.index("cat")
    return parts[idx + 1]


def discover_campaign_trial_dirs(root=RESULTS_ROOT):
    """Every .../<campaign>/<variant>/tN/default dir that has a queue/ subdir."""
    return sorted(d.parent for d in root.glob("*/*/t*/default/queue") if d.is_dir())


def parse_stoplog_last(path):
    """Last line's key=val tokens, e.g. {'early':'0','verdict':'V','steps':'42','target':'1'}."""
    try:
        lines = Path(path).read_text().splitlines()
    except FileNotFoundError:
        return {}
    if not lines:
        return {}
    d = {}
    for tok in lines[-1].split():
        if "=" in tok:
            k, v = tok.split("=", 1)
            d[k] = v
    return d


def label_queue_dir(queue_dir, wrapper_bin, timeout=5.0, cache=None):
    """{filename: {'target_hit': bool|None, 'steps': int|None}} for every file
    in queue_dir. `cache` maps sha256(content) -> label dict and is mutated
    in place so callers can share it across sibling trial dirs of one
    campaign to skip re-replaying identical queue entries."""
    queue_dir = Path(queue_dir)
    files = sorted(f for f in queue_dir.iterdir() if f.is_file())
    if not files:
        return {}

    if cache is None:
        cache = {}
    mm_log = wrapper_bin.parent / "stoplog.tmp"
    # NOT /dev/null: catPUA.c's self-copy check compares (dev, inode) of
    # stdin vs stdout. When a mutated command has no input file, the wrapper
    # itself falls back to reading stdin from /dev/null -- so if we also sent
    # this process's stdout to /dev/null "because we don't care about it",
    # both ends would alias onto the same real device and falsely trip the
    # target probe. A dedicated, reused regular file has its own identity and
    # can never coincidentally match /dev/null or any of the wrapper's own
    # resolved /tmp/cat_fuzz/* paths. This mirrors what targetbench.py
    # already does correctly for the live campaigns (fuzz_trial's fuzz.log).
    discard_out = wrapper_bin.parent / "discard_stdout.tmp"
    labels = {}
    for f in files:
        digest = hashlib.sha256(f.read_bytes()).hexdigest()
        if digest in cache:
            labels[f.name] = cache[digest]
            continue
        mm_log.unlink(missing_ok=True)
        env = dict(os.environ, MM_STOP_LOG=str(mm_log))
        try:
            with open(discard_out, "wb") as out_f:
                subprocess.run([str(wrapper_bin), str(f)], stdout=out_f,
                               stderr=subprocess.STDOUT, stdin=subprocess.DEVNULL,
                               env=env, timeout=timeout)
            fields = parse_stoplog_last(mm_log)
        except subprocess.TimeoutExpired:
            fields = {}
        target = fields.get("target")
        steps = fields.get("steps")
        label = {
            "target_hit": (target == "1") if target is not None else None,
            "steps": int(steps) if steps is not None else None,
        }
        cache[digest] = label
        labels[f.name] = label
    return labels


def label_campaign(campaign_trial_dirs, wrapper_src=DEFAULT_WRAPPER_SRC, scratch_root=None):
    """Label every queue/ dir under a shared campaign name, reusing one
    compiled wrapper and one content-hash cache across all its trials.
    Returns {trial_dir: {filename: label}}."""
    campaign = campaign_name_from_path(campaign_trial_dirs[0])
    plain_bin = CAMPAIGN_PLAIN_BIN.get(campaign)
    if plain_bin is None:
        sys.exit(f"[error] no plain binary mapped for campaign '{campaign}' "
                 f"(known: {', '.join(CAMPAIGN_PLAIN_BIN)})")
    if not plain_bin.exists():
        sys.exit(f"[error] plain binary not found: {plain_bin}")

    scratch = Path(scratch_root or tempfile.mkdtemp(prefix="afl_provenance_label_")) / campaign
    scratch.mkdir(parents=True, exist_ok=True)
    wrapper_bin = scratch / f"wrapper_{plain_bin.name}"
    if not wrapper_bin.exists():
        build_wrapper(wrapper_src, plain_bin, wrapper_bin)

    cache = {}
    out = {}
    for d in campaign_trial_dirs:
        qdir = Path(d) / "queue"
        out[str(d)] = label_queue_dir(qdir, wrapper_bin, cache=cache)
    return out, campaign


def main():
    ap = argparse.ArgumentParser(description="Label AFL queue entries by target-patch reachability.",
                                 formatter_class=argparse.RawDescriptionHelpFormatter, epilog=__doc__)
    ap.add_argument("dirs", nargs="*", help="campaign trial dir(s), e.g. "
                                             "results/cat/overhead_long/instrumented/t1/default")
    ap.add_argument("--all-campaigns", action="store_true",
                    help=f"label every trial dir under {RESULTS_ROOT}")
    ap.add_argument("--out", type=Path, default=None,
                    help="write combined JSON labels here (default: print summary only)")
    args = ap.parse_args()

    if args.all_campaigns:
        dirs = discover_campaign_trial_dirs()
    elif args.dirs:
        dirs = [Path(d) for d in args.dirs]
    else:
        sys.exit("[error] pass campaign trial dir(s) or --all-campaigns")

    by_campaign = {}
    for d in dirs:
        by_campaign.setdefault(campaign_name_from_path(d), []).append(d)

    all_labels = {}
    for campaign, trial_dirs in sorted(by_campaign.items()):
        print(f"[label] {campaign}: {len(trial_dirs)} trial dir(s)")
        out, _ = label_campaign(trial_dirs)
        for trial_dir, labels in out.items():
            n_hit = sum(1 for v in labels.values() if v["target_hit"])
            n_total = len(labels)
            print(f"  {trial_dir}: {n_hit}/{n_total} hit target")
            all_labels[trial_dir] = labels

    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(all_labels, indent=2))
        print(f"[label] saved -> {args.out}")


if __name__ == "__main__":
    main()

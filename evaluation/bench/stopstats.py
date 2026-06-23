#!/usr/bin/env python3
"""
stopstats.py — measure how often / how early the Mimicry monitor stops the
instrumented program early under its policy.

It replays a set of inputs (e.g. AFL's corpus) through the instrumented binary
with MM_STOP_LOG enabled (the telemetry hook in monitor_runtime.c). Each run
appends one line:

    early=<0|1> verdict=<V|IV|NV> steps=<n>

stopstats reads those, then reports:
  - HOW MANY stopped early   -> early-stop rate (split by V / IV)
  - HOW EARLY they stopped   -> distribution of `steps` at the early stop

Outputs: stopstats.png (outcome bars + steps histogram), summary.json,
details.csv, and a printed table.

Prereqs:
  - The instrumented binary must be (re)built so it contains the telemetry hook
    (./pipeline/run-mimicry.sh -afl ... or instrument.sh).
  - Replay uses the same input delivery you fuzzed with (--input / --targs).

Run via the bundled venv:
  evaluation/bench/.venv/bin/python evaluation/bench/stopstats.py --help
"""

import argparse
import csv
import json
import os
import subprocess
import tempfile
from collections import Counter
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]


# --------------------------------------------------------------------- corpus

def collect_inputs(args):
    files, seen = [], set()

    def add(p):
        p = Path(p)
        rp = p.resolve()
        if p.is_file() and rp not in seen:
            seen.add(rp)
            files.append(p)

    if args.results:
        base = Path(args.results).resolve()
        for sub in ("queue", "crashes"):
            for f in base.glob(f"instrumented/t*/default/{sub}/*"):
                if f.is_file() and f.name not in ("README.txt",):
                    add(f)
    for d in args.corpus:
        d = Path(d)
        if d.is_dir():
            for f in sorted(d.iterdir()):
                if f.is_file() and not f.name.startswith("."):
                    add(f)
        else:
            add(d)

    if args.limit:
        files = files[: args.limit]
    return files


# --------------------------------------------------------------------- replay

def run_one(args, inp, logf):
    if logf.exists():
        logf.unlink()
    env = dict(os.environ, MM_STOP_LOG=str(logf))
    targs = args.targs.split() if args.targs else []
    stdin = None
    try:
        if args.input == "file":
            cmd = [str(args.bin), *targs, str(inp)]
        elif args.input == "stdin":
            cmd = [str(args.bin), *targs]
            stdin = open(inp, "rb")
        else:  # argv — mimic the wrapper: file content becomes argv[1]
            content = Path(inp).read_bytes().split(b"\x00", 1)[0].rstrip(b"\n")
            cmd = [str(args.bin), content.decode("latin-1")]
        try:
            subprocess.run(cmd, env=env, stdin=stdin,
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                           timeout=args.timeout)
        except subprocess.TimeoutExpired:
            return {"_outcome": "timeout"}
    finally:
        if stdin:
            stdin.close()

    if not logf.exists():
        return None  # no telemetry line (crash before a stop, or old binary)
    lines = logf.read_text().strip().splitlines()
    if not lines:
        return None
    rec = {}
    for kv in lines[0].split():
        if "=" in kv:
            k, v = kv.split("=", 1)
            rec[k] = v
    return rec


def classify(rec):
    if rec is None:
        return "no_record", None
    if rec.get("_outcome") == "timeout":
        return "timeout", None
    if rec.get("early") == "1":
        return f"early_{rec.get('verdict', 'NV')}", int(rec.get("steps", 0))
    return "ran_to_end", int(rec.get("steps", 0))


# ----------------------------------------------------------------------- plot

def plot(args, outcomes, early_steps, ran_steps):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    import numpy as np

    fig, ax = plt.subplots(1, 2, figsize=(13, 5))
    fig.suptitle(f"Monitor early-stop behaviour  (input={args.input}, "
                 f"{sum(outcomes.values())} inputs replayed)", fontsize=13)

    # outcomes bar
    order = ["early_V", "early_IV", "ran_to_end", "no_record", "timeout"]
    labels = [o for o in order if outcomes.get(o)]
    vals = [outcomes[o] for o in labels]
    colors = {"early_V": "#2a9d8f", "early_IV": "#d1495b",
              "ran_to_end": "#577590", "no_record": "#999999", "timeout": "#e9c46a"}
    ax[0].bar(range(len(labels)), vals, color=[colors.get(l, "#888") for l in labels])
    ax[0].set_xticks(range(len(labels)))
    ax[0].set_xticklabels(labels, rotation=20, ha="right")
    ax[0].set_title("Outcome per input (how many stop early)")
    ax[0].set_ylabel("inputs")
    ax[0].grid(alpha=0.3, axis="y")

    # steps histogram (earliness)
    if early_steps:
        ax[1].hist(early_steps, bins=min(30, max(5, len(set(early_steps)))),
                   color="#d1495b", alpha=0.8, label="early stop")
    if ran_steps:
        ax[1].hist(ran_steps, bins=min(30, max(5, len(set(ran_steps)))),
                   color="#577590", alpha=0.5, label="ran to end")
    ax[1].set_title("How early: monitor steps before stopping")
    ax[1].set_xlabel("steps (monitored instructions executed)")
    ax[1].set_ylabel("inputs")
    ax[1].legend()
    ax[1].grid(alpha=0.3, axis="y")

    fig.tight_layout(rect=[0, 0, 1, 0.95])
    out = args.out / "stopstats.png"
    fig.savefig(out, dpi=120)
    print(f"[plot] wrote {out}")


# ----------------------------------------------------------------------- main

def main():
    ap = argparse.ArgumentParser(description="Measure monitor early-stop rate / earliness by replaying a corpus.")
    ap.add_argument("--bin", type=Path, default=REPO_ROOT / "work" / "outputs" / "instrumentedPUA",
                    help="instrumented binary (must contain the MM_STOP_LOG hook)")
    ap.add_argument("--corpus", nargs="*", default=[], help="dirs/files of inputs to replay")
    ap.add_argument("--results", type=Path, default=None,
                    help="a fuzzbench results dir; auto-collects instrumented/t*/default/{queue,crashes}")
    ap.add_argument("--input", choices=["file", "stdin", "argv"], default="file")
    ap.add_argument("--targs", default="", help='program args, e.g. "-A"')
    ap.add_argument("--timeout", type=float, default=10.0, help="seconds per replay run")
    ap.add_argument("--limit", type=int, default=0, help="cap number of inputs (0 = all)")
    ap.add_argument("--out", type=Path, default=REPO_ROOT / "evaluation" / "bench" / "results" / "stopstats")
    args = ap.parse_args()
    args.out = args.out.resolve()
    args.out.mkdir(parents=True, exist_ok=True)

    if not Path(args.bin).exists():
        print(f"error: instrumented binary not found: {args.bin}")
        print("build it first, e.g.:  ./pipeline/run-mimicry.sh -afl -pua ... (rebuild picks up the telemetry hook)")
        return

    inputs = collect_inputs(args)
    if not inputs:
        print("error: no inputs found. Use --corpus DIR [...] or --results <fuzzbench results dir>.")
        return

    logf = Path(tempfile.gettempdir()) / f"mm_stop_{os.getpid()}.log"
    outcomes = Counter()
    early_steps, ran_steps = [], []
    rows = []
    print(f"[replay] {len(inputs)} inputs through {args.bin} (input={args.input})")
    for i, inp in enumerate(inputs, 1):
        rec = run_one(args, inp, logf)
        outcome, steps = classify(rec)
        outcomes[outcome] += 1
        if outcome.startswith("early_") and steps is not None:
            early_steps.append(steps)
        elif outcome == "ran_to_end" and steps is not None:
            ran_steps.append(steps)
        rows.append({"input": inp.name, "outcome": outcome,
                     "verdict": (rec or {}).get("verdict", ""), "steps": steps if steps is not None else ""})
        if i % 50 == 0:
            print(f"  {i}/{len(inputs)}")
    if logf.exists():
        logf.unlink()

    total = len(inputs)
    n_early = sum(v for k, v in outcomes.items() if k.startswith("early_"))
    import statistics as st
    summary = {
        "binary": str(args.bin),
        "input_mode": args.input,
        "total_inputs": total,
        "early_stops": n_early,
        "early_stop_rate": round(n_early / total, 4) if total else 0.0,
        "early_V": outcomes.get("early_V", 0),
        "early_IV": outcomes.get("early_IV", 0),
        "ran_to_end": outcomes.get("ran_to_end", 0),
        "no_record": outcomes.get("no_record", 0),
        "timeout": outcomes.get("timeout", 0),
        "steps_at_stop_mean": round(st.mean(early_steps), 2) if early_steps else None,
        "steps_at_stop_median": st.median(early_steps) if early_steps else None,
        "steps_at_stop_min": min(early_steps) if early_steps else None,
        "steps_at_stop_max": max(early_steps) if early_steps else None,
    }
    (args.out / "summary.json").write_text(json.dumps(summary, indent=2))
    with (args.out / "details.csv").open("w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=["input", "outcome", "verdict", "steps"])
        w.writeheader(); w.writerows(rows)

    print("\n================ EARLY-STOP SUMMARY ================")
    for k, v in summary.items():
        print(f"   {k:22} {v}")
    if total and summary["no_record"] == total:
        print("\n   NOTE: every run produced no telemetry line — the binary likely was NOT")
        print("         rebuilt with the MM_STOP_LOG hook (or every input crashed).")
    print("====================================================\n")

    plot(args, outcomes, early_steps, ran_steps)


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""
targetbench.py — compare how often instrumented vs plain AFL++ reaches the
target patch (mm_target_reached=1).

Supports two built-in examples (--example):
  default   — demo integer-classifier PUA (inputs/programPUA.c); argv input mode.
  expandcu  — expandCU coreutils example; file input mode; needs coreutils build.

Both fuzz sessions write per-execution telemetry to MM_STOP_LOG via
monitor_runtime.c (instrumented) or mm_target_stub.c (plain).  Each line:
    early=N verdict=X steps=N target=N

This script:
  1. Builds the instrumented binary (run-mimicry.sh -afl) unless --skip-build.
  2. Runs N trials of each version (instrumented / plain) via fuzz.sh.
  3. Parses the stop-logs and AFL plot_data.
  4. Saves results as JSON + CSV.
  5. Generates a multi-panel PNG with:
       - Cumulative target hits over executions (per trial + mean)
       - Hit rate (target=1 / total) per trial bar chart
       - Exec/sec comparison box plot
       - AFL edge coverage over time

Usage (from repo root):
  evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/targetbench.py --help

Examples:
  evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/targetbench.py \\
    --example default --trials 3 --time 60

  evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/targetbench.py \\
    --example expandcu --trials 3 --time 60

Prereqs (expandcu only):
  - coreutils built at /home/felicitas/Desktop/DOC/MM/coreutils
  - echo core | sudo tee /proc/sys/kernel/core_pattern
"""

import argparse
import csv
import datetime
import json
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path

import warnings
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.ticker as mticker

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "notion"))
import notion_publish

# ── paths ────────────────────────────────────────────────────────────────────
REPO   = Path(__file__).resolve().parents[3]
FUZZ   = REPO / "pipeline" / "fuzz.sh"
MIMICRY= REPO / "pipeline" / "run-mimicry.sh"
CU     = Path("/home/felicitas/Desktop/DOC/MM/coreutils")
STUB   = REPO / "instrumentation/mm_target_stub.c"

# ── example configs ───────────────────────────────────────────────────────────
# Required keys: pua, op, sigma, seeds, input_mode, title, ianalyze, iinstrument
# Optional keys (override with CLI flags): grammar, grammar_only, trees,
#                                          wrapper_src, exec_timeout
EXAMPLES = {
    "default": {
        "pua":          REPO / "inputs/programPUA.c",
        "op":           REPO / "inputs/programOP.c",
        "sigma":        REPO / "inputs/sigma.txt",
        "seeds":        REPO / "evaluation/seeds",
        "input_mode":   "argv",
        "title":        "integer-classifier",
        "ianalyze":     [],
        "iinstrument":  [],
        "plain_I":      [],
        "plain_link":   [],
    },
    "expandcu": {
        "pua":          REPO / "examples/expandCU/expandPUA.c",
        "op":           REPO / "examples/expandCU/expandOP.c",
        "sigma":        REPO / "examples/expandCU/expandSigma.txt",
        "seeds":        REPO / "evaluation/seeds",
        "input_mode":   "file",
        "title":        "expandCU",
        "ianalyze":     [str(CU / "src"), str(CU / "lib")],
        "iinstrument":  [
            str(CU / "src/expand-common.o"),
            str(CU / "lib/libcoreutils.a"),
            str(CU / "src/version.o"),
        ],
        "plain_I":      [str(CU / "src"), str(CU / "lib")],
        "plain_link":   [
            str(CU / "src/expand-common.o"),
            str(CU / "lib/libcoreutils.a"),
            str(CU / "src/version.o"),
        ],
    },
    "cat": {
        "pua":          REPO / "examples/catCU/catPUA.c",
        "op":           REPO / "examples/catCU/catOP.c",
        "sigma":        REPO / "examples/catCU/catSigma.txt",
        "seeds":        Path("/home/felicitas/Grammar-Mutator/seeds-cat"),
        "input_mode":   "argv",
        "wrapper_src":  REPO / "pipeline/afl_cat_cmdline_wrapper.c",
        "grammar":      Path("/home/felicitas/Grammar-Mutator/libgrammarmutator-cat.so"),
        "grammar_only": True,
        "trees":        Path("/home/felicitas/Grammar-Mutator/trees-cat"),
        "exec_timeout": "5000",
        "title":        "catCU",
        "ianalyze":     [str(CU / "src"), str(CU / "lib")],
        "iinstrument":  [
            str(CU / "lib/libcoreutils.a"),
            str(CU / "src/version.o"),
        ],
        "plain_I":      [str(CU / "src"), str(CU / "lib")],
        "plain_link":   [
            str(CU / "lib/libcoreutils.a"),
            str(CU / "src/version.o"),
        ],
    },
    "cat_no_grammar": {
        # Same PUA/OP/sigma/seeds as "cat", but with no grammar mutator
        # configured -- AFL falls back entirely to its own built-in
        # mutation engine (havoc/splice/bitflip/etc.) starting from the
        # same seed corpus, instead of grammar-guided command-line mutation.
        "pua":          REPO / "examples/catCU/catPUA.c",
        "op":           REPO / "examples/catCU/catOP.c",
        "sigma":        REPO / "examples/catCU/catSigma.txt",
        "seeds":        Path("/home/felicitas/Grammar-Mutator/seeds-cat"),
        "input_mode":   "argv",
        "wrapper_src":  REPO / "pipeline/afl_cat_cmdline_wrapper.c",
        "exec_timeout": "5000",
        "title":        "catCU (no grammar mutator)",
        "ianalyze":     [str(CU / "src"), str(CU / "lib")],
        "iinstrument":  [
            str(CU / "lib/libcoreutils.a"),
            str(CU / "src/version.o"),
        ],
        "plain_I":      [str(CU / "src"), str(CU / "lib")],
        "plain_link":   [
            str(CU / "lib/libcoreutils.a"),
            str(CU / "src/version.o"),
        ],
    },
    "cat_sleep": {
        # Same as "cat" (grammar mutator on), but catPUA.c has an extra
        # sleep(1) right before returning from main() -- both instrumented
        # and plain are built from this source, so every run that reaches
        # main()'s normal return (i.e. every IV/"hit") pays the 1s sleep.
        "pua":          REPO / "examples/catCU_sleep/catPUA.c",
        "op":           REPO / "examples/catCU_sleep/catOP.c",
        "sigma":        REPO / "examples/catCU_sleep/catSigma.txt",
        "seeds":        Path("/home/felicitas/Grammar-Mutator/seeds-cat"),
        "input_mode":   "argv",
        "wrapper_src":  REPO / "pipeline/afl_cat_cmdline_wrapper.c",
        "grammar":      Path("/home/felicitas/Grammar-Mutator/libgrammarmutator-cat.so"),
        "grammar_only": True,
        "trees":        Path("/home/felicitas/Grammar-Mutator/trees-cat"),
        "exec_timeout": "5000",
        "title":        "catCU (sleep-injected)",
        "ianalyze":     [str(CU / "src"), str(CU / "lib")],
        "iinstrument":  [
            str(CU / "lib/libcoreutils.a"),
            str(CU / "src/version.o"),
        ],
        "plain_I":      [str(CU / "src"), str(CU / "lib")],
        "plain_link":   [
            str(CU / "lib/libcoreutils.a"),
            str(CU / "src/version.o"),
        ],
    },
    "cat_notarget": {
        # Same as "cat", but catPUA.c has no mm_target_reached probe — the
        # probe write is a hot-path side effect unrelated to the monitor's
        # own per-step cost, so overhead_micro.py should measure against
        # this variant instead of conflating the two.
        "pua":          REPO / "examples/catCU_notarget/catPUA.c",
        "op":           REPO / "examples/catCU_notarget/catOP.c",
        "sigma":        REPO / "examples/catCU_notarget/catSigma.txt",
        "seeds":        Path("/home/felicitas/Grammar-Mutator/seeds-cat"),
        "input_mode":   "argv",
        "wrapper_src":  REPO / "pipeline/afl_cat_cmdline_wrapper.c",
        "grammar":      Path("/home/felicitas/Grammar-Mutator/libgrammarmutator-cat.so"),
        "grammar_only": True,
        "trees":        Path("/home/felicitas/Grammar-Mutator/trees-cat"),
        "exec_timeout": "5000",
        "title":        "catCU (no target probe)",
        "ianalyze":     [str(CU / "src"), str(CU / "lib")],
        "iinstrument":  [
            str(CU / "lib/libcoreutils.a"),
            str(CU / "src/version.o"),
        ],
        "plain_I":      [str(CU / "src"), str(CU / "lib")],
        "plain_link":   [
            str(CU / "lib/libcoreutils.a"),
            str(CU / "src/version.o"),
        ],
    },
}

COLORS = {"instrumented": "#d1495b", "plain": "#2e86ab"}
LABELS = {"instrumented": "Instrumented (MM)", "plain": "Plain (AFL only)"}


def default_experiment_name(example):
    """One fresh, timestamped results folder per targetbench.py invocation --
    used unless the caller passes --experiment to explicitly group several
    runs (e.g. different --example configs being compared) into one folder."""
    return f"{datetime.datetime.now().strftime('%Y-%m-%d_%H%M%S')}_{example}"

# ── CLI ──────────────────────────────────────────────────────────────────────
def parse_args(argv=None):
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--example",     choices=list(EXAMPLES), default="default",
                   help="which example to benchmark (default: default)")
    p.add_argument("--trials",      type=int,  default=3,
                   help="independent fuzz trials per variant (default 3)")
    p.add_argument("--time",        type=int,  default=60,
                   help="seconds per trial (default 60)")
    p.add_argument("--seeds",       type=Path, default=None,
                   help="override seed directory (default: from --example)")
    p.add_argument("--campaign",    default=None,
                   help="arm/run label within --experiment: namespaces results to "
                        "results/<experiment>/<campaign> and appends _<campaign> to binary "
                        "names so parallel runs don't collide. Give each arm a distinct "
                        "name when comparing several --example configs under one --experiment.")
    p.add_argument("--experiment",  default=None,
                   help="results folder under evaluation/bench/results/. Default: a fresh "
                        "timestamped folder for this invocation alone. Pass the SAME "
                        "--experiment name across multiple runs (with distinct --campaign "
                        "values) to group them together for comparison.")
    p.add_argument("--results",     type=Path, default=None,
                   help="results directory, overriding --experiment/--campaign entirely "
                        "(default: evaluation/bench/results/<experiment>/<campaign or example>)")
    p.add_argument("--out",         type=Path, default=None,
                   help="output PNG (default: results/<example>.png)")
    p.add_argument("--skip-build",  action="store_true",
                   help="skip run-mimicry.sh (instrumented binary already built)")
    p.add_argument("--skip-fuzz",   action="store_true",
                   help="skip fuzzing, just re-plot from existing results")
    p.add_argument("--dry-run",     action="store_true")
    p.add_argument("--grammar",     type=Path, default=None,
                   help="path to libgrammarmutator-*.so (sets AFL_CUSTOM_MUTATOR_LIBRARY)")
    p.add_argument("--grammar-only", action="store_true",
                   help="suppress AFL's own mutations (AFL_CUSTOM_MUTATOR_ONLY=1)")
    p.add_argument("--trees",       type=Path, default=None,
                   help="pre-generated tree cache dir passed to fuzz.sh -trees")
    p.add_argument("--no-grammar",  action="store_true",
                   help="force the grammar mutator off even if --example defaults one on "
                        "(AFL uses its own built-in mutations only, seeds unchanged)")
    p.add_argument("--wrapper-src", type=Path, default=None,
                   help="custom wrapper .c compiled instead of afl_fuzz_wrapper.c (argv mode)")
    p.add_argument("--input-mode",  default=None,
                   help="override the example's default input mode (argv|file|stdin)")
    p.add_argument("--exec-timeout", default=None,
                   help="per-execution timeout passed to afl-fuzz as -t MS (default: AFL's 1000ms)")
    p.add_argument("--policy",       choices=["stop-v", "stop-iv", "n"], default="stop-v",
                   help="monitor stop policy for the instrumented build (default: stop-v). "
                        "Use 'n' to disable early aborts — the monitor still runs on every "
                        "execution but never stops the program early, which isolates pure "
                        "instrumentation overhead when compared against the plain build.")
    p.add_argument("--iv-feedback",  action="store_true",
                   help="build the instrumented binary with -afl-iv-feedback: mark "
                        "IV-reaching executions in AFL's own coverage map so afl-fuzz "
                        "favors/energizes them (no effect on the plain build)")
    p.add_argument("--iv-feedback-path", action="store_true",
                   help="build the instrumented binary with -afl-iv-feedback-path: "
                        "path-sensitive variant of --iv-feedback -- favors inputs whose "
                        "monitor path is novel *and* IV, not just 'reached IV at all' "
                        "(mutually exclusive with --iv-feedback)")
    p.add_argument("--notion",      action="store_true",
                   help="after finishing, publish the campaign to the Notion tracking "
                        "page via notion_publish.py (needs $NOTION_TOKEN). A failure "
                        "here is a warning, not a fatal error -- results are already "
                        "saved on disk regardless.")
    args = p.parse_args(argv)
    if args.iv_feedback and args.iv_feedback_path:
        p.error("--iv-feedback and --iv-feedback-path are mutually exclusive -- pick one")
    ex = EXAMPLES[args.example]
    if args.seeds is None:
        args.seeds = ex["seeds"]
    if args.results is None:
        experiment = args.experiment or default_experiment_name(args.example)
        args.results = REPO / "evaluation/bench/results" / experiment / (args.campaign or args.example)
    # Fall back to example-level defaults for optional keys; CLI flags override.
    if args.grammar is None and "grammar" in ex:
        args.grammar = ex["grammar"]
    if not args.grammar_only:
        args.grammar_only = ex.get("grammar_only", False)
    if args.trees is None and "trees" in ex:
        args.trees = ex["trees"]
    if args.no_grammar:
        args.grammar = None
        args.grammar_only = False
        args.trees = None
    if args.wrapper_src is None and "wrapper_src" in ex:
        args.wrapper_src = ex["wrapper_src"]
    if args.input_mode is None:
        args.input_mode = ex["input_mode"]
    if args.exec_timeout is None and "exec_timeout" in ex:
        args.exec_timeout = ex["exec_timeout"]
    return args

# ── env ──────────────────────────────────────────────────────────────────────
AFL_ENV = dict(
    os.environ,
    AFL_NO_AFFINITY="1",
    AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES="1",
    AFL_SKIP_CPUFREQ="1",
)

def _run(cmd, **kw):
    print(f"  $ {' '.join(str(c) for c in cmd)}", flush=True)
    return subprocess.run(cmd, cwd=str(REPO), **kw)

# ── build ────────────────────────────────────────────────────────────────────
def build_instrumented(args):
    ex = EXAMPLES[args.example]
    print(f"\n[build] instrumented binary ({args.example}) …")
    cmd = [
        "bash", str(MIMICRY), "-afl", "-policy", args.policy, "-no-render",
        "-pua",   str(ex["pua"]),
        "-op",    str(ex["op"]),
        "-sigma", str(ex["sigma"]),
    ]
    if ex["ianalyze"]:
        cmd += ["-Ianalyze"] + ex["ianalyze"]
    if ex["iinstrument"]:
        cmd += ["-Iinstrument"] + ex["iinstrument"]
    if args.iv_feedback:
        cmd += ["-afl-iv-feedback"]
    if args.iv_feedback_path:
        cmd += ["-afl-iv-feedback-path"]
    if args.campaign:
        cmd += ["-bin-suffix", f"_{args.campaign}"]
    r = _run(cmd)
    if r.returncode != 0:
        sys.exit(f"[build] FAILED (rc={r.returncode})")
    print("[build] OK")

def build_plain(args):
    """Compile the plain PUA binary once, outside the trial timer."""
    ex = EXAMPLES[args.example]
    print(f"\n[build-plain] compiling plain binary ({args.example}) …")
    cmd = [
        "bash", str(FUZZ), "-plain",
        "-pua", str(ex["pua"]),
        "-i",   str(args.seeds),
        "-o",   "/tmp/targetbench_precompile",
        "-t",   "1",          # run AFL for 1 second just to get past the compile step
    ]
    if ex["plain_I"]:
        cmd += ["-I"] + ex["plain_I"]
    if ex["plain_link"]:
        cmd += ["-link", str(STUB)] + ex["plain_link"]
    else:
        cmd += ["-link", str(STUB)]
    if args.wrapper_src:
        cmd += ["-wrapper-src", str(args.wrapper_src)]
    if args.grammar:
        cmd += ["-grammar", str(args.grammar)]
    if args.grammar_only:
        cmd += ["-grammar-only"]
    if args.trees:
        cmd += ["-trees", str(args.trees)]
    if args.exec_timeout:
        cmd += ["-exec-timeout", args.exec_timeout]
    if args.campaign:
        cmd += ["-bin-suffix", f"_{args.campaign}"]
    r = _run(cmd, env=AFL_ENV)
    if r.returncode not in (0, 1):   # AFL timeout exits 1; compile failure exits non-zero too
        # Check binary exists — if so, compile succeeded even if AFL had an error
        suffix = f"_{args.campaign}" if args.campaign else ""
        plain_bin = REPO / f"work/outputs/pua_plain{suffix}"
        if not plain_bin.exists():
            sys.exit(f"[build-plain] FAILED (rc={r.returncode})")
    print("[build-plain] OK")

# ── fuzz one trial ───────────────────────────────────────────────────────────
def fuzz_trial(variant, trial_dir, log_path, args):
    """Run one AFL++ trial, return when done."""
    ex = EXAMPLES[args.example]
    trial_dir.mkdir(parents=True, exist_ok=True)
    log_path.unlink(missing_ok=True)

    env = dict(AFL_ENV, MM_STOP_LOG=str(log_path))

    base_cmd = [
        "bash", str(FUZZ),
        "-input", args.input_mode,
        "-i",     str(args.seeds),
        "-o",     str(trial_dir),
        "-t",     str(args.time),
    ]
    if args.wrapper_src:
        base_cmd += ["-wrapper-src", str(args.wrapper_src)]

    if args.campaign:
        base_cmd += ["-bin-suffix", f"_{args.campaign}"]
    if variant == "plain":
        base_cmd += ["-plain", "-no-recompile", "-pua", str(ex["pua"])]
        if ex["plain_I"]:
            base_cmd += ["-I"] + ex["plain_I"]
        if ex["plain_link"]:
            base_cmd += ["-link", str(STUB)] + ex["plain_link"]
        else:
            base_cmd += ["-link", str(STUB)]

    if args.grammar:
        base_cmd += ["-grammar", str(args.grammar)]
    if args.grammar_only:
        base_cmd += ["-grammar-only"]
    if args.trees:
        base_cmd += ["-trees", str(args.trees)]
    if args.exec_timeout:
        base_cmd += ["-exec-timeout", args.exec_timeout]

    fuzz_log = trial_dir / "fuzz.log"
    with fuzz_log.open("w") as f:
        proc = subprocess.Popen(base_cmd, cwd=str(REPO), env=env,
                                stdout=f, stderr=subprocess.STDOUT)
        start = time.monotonic()
        while proc.poll() is None:
            elapsed = int(time.monotonic() - start)
            print(f"\r    {variant} … {elapsed:3d}/{args.time}s", end="", flush=True)
            time.sleep(1)
        proc.wait()
    print(f"\r    {variant} … done ({args.time}s)          ")

# ── parse MM_STOP_LOG ────────────────────────────────────────────────────────
def parse_stoplog(path):
    """Return list of booleans: True = target reached for that execution."""
    hits = []
    try:
        for line in Path(path).read_text().splitlines():
            line = line.strip()
            if not line:
                continue
            hit = False
            for tok in line.split():
                if tok == "target=1":
                    hit = True
            hits.append(hit)
    except FileNotFoundError:
        pass
    return hits

# ── parse AFL plot_data ──────────────────────────────────────────────────────
def parse_plot_data(path):
    """Return dict of arrays: time, edges, execs, eps."""
    result = {"time": [], "edges": [], "execs": [], "eps": []}
    COLS = {
        "edges": ["edges_found", "map_size"],
        "execs": ["total_execs"],
        "eps":   ["execs_per_sec"],
        "time":  ["relative_time"],
    }
    header = None
    try:
        for line in Path(path).read_text().splitlines():
            line = line.strip()
            if not line:
                continue
            if line.startswith("#"):
                header = [c.strip() for c in line[1:].split(",")]
                continue
            if header is None:
                continue
            row = [v.strip() for v in line.split(",")]
            def pick(names):
                for n in names:
                    if n in header and header.index(n) < len(row):
                        try: return float(row[header.index(n)])
                        except ValueError: return 0.0
                return 0.0
            for k, names in COLS.items():
                result[k].append(pick(names))
    except FileNotFoundError:
        pass
    return {k: np.array(v) for k, v in result.items()}

# ── run all trials ───────────────────────────────────────────────────────────
def run_all(args):
    if not args.skip_fuzz:
        build_plain(args)
    for target in ("instrumented", "plain"):
        print(f"\n{'─'*50}")
        print(f" target: {LABELS[target]}")
        print(f"{'─'*50}")
        for i in range(1, args.trials + 1):
            print(f"\n  trial {i}/{args.trials}")
            trial_dir = args.results / target / f"t{i}"
            log_path  = args.results / target / f"t{i}_stoplog.txt"
            if args.dry_run:
                print(f"  [dry-run] would fuzz → {trial_dir}")
                continue
            # clean previous AFL output (not the log)
            if trial_dir.exists():
                shutil.rmtree(trial_dir)
            fuzz_trial(target, trial_dir, log_path, args)

# ── load all results ─────────────────────────────────────────────────────────
def load_results(args, targets=("instrumented", "plain")):
    data = {}
    for target in targets:
        trials_hits = []
        trials_pd   = []
        for i in range(1, args.trials + 1):
            log  = args.results / target / f"t{i}_stoplog.txt"
            pd   = args.results / target / f"t{i}" / "default" / "plot_data"
            hits = parse_stoplog(log)
            trials_hits.append(hits)
            trials_pd.append(parse_plot_data(pd))
        data[target] = {"hits": trials_hits, "plot_data": trials_pd}
    return data

# ── save CSV / JSON ──────────────────────────────────────────────────────────
def save_summary(data, args):
    rows = []
    for target, d in data.items():
        for i, hits in enumerate(d["hits"]):
            total = len(hits)
            n_hit = sum(hits)
            pd    = d["plot_data"][i]
            # Use total_execs/elapsed from plot_data rather than the last
            # instantaneous eps entry, which can be unreliable (smoothed window).
            if len(pd["execs"]) and len(pd["time"]) and pd["time"][-1] > 0:
                eps = float(pd["execs"][-1]) / float(pd["time"][-1])
            elif len(pd["eps"]):
                eps = float(pd["eps"][-1])
            else:
                eps = 0.0
            rows.append({
                "target":    target,
                "trial":     i + 1,
                "total_execs": total,
                "target_hits": n_hit,
                "hit_rate":  round(n_hit / total, 4) if total else 0,
                "mean_eps":  round(eps, 1),
            })

    csv_path  = args.results / "summary.csv"
    json_path = args.results / "summary.json"
    with csv_path.open("w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=rows[0].keys())
        w.writeheader(); w.writerows(rows)
    json_path.write_text(json.dumps(rows, indent=2))

    print(f"\n{'─'*60}")
    print(f"{'target':<16} {'trial':>5} {'execs':>8} {'hits':>6} {'hit%':>7} {'eps':>8}")
    print(f"{'─'*60}")
    for r in rows:
        pct = r['hit_rate'] * 100
        print(f"{r['target']:<16} {r['trial']:>5} {r['total_execs']:>8} "
              f"{r['target_hits']:>6} {pct:>6.1f}% {r['mean_eps']:>8.1f}")
    print(f"{'─'*60}")
    return rows

# ── plots ────────────────────────────────────────────────────────────────────
def make_plots(data, rows, args, out_path):
    fig, axes = plt.subplots(2, 2, figsize=(13, 11))
    ex_title = EXAMPLES[args.example]["title"]
    iv_suffix = ", iv-feedback" if args.iv_feedback else (", iv-feedback-path" if args.iv_feedback_path else "")
    fig.suptitle(f"MimicryMonitor — {ex_title} target reachability", y=0.975,
                 fontsize=13, fontweight="bold")
    fig.text(0.5, 0.945, f"({args.trials} trials × {args.time}s, policy={args.policy}{iv_suffix})",
              ha="center", fontsize=10.5)

    # whole-campaign totals (summed across all trials, not per-trial averages)
    campaign_totals = {}
    totals_parts = []
    for target in ("instrumented", "plain"):
        t_rows = [r for r in rows if r["target"] == target]
        if not t_rows:
            continue
        tot_execs = sum(r["total_execs"] for r in t_rows)
        tot_hits  = sum(r["target_hits"] for r in t_rows)
        tot_rate  = tot_hits / tot_execs * 100 if tot_execs else 0.0
        campaign_totals[target] = (tot_execs, tot_hits, tot_rate)
        totals_parts.append(f"{LABELS[target]}: {tot_hits:,} hits / {tot_execs:,} execs ({tot_rate:.1f}%)")
    fig.text(0.5, 0.92, "Campaign totals — " + "    |    ".join(totals_parts),
              ha="center", fontsize=9.5, color="#333333")

    ax_cumul, ax_ranked, ax_eps, ax_table = axes.flat

    # ── 1. Campaign totals: executions bar with hits shaded inside ──────────
    ax = ax_cumul
    targets_present = [t for t in ("instrumented", "plain") if t in campaign_totals]
    xs = np.arange(len(targets_present))
    bar_w = 0.5
    for xi, target in enumerate(targets_present):
        tot_execs, tot_hits, tot_rate = campaign_totals[target]
        c = COLORS[target]
        # full bar = total execs (faint), overlaid bar = total hits (solid) drawn on top
        ax.bar(xi, tot_execs, bar_w, color=c, alpha=0.30,
               edgecolor=c, linewidth=1)
        ax.bar(xi, tot_hits, bar_w, color=c, alpha=0.95)
        ax.text(xi, tot_execs, f"{tot_execs:,} execs", ha="center", va="bottom",
                fontsize=9, color=c, fontweight="bold")
        ax.text(xi, tot_hits / 2, f"{tot_hits:,} hits\n({tot_rate:.1f}%)",
                ha="center", va="center", fontsize=8.5, color="white", fontweight="bold")

    ax.set_xticks(xs)
    ax.set_xticklabels([LABELS[t] for t in targets_present])
    ax.set_ylabel("Count (campaign total)")
    ax.set_title("Campaign totals: executions vs. target hits")
    ax.set_ylim(0, max(v[0] for v in campaign_totals.values()) * 1.15)
    ax.yaxis.set_major_formatter(mticker.FuncFormatter(
        lambda x, _: f"{int(x/1000)}k" if x >= 1000 else str(int(x))))
    ax.grid(True, axis="y", alpha=0.3)

    # ── 2. Exec/sec box plot ─────────────────────────────────────────────────
    ax = ax_eps
    targets = list(data.keys())
    eps_data = []
    tick_labels = []
    tick_colors = []
    for target in targets:
        vals = [r["mean_eps"] for r in rows if r["target"] == target]
        eps_data.append(vals)
        tick_labels.append(LABELS[target])
        tick_colors.append(COLORS[target])

    bp = ax.boxplot(eps_data, patch_artist=True, widths=0.4)
    for patch, c in zip(bp["boxes"], tick_colors):
        patch.set_facecolor(c)
        patch.set_alpha(0.7)
    for element in ("whiskers", "caps", "medians", "fliers"):
        for item in bp[element]:
            item.set_color("black")

    ax.set_xticklabels(tick_labels, fontsize=8)
    ax.set_ylabel("Execs / sec")
    ax.set_title("Throughput (exec/sec)")
    ax.grid(True, axis="y", alpha=0.3)

    # ── 3. Hit rate — all trials sorted ascending, interleaved by mode ──────
    ax = ax_ranked
    SHORT = {"instrumented": "I", "plain": "P"}
    all_bars = []
    for r in rows:
        all_bars.append((r["hit_rate"] * 100,
                         f"{SHORT[r['target']]}{r['trial']}",
                         COLORS[r["target"]],
                         r["target"],
                         r["target_hits"], r["total_execs"]))
    all_bars.sort(key=lambda x: x[0])
    bar_vals   = [b[0] for b in all_bars]
    bar_labels = [b[1] for b in all_bars]
    bar_colors = [b[2] for b in all_bars]
    bars = ax.bar(range(len(bar_vals)), bar_vals, color=bar_colors, alpha=0.85)
    for bar, (v, _, _, _, hits, execs) in zip(bars, all_bars):
        ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.3,
                f"{v:.1f}%\n{hits}/{execs}", ha="center", va="bottom",
                fontsize=6, linespacing=1.3)
    ax.set_xticks(range(len(bar_labels)))
    ax.set_xticklabels(bar_labels, fontsize=7)
    ax.set_ylabel("Hit rate (%)")
    ax.set_title("All trials ranked by hit rate  (I=instrumented, P=plain; label: hits/execs)")
    ax.set_ylim(0, max(105, ax.get_ylim()[1] * 1.15))
    for target in targets:
        ax.bar(0, 0, color=COLORS[target], alpha=0.85, label=LABELS[target])
    ax.legend(fontsize=8)
    ax.grid(True, axis="y", alpha=0.3)

    # ── 4. Campaign summary table (concrete totals, no chart-reading needed) ─
    ax = ax_table
    ax.axis("off")
    ax.set_title("Campaign summary", fontsize=11, fontweight="bold", pad=14)

    def target_stat(target, fn):
        t_rows = [r for r in rows if r["target"] == target]
        return fn(t_rows) if t_rows else "—"

    table_metrics = [
        ("Total execs",     lambda rs: f"{sum(r['total_execs'] for r in rs):,}"),
        ("Total hits",      lambda rs: f"{sum(r['target_hits'] for r in rs):,}"),
        ("Campaign hit %",  lambda rs: f"{sum(r['target_hits'] for r in rs)/sum(r['total_execs'] for r in rs)*100:.1f}%"
                             if sum(r['total_execs'] for r in rs) else "—"),
        ("Mean execs/trial", lambda rs: f"{sum(r['total_execs'] for r in rs)/len(rs):,.1f}"),
        ("Mean hits/trial",  lambda rs: f"{sum(r['target_hits'] for r in rs)/len(rs):,.1f}"),
        ("Mean hit rate",    lambda rs: f"{sum(r['hit_rate'] for r in rs)/len(rs)*100:.1f}%"),
        ("Best hit rate",    lambda rs: f"{max(r['hit_rate'] for r in rs)*100:.1f}%"),
        ("Worst hit rate",   lambda rs: f"{min(r['hit_rate'] for r in rs)*100:.1f}%"),
    ]
    col_labels = ["Metric", LABELS["instrumented"], LABELS["plain"]]
    cell_text = [[label, target_stat("instrumented", fn), target_stat("plain", fn)]
                 for label, fn in table_metrics]

    def tint(hex_color, amount=0.85):
        r, g, b = (int(hex_color[i:i+2], 16) for i in (1, 3, 5))
        r, g, b = (int(v + (255 - v) * amount) for v in (r, g, b))
        return f"#{r:02x}{g:02x}{b:02x}"

    tbl = ax.table(cellText=cell_text, colLabels=col_labels,
                    cellLoc="center", loc="upper center")
    tbl.auto_set_font_size(False)
    tbl.set_fontsize(9)
    tbl.scale(1, 1.6)
    for (r, c), cell in tbl.get_celld().items():
        cell.set_edgecolor("#cccccc")
        if r == 0:
            cell.set_facecolor("#e0e0e0")
            cell.set_text_props(fontweight="bold")
        elif c == 0:
            cell.set_text_props(ha="left")
        elif c == 1:
            cell.set_facecolor(tint(COLORS["instrumented"]))
        elif c == 2:
            cell.set_facecolor(tint(COLORS["plain"]))

    with warnings.catch_warnings():
        warnings.simplefilter("ignore")
        plt.tight_layout(pad=1.5, rect=(0, 0, 1, 0.89))
    fig.savefig(out_path, dpi=150)
    print(f"\n[plot] saved → {out_path}")
    plt.close(fig)

# ── markdown report ──────────────────────────────────────────────────────────
def save_report(data, rows, args):
    ex_title = EXAMPLES[args.example]["title"]
    campaign  = args.campaign or "default"
    lines = []
    lines.append(f"# MimicryMonitor — {ex_title}")
    lines.append(f"\n**Campaign:** {campaign}  ")
    lines.append(f"**Trials:** {args.trials} × {args.time}s  ")
    lines.append(f"**Policy:** {args.policy}  ")
    iv_mode = "coarse" if args.iv_feedback else ("path-aware" if args.iv_feedback_path else "disabled")
    lines.append(f"**IV feedback:** {iv_mode}\n")

    for target in ("instrumented", "plain"):
        t_rows = [r for r in rows if r["target"] == target]
        if not t_rows:
            continue
        lines.append(f"## {LABELS[target]}\n")
        lines.append("| Trial | Execs | Hits | Hit % | Exec/s |")
        lines.append("|------:|------:|-----:|------:|-------:|")
        for r in t_rows:
            lines.append(f"| {r['trial']} | {r['total_execs']} | {r['target_hits']} "
                         f"| {r['hit_rate']*100:.1f}% | {r['mean_eps']:.1f} |")

        execs = [r["total_execs"] for r in t_rows]
        hits  = [r["target_hits"] for r in t_rows]
        rates = [r["hit_rate"] for r in t_rows]
        mean_execs = sum(execs) / len(execs)
        mean_hits  = sum(hits)  / len(hits)
        mean_rate  = sum(rates) / len(rates)
        lines.append(f"| **Mean** | **{mean_execs:.1f}** | **{mean_hits:.1f}** "
                     f"| **{mean_rate*100:.1f}%** | |")

        total_execs = sum(execs)
        total_hits  = sum(hits)
        total_rate  = total_hits / total_execs if total_execs else 0
        lines.append(f"| **Total (campaign)** | **{total_execs}** | **{total_hits}** "
                     f"| **{total_rate*100:.1f}%** | |")

        best  = max(t_rows, key=lambda r: r["hit_rate"])
        worst = min(t_rows, key=lambda r: r["hit_rate"])
        ratio = best["hit_rate"] / worst["hit_rate"] if worst["hit_rate"] > 0 else float("inf")
        lines.append(f"\n**Best:** {best['hit_rate']*100:.1f}% (trial {best['trial']})  ")
        lines.append(f"**Worst:** {worst['hit_rate']*100:.1f}% (trial {worst['trial']})  ")
        lines.append(f"**Best/worst ratio:** {ratio:.2f}×\n")

    # Summary comparison table
    lines.append("## Summary\n")
    lines.append("| Metric | Instrumented | Plain |")
    lines.append("|--------|-------------|-------|")
    for target_label, target_key in [("Instrumented", "instrumented"), ("Plain", "plain")]:
        pass  # built below
    def stat(key, fn):
        row = {}
        for t in ("instrumented", "plain"):
            t_rows = [r for r in rows if r["target"] == t]
            row[t] = fn(t_rows) if t_rows else 0
        return row
    metrics = [
        ("Total execs (campaign)", lambda rs: f"{sum(r['total_execs'] for r in rs)}"),
        ("Total hits (campaign)",  lambda rs: f"{sum(r['target_hits'] for r in rs)}"),
        ("Campaign hit rate",      lambda rs: f"{sum(r['target_hits'] for r in rs)/sum(r['total_execs'] for r in rs)*100:.1f}%"
                                   if sum(r['total_execs'] for r in rs) else "—"),
        ("Mean execs/trial", lambda rs: f"{sum(r['total_execs'] for r in rs)/len(rs):.1f}"),
        ("Mean hits/trial",  lambda rs: f"{sum(r['target_hits'] for r in rs)/len(rs):.1f}"),
        ("Mean hit rate",    lambda rs: f"{sum(r['hit_rate'] for r in rs)/len(rs)*100:.1f}%"),
        ("Best hit rate",    lambda rs: f"{max(r['hit_rate'] for r in rs)*100:.1f}%"),
        ("Worst hit rate",   lambda rs: f"{min(r['hit_rate'] for r in rs)*100:.1f}%"),
        ("Best/worst ratio", lambda rs: f"{max(r['hit_rate'] for r in rs)/min(r['hit_rate'] for r in rs):.2f}×"
                             if min(r['hit_rate'] for r in rs) > 0 else "∞"),
    ]
    for label, fn in metrics:
        i_rows = [r for r in rows if r["target"] == "instrumented"]
        p_rows = [r for r in rows if r["target"] == "plain"]
        i_val = fn(i_rows) if i_rows else "—"
        p_val = fn(p_rows) if p_rows else "—"
        lines.append(f"| {label} | {i_val} | {p_val} |")

    md_path = args.results / "report.md"
    md_path.write_text("\n".join(lines) + "\n")
    print(f"[report] saved → {md_path}")


# ── main ─────────────────────────────────────────────────────────────────────
def main():
    args = parse_args()
    args.results.mkdir(parents=True, exist_ok=True)
    if args.out is None:
        args.out = args.results / f"{args.example}.png"

    if not args.skip_build and not args.skip_fuzz and not args.dry_run:
        build_instrumented(args)

    if not args.skip_fuzz:
        run_all(args)

    print("\n[parse] loading results …")
    data = load_results(args)
    rows = save_summary(data, args)
    save_report(data, rows, args)
    make_plots(data, rows, args, args.out)
    print("[done]")

    if args.notion:
        campaign = args.campaign or args.example
        try:
            notion_publish.publish(args.results, campaign,
                                    notion_publish.DEFAULT_PAGE,
                                    os.environ.get("NOTION_TOKEN"),
                                    example=args.example)
        except notion_publish.NotionPublishError as e:
            print(f"[notion] publish failed (non-fatal): {e}")

if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""
overhead_micro.py — direct-replay microbenchmark of monitor instrumentation
overhead. Does NOT touch targetbench.py or its results.

Why this exists: comparing exec/sec between two independent AFL fuzzing
sessions (see targetbench.py) confounds instrumentation cost with (a) two
different, independently-mutated corpora, (b) AFL scheduling/calibration
noise, and (c) whatever the machine's thermal/frequency state happens to be
during each session's multi-hour window. This script removes all three:

  1. Pull a diverse sample of REAL inputs from an existing AFL queue/ dir
     (already-fuzzed grammar-shaped inputs — much better coverage of the
     automaton's state space than the static seed set).
  2. Replay each input directly against both binaries (no afl-fuzz in the
     loop), alternating instrumented/plain in randomized order per input so
     short-term drift can't bias one side.
  3. Time each execution (wall clock + child CPU time via getrusage).
  4. Per input, read the monitor's own step count (mm_steps, via
     MM_STOP_LOG's "steps=N") from the instrumented run and regress
     Δt = t_instrumented - t_plain against steps. The fitted slope is the
     monitor's cost per monitored transition, in nanoseconds — a number
     that doesn't require the two corpora or sessions to match, because
     it's a per-input paired comparison, not a group comparison.

IMPORTANT: point --instrumented-bin at a binary built with -policy n
(see targetbench.py --policy n). If the instrumented binary can early-abort
(stop-v/stop-iv), aborted inputs finish artificially fast, which reintroduces
exactly the confound this script exists to remove. The script checks the
stoplog for early=1 and warns loudly if it finds any.

Usage:
  evaluation/bench/.venv/bin/python evaluation/bench/rq2_overhead/overhead_micro.py \\
    --queue-dir evaluation/bench/results/rq2_overhead/overhead_long/instrumented/t1/default/queue \\
    --instrumented-bin work/outputs/instrumentedPUA_overhead_long \\
    --plain-bin work/outputs/pua_plain_overhead_long \\
    --n-inputs 150 --reps 30 --cpu 3 --campaign t1
"""

import argparse
import csv
import json
import os
import random
import resource
import subprocess
import sys
import time
from pathlib import Path

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

REPO = Path(__file__).resolve().parents[3]
DEFAULT_WRAPPER_SRC = REPO / "pipeline/afl_cat_cmdline_wrapper.c"

COLORS = {"instrumented": "#d1495b", "plain": "#2e86ab"}
LABELS = {"instrumented": "Instrumented (MM)", "plain": "Plain (AFL only)"}

# ── CLI ──────────────────────────────────────────────────────────────────────
def parse_args():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--queue-dir", type=Path, required=True,
                   help="AFL queue/ dir to sample real replay inputs from")
    p.add_argument("--instrumented-bin", type=Path,
                   default=REPO / "work/outputs/instrumentedPUA",
                   help="instrumented target binary (build with -policy n!)")
    p.add_argument("--plain-bin", type=Path,
                   default=REPO / "work/outputs/pua_plain",
                   help="plain target binary")
    p.add_argument("--wrapper-src", type=Path, default=DEFAULT_WRAPPER_SRC,
                   help="argv-rewriting wrapper .c compiled around each binary")
    p.add_argument("--n-inputs", type=int, default=150,
                   help="max number of queue inputs to sample (default 150)")
    p.add_argument("--reps", type=int, default=30,
                   help="timed repetitions per input per variant (default 30)")
    p.add_argument("--warmup", type=int, default=2,
                   help="untimed warmup reps per input per variant (default 2)")
    p.add_argument("--cpu", type=int, default=None,
                   help="taskset core to pin both variants to (recommended, e.g. 3)")
    p.add_argument("--timeout", type=float, default=5.0,
                   help="per-exec timeout in seconds; input pair skipped on timeout")
    p.add_argument("--seed", type=int, default=0, help="RNG seed (sampling + order)")
    p.add_argument("--campaign", default=None,
                   help="namespaces results to results/rq2_overhead/micro/<campaign>")
    p.add_argument("--results", type=Path, default=None)
    p.add_argument("--skip-run", action="store_true",
                   help="skip replay, just re-fit/re-plot from existing raw.csv")
    args = p.parse_args()
    if args.results is None:
        args.results = REPO / "evaluation/bench/results/rq2_overhead/micro" / (args.campaign or "default")
    return args

# ── environment sanity ──────────────────────────────────────────────────────
def check_governor():
    try:
        gov = Path("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor").read_text().strip()
    except OSError:
        return
    if gov != "performance":
        print(f"[warn] CPU governor is '{gov}', not 'performance'. Clock speed can drift "
              f"between the instrumented/plain measurements for the same input and add noise "
              f"to the regression. Consider: sudo cpupower frequency-set -g performance",
              file=sys.stderr)

# ── build the two replay wrappers ───────────────────────────────────────────
def build_wrapper(wrapper_src, target_bin, out_path):
    if not target_bin.exists():
        sys.exit(f"[build] target binary not found: {target_bin}")
    cmd = ["cc", str(wrapper_src), f'-DTARGET_BINARY="{target_bin}"', "-O2", "-o", str(out_path)]
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0:
        sys.exit(f"[build] wrapper compile failed:\n{r.stderr}")

# ── sample inputs ────────────────────────────────────────────────────────────
def sample_inputs(queue_dir, n, rng):
    files = sorted(f for f in queue_dir.iterdir() if f.is_file())
    if not files:
        sys.exit(f"[sample] no files found in {queue_dir}")
    if len(files) > n:
        files = rng.sample(files, n)
    return files

# ── single timed execution ──────────────────────────────────────────────────
def run_once(wrapper_bin, input_file, cpu, mm_log, timeout):
    cmd = []
    if cpu is not None:
        cmd += ["taskset", "-c", str(cpu)]
    cmd += [str(wrapper_bin), str(input_file)]
    env = dict(os.environ, MM_STOP_LOG=str(mm_log))
    ru0 = resource.getrusage(resource.RUSAGE_CHILDREN)
    t0 = time.perf_counter_ns()
    subprocess.run(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                   stdin=subprocess.DEVNULL, env=env, timeout=timeout)
    t1 = time.perf_counter_ns()
    ru1 = resource.getrusage(resource.RUSAGE_CHILDREN)
    wall_ns = t1 - t0
    cpu_ns = int(((ru1.ru_utime + ru1.ru_stime) - (ru0.ru_utime + ru0.ru_stime)) * 1e9)
    return wall_ns, cpu_ns

def read_last_steps(log_path):
    """Parse the last 'steps=N' and 'early=' from an MM_STOP_LOG file."""
    steps, early = None, None
    try:
        for line in log_path.read_text().splitlines():
            for tok in line.split():
                if tok.startswith("steps="):
                    steps = int(tok.split("=", 1)[1])
                elif tok.startswith("early="):
                    early = int(tok.split("=", 1)[1])
    except FileNotFoundError:
        pass
    return steps, early

# ── replay all inputs ────────────────────────────────────────────────────────
def replay(args, instr_wrapper, plain_wrapper, inputs, rng, scratch):
    raw_rows = []       # every single timed rep
    per_input_rows = [] # per-input aggregates
    any_early = False

    variants = {"instrumented": instr_wrapper, "plain": plain_wrapper}

    for idx, inp in enumerate(inputs):
        log_paths = {v: scratch / f"{inp.name.replace(':','_')}_{v}.log" for v in variants}
        for lp in log_paths.values():
            lp.unlink(missing_ok=True)

        times = {"instrumented": {"wall": [], "cpu": []}, "plain": {"wall": [], "cpu": []}}

        # warmup (untimed, primes caches, also produces the log line we'll read)
        for v, wrapper in variants.items():
            for _ in range(args.warmup):
                try:
                    run_once(wrapper, inp, args.cpu, log_paths[v], args.timeout)
                except subprocess.TimeoutExpired:
                    pass

        # timed reps, randomized interleave order per input
        order = ["instrumented"] * args.reps + ["plain"] * args.reps
        rng.shuffle(order)
        timed_out = False
        for pos, v in enumerate(order):
            try:
                wall_ns, cpu_ns = run_once(variants[v], inp, args.cpu, log_paths[v], args.timeout)
            except subprocess.TimeoutExpired:
                timed_out = True
                break
            times[v]["wall"].append(wall_ns)
            times[v]["cpu"].append(cpu_ns)
            raw_rows.append({"input": inp.name, "variant": v, "order_pos": pos,
                              "wall_ns": wall_ns, "cpu_ns": cpu_ns})

        if timed_out or not times["instrumented"]["wall"] or not times["plain"]["wall"]:
            print(f"  [skip] {inp.name} (timeout)")
            continue

        steps, early = read_last_steps(log_paths["instrumented"])
        if early == 1:
            any_early = True
        if steps is None:
            print(f"  [skip] {inp.name} (no steps= in stoplog — MM_STOP_LOG not written?)")
            continue

        i_wall = float(np.median(times["instrumented"]["wall"]))
        p_wall = float(np.median(times["plain"]["wall"]))
        i_cpu  = float(np.median(times["instrumented"]["cpu"]))
        p_cpu  = float(np.median(times["plain"]["cpu"]))

        per_input_rows.append({
            "input": inp.name, "steps": steps, "early": early,
            "instr_wall_ns": i_wall, "plain_wall_ns": p_wall, "delta_wall_ns": i_wall - p_wall,
            "instr_cpu_ns":  i_cpu,  "plain_cpu_ns":  p_cpu,  "delta_cpu_ns":  i_cpu - p_cpu,
        })

        if (idx + 1) % 20 == 0 or idx == len(inputs) - 1:
            print(f"  [{idx+1}/{len(inputs)}] {inp.name}: steps={steps} "
                  f"Δwall={i_wall - p_wall:+.0f}ns Δcpu={i_cpu - p_cpu:+.0f}ns", flush=True)

    if any_early:
        print("\n[WARNING] at least one instrumented run recorded early=1 (policy aborted).\n"
              "          --instrumented-bin should be built with -policy n for this benchmark —\n"
              "          early aborts finish faster for reasons unrelated to per-step monitoring\n"
              "          cost and will bias the regression. Rebuild with:\n"
              "            targetbench.py --policy n  (or run-mimicry.sh -afl -policy n)\n",
              file=sys.stderr)

    return raw_rows, per_input_rows

# ── stats ────────────────────────────────────────────────────────────────────
def linreg(x, y):
    x = np.asarray(x, dtype=float); y = np.asarray(y, dtype=float)
    xm, ym = x.mean(), y.mean()
    sxx = ((x - xm) ** 2).sum()
    if sxx == 0:
        return 0.0, ym, 0.0
    slope = ((x - xm) * (y - ym)).sum() / sxx
    intercept = ym - slope * xm
    yhat = slope * x + intercept
    ss_res = ((y - yhat) ** 2).sum()
    ss_tot = ((y - ym) ** 2).sum()
    r2 = 1 - ss_res / ss_tot if ss_tot > 0 else 0.0
    return slope, intercept, r2

def bootstrap_slope_ci(x, y, b=2000, seed=0):
    rng = np.random.default_rng(seed)
    x = np.asarray(x, dtype=float); y = np.asarray(y, dtype=float)
    n = len(x)
    slopes = np.empty(b)
    for i in range(b):
        idx = rng.integers(0, n, n)
        slopes[i], _, _ = linreg(x[idx], y[idx])
    lo, hi = np.percentile(slopes, [2.5, 97.5])
    return float(lo), float(hi)

# ── save + report ────────────────────────────────────────────────────────────
def save_outputs(raw_rows, per_input_rows, args, capture_meta=None):
    """capture_meta records the args that actually produced raw.csv (cpu pin,
    reps, warmup). Pass it on a real capture run. On --skip-run (replot only),
    pass None so the previous run's meta is preserved instead of being
    clobbered by whatever CLI flags happen to be set for the replot."""
    args.results.mkdir(parents=True, exist_ok=True)

    if capture_meta is None:
        summary_path = args.results / "summary.json"
        capture_meta = {}
        if summary_path.exists():
            try:
                existing = json.loads(summary_path.read_text())
                capture_meta = {k: existing[k] for k in ("cpu_pin", "reps", "warmup") if k in existing}
            except (json.JSONDecodeError, KeyError):
                pass

    with (args.results / "raw.csv").open("w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=raw_rows[0].keys())
        w.writeheader(); w.writerows(raw_rows)

    with (args.results / "per_input.csv").open("w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=per_input_rows[0].keys())
        w.writeheader(); w.writerows(per_input_rows)

    steps  = np.array([r["steps"] for r in per_input_rows])
    dwall  = np.array([r["delta_wall_ns"] for r in per_input_rows])
    dcpu   = np.array([r["delta_cpu_ns"] for r in per_input_rows])

    slope_w, intercept_w, r2_w = linreg(steps, dwall)
    lo_w, hi_w = bootstrap_slope_ci(steps, dwall, seed=args.seed)
    slope_c, intercept_c, r2_c = linreg(steps, dcpu)
    lo_c, hi_c = bootstrap_slope_ci(steps, dcpu, seed=args.seed)

    instr_wall = np.array([r["instr_wall_ns"] for r in per_input_rows])
    plain_wall = np.array([r["plain_wall_ns"] for r in per_input_rows])
    instr_cpu  = np.array([r["instr_cpu_ns"] for r in per_input_rows])
    plain_cpu  = np.array([r["plain_cpu_ns"] for r in per_input_rows])
    pct_overhead_wall = (instr_wall.mean() / plain_wall.mean() - 1) * 100
    pct_overhead_cpu  = (instr_cpu.mean()  / plain_cpu.mean()  - 1) * 100

    summary = {
        **capture_meta,
        "n_inputs": len(per_input_rows),
        "steps_min": int(steps.min()), "steps_max": int(steps.max()),
        "steps_unique": int(len(np.unique(steps))),
        "mean_instr_wall_ns": float(instr_wall.mean()), "mean_plain_wall_ns": float(plain_wall.mean()),
        "mean_instr_cpu_ns":  float(instr_cpu.mean()),  "mean_plain_cpu_ns":  float(plain_cpu.mean()),
        "pct_overhead_wall": pct_overhead_wall, "pct_overhead_cpu": pct_overhead_cpu,
        "slope_ns_per_step_wall": slope_w, "slope_ci95_wall": [lo_w, hi_w],
        "intercept_ns_wall": intercept_w, "r2_wall": r2_w,
        "slope_ns_per_step_cpu": slope_c, "slope_ci95_cpu": [lo_c, hi_c],
        "intercept_ns_cpu": intercept_c, "r2_cpu": r2_c,
    }
    (args.results / "summary.json").write_text(json.dumps(summary, indent=2))

    steps_span_warning = ""
    if summary["steps_unique"] < 10 or (steps.max() - steps.min()) < 5:
        steps_span_warning = (
            "\n**Warning:** the sampled inputs cover a narrow range of `steps` "
            f"({summary['steps_min']}–{summary['steps_max']}, {summary['steps_unique']} distinct "
            "values). The regression slope is not well constrained — sample more inputs, or from "
            "a queue/ dir with more diverse automaton depth, before trusting the fitted overhead.\n")

    lines = [
        "# MimicryMonitor — direct-replay instrumentation overhead",
        f"\n**Campaign:** {args.campaign or 'default'}  ",
        f"**Inputs:** {summary['n_inputs']} (from `{args.queue_dir}`)  ",
        f"**Reps/input/variant:** {summary.get('reps', args.reps)} "
        f"(+{summary.get('warmup', args.warmup)} warmup)  ",
        f"**CPU pin:** {summary.get('cpu_pin', args.cpu) if summary.get('cpu_pin', args.cpu) is not None else 'none'}  ",
        f"**Steps range:** {summary['steps_min']}–{summary['steps_max']} "
        f"({summary['steps_unique']} distinct values)\n",
        steps_span_warning,
        "## Headline",
        "",
        f"- Mean wall time: instrumented {instr_wall.mean()/1e6:.3f} ms vs "
        f"plain {plain_wall.mean()/1e6:.3f} ms ({pct_overhead_wall:+.1f}%)",
        f"- Mean child CPU time: instrumented {instr_cpu.mean()/1e6:.3f} ms vs "
        f"plain {plain_cpu.mean()/1e6:.3f} ms ({pct_overhead_cpu:+.1f}%)",
        f"- **Fitted cost per monitored step (wall):** {slope_w:.1f} ns/step "
        f"(95% CI [{lo_w:.1f}, {hi_w:.1f}], R²={r2_w:.3f})",
        f"- **Fitted cost per monitored step (CPU):** {slope_c:.1f} ns/step "
        f"(95% CI [{lo_c:.1f}, {hi_c:.1f}], R²={r2_c:.3f})",
        f"- Fixed per-exec overhead independent of steps (wall intercept): {intercept_w:.0f} ns",
        "",
        "CPU-time regression is the more trustworthy of the two — wall time also carries "
        "fork/exec and OS scheduling noise that CPU time (getrusage on the child) excludes.",
    ]
    (args.results / "report.md").write_text("\n".join(lines) + "\n")

    print(f"\n{'─'*60}")
    print(f"n_inputs={summary['n_inputs']}  steps range={summary['steps_min']}-{summary['steps_max']} "
          f"({summary['steps_unique']} distinct)")
    print(f"wall: instrumented {instr_wall.mean()/1e6:.3f}ms vs plain {plain_wall.mean()/1e6:.3f}ms "
          f"({pct_overhead_wall:+.1f}%)")
    print(f"cpu:  instrumented {instr_cpu.mean()/1e6:.3f}ms vs plain {plain_cpu.mean()/1e6:.3f}ms "
          f"({pct_overhead_cpu:+.1f}%)")
    print(f"slope (cpu): {slope_c:.1f} ns/step  95% CI [{lo_c:.1f}, {hi_c:.1f}]  R²={r2_c:.3f}")
    print(f"{'─'*60}")
    if steps_span_warning:
        print(steps_span_warning)
    print(f"[report] saved -> {args.results / 'report.md'}")
    return summary

# ── plots ────────────────────────────────────────────────────────────────────
def make_plots(per_input_rows, raw_rows, summary, args):
    steps = np.array([r["steps"] for r in per_input_rows])

    metrics = {
        "wall": {
            "delta_key": "delta_wall_ns", "instr_key": "instr_wall_ns", "plain_key": "plain_wall_ns",
            "raw_key": "wall_ns", "label": "wall time",
        },
        "cpu": {
            "delta_key": "delta_cpu_ns", "instr_key": "instr_cpu_ns", "plain_key": "plain_cpu_ns",
            "raw_key": "cpu_ns", "label": "CPU time",
        },
    }

    fig, axes = plt.subplots(4, 2, figsize=(13, 20))
    cpu_pin = summary.get("cpu_pin", args.cpu)
    fig.suptitle("MimicryMonitor — direct-replay instrumentation overhead\n"
                 f"({summary['n_inputs']} inputs × {summary.get('reps', args.reps)} reps, "
                 f"cpu={cpu_pin if cpu_pin is not None else 'unpinned'})",
                 fontsize=13, fontweight="bold")

    for col, (mkey, m) in enumerate(metrics.items()):
        delta = np.array([r[m["delta_key"]] for r in per_input_rows]) / 1e3   # us
        instr = np.array([r[m["instr_key"]] for r in per_input_rows]) / 1e3
        plain = np.array([r[m["plain_key"]] for r in per_input_rows]) / 1e3
        raw = {"instrumented": [], "plain": []}
        for r in raw_rows:
            raw[r["variant"]].append(r[m["raw_key"]] / 1e3)

        # row 0: steps vs Δ with fitted regression
        ax = axes[0, col]
        slope, intercept, r2 = linreg(steps, np.array([r[m["delta_key"]] for r in per_input_rows]))
        ax.scatter(steps, delta, s=14, color=COLORS["instrumented"], alpha=0.6,
                   label=f"per-input Δ ({mkey})")
        xs = np.linspace(steps.min(), steps.max(), 100)
        ax.plot(xs, (slope * xs + intercept) / 1e3, color="black", linewidth=1.5,
                label=f"fit: {slope:.1f} ns/step  R²={r2:.2f}")
        ax.axhline(0, color="gray", linewidth=0.8, linestyle="--")
        ax.set_xlabel("steps (monitored transitions)")
        ax.set_ylabel(f"Δ {m['label']}, instrumented − plain (µs)")
        ax.set_title(f"Per-step monitoring cost ({m['label']})")
        ax.legend(fontsize=8)
        ax.grid(True, alpha=0.3)

        # row 1: paired per-input time, instrumented vs plain
        ax = axes[1, col]
        lim = max(instr.max(), plain.max()) * 1.05
        ax.plot([0, lim], [0, lim], color="gray", linewidth=0.8, linestyle="--", label="y = x")
        ax.scatter(plain, instr, s=14, color=COLORS["instrumented"], alpha=0.6)
        ax.set_xlabel(f"plain {m['label']} (µs)")
        ax.set_ylabel(f"instrumented {m['label']} (µs)")
        ax.set_title(f"Per-input paired {m['label']}")
        ax.legend(fontsize=8)
        ax.grid(True, alpha=0.3)

        # row 2: distribution of all raw per-exec times
        ax = axes[2, col]
        bp = ax.boxplot([raw["instrumented"], raw["plain"]], patch_artist=True,
                        widths=0.4, showfliers=False)
        for patch, c in zip(bp["boxes"], [COLORS["instrumented"], COLORS["plain"]]):
            patch.set_facecolor(c); patch.set_alpha(0.7)
        for element in ("whiskers", "caps", "medians"):
            for item in bp[element]:
                item.set_color("black")
        ax.set_xticklabels([LABELS["instrumented"], LABELS["plain"]], fontsize=8)
        ax.set_ylabel(f"{m['label']} per exec (µs)")
        ax.set_title(f"Raw per-exec {m['label']} (all reps)")
        ax.grid(True, axis="y", alpha=0.3)

    # row 3: steps distribution across sampled inputs (diversity check) — shared, spans both columns
    axes[3, 0].remove()
    axes[3, 1].remove()
    ax_hist = fig.add_subplot(4, 1, 4)
    ax_hist.hist(steps, bins=min(30, max(5, summary["steps_unique"])),
            color=COLORS["instrumented"], alpha=0.75, edgecolor="black", linewidth=0.5)
    ax_hist.set_xlabel("steps (monitored transitions)")
    ax_hist.set_ylabel("# sampled inputs")
    ax_hist.set_title(f"Coverage of automaton depth in the sample "
                 f"({summary['steps_unique']} distinct values)")
    ax_hist.grid(True, axis="y", alpha=0.3)

    plt.tight_layout(pad=1.5)
    out_path = args.results / f"overhead_micro_{args.campaign or 'default'}.png"
    fig.savefig(out_path, dpi=150)
    plt.close(fig)
    print(f"[plot] saved -> {out_path}")

# ── main ─────────────────────────────────────────────────────────────────────
def main():
    args = parse_args()
    args.results.mkdir(parents=True, exist_ok=True)
    rng_py = random.Random(args.seed)

    if args.skip_run:
        raw_rows, per_input_rows = [], []
        with (args.results / "raw.csv").open() as f:
            raw_rows = list(csv.DictReader(f))
        for r in raw_rows:
            r["wall_ns"] = int(r["wall_ns"]); r["cpu_ns"] = int(r["cpu_ns"]); r["order_pos"] = int(r["order_pos"])
        with (args.results / "per_input.csv").open() as f:
            per_input_rows = list(csv.DictReader(f))
        for r in per_input_rows:
            for k in r:
                if k != "input":
                    r[k] = float(r[k]) if "." in r[k] or "e" in r[k].lower() else int(float(r[k]))
        summary = save_outputs(raw_rows, per_input_rows, args)
        make_plots(per_input_rows, raw_rows, summary, args)
        return

    check_governor()
    if not args.queue_dir.is_dir():
        sys.exit(f"[error] queue dir not found: {args.queue_dir}")

    scratch = args.results / "_scratch"
    scratch.mkdir(parents=True, exist_ok=True)
    instr_wrapper = scratch / "wrapper_instrumented"
    plain_wrapper = scratch / "wrapper_plain"
    print(f"[build] wrapper around {args.instrumented_bin}")
    build_wrapper(args.wrapper_src, args.instrumented_bin, instr_wrapper)
    print(f"[build] wrapper around {args.plain_bin}")
    build_wrapper(args.wrapper_src, args.plain_bin, plain_wrapper)

    inputs = sample_inputs(args.queue_dir, args.n_inputs, rng_py)
    print(f"[sample] {len(inputs)} inputs from {args.queue_dir}")

    print(f"[replay] {args.reps} reps/variant/input, cpu={args.cpu}, timeout={args.timeout}s")
    raw_rows, per_input_rows = replay(args, instr_wrapper, plain_wrapper, inputs, rng_py, scratch)

    if not per_input_rows:
        sys.exit("[error] no usable input pairs collected (all timed out or lacked stoplog output)")

    capture_meta = {"cpu_pin": args.cpu, "reps": args.reps, "warmup": args.warmup}
    summary = save_outputs(raw_rows, per_input_rows, args, capture_meta=capture_meta)
    make_plots(per_input_rows, raw_rows, summary, args)
    print("[done]")

if __name__ == "__main__":
    main()

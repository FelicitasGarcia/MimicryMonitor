#!/usr/bin/env python3
"""
fuzzbench.py — measure whether fuzzing the *instrumented* PUA (Mimicry monitor
embedded) finds crashes faster / more efficiently than the *plain* PUA.

It runs N independent AFL++ trials of each target for a fixed time budget (via
pipeline/fuzz.sh, so the build + input-delivery logic is reused), parses AFL's
per-trial `plot_data` time series, aggregates across trials, and emits:

  - crashes_over_time   : cumulative unique crashes vs wall-clock time
  - coverage_over_time  : edges discovered vs time
  - time_to_first_crash : per-trial TTFC (the headline "faster?" metric)
  - throughput          : execs/sec (explains the monitor's overhead)
  - a combined fuzzbench.png, plus summary.json / summary.csv and a printed table

Efficiency is reported two ways:
  - wall-clock time-to-first-crash  -> "faster in practice"
  - executions-to-first-crash       -> per-exec efficiency (removes the throughput confound)

Run it with the bundled venv:
  evaluation/bench/.venv/bin/python evaluation/bench/fuzzbench.py --help

Example (cat, file input):
  evaluation/bench/.venv/bin/python evaluation/bench/fuzzbench.py \
    --seeds evaluation/seeds-cat --input file --targs=-A \
    --trials 5 --time 120 \
    --plain-pua examples/catCU/catPUA.c \
    --plain-include /PATH/coreutils/src /PATH/coreutils/lib \
    --plain-link /PATH/coreutils/lib/libcoreutils.a /PATH/coreutils/src/version.o

Prereqs:
  - Instrumented target built (./pipeline/run-mimicry.sh -afl ...) for the 'instrumented' arm.
  - core_pattern == 'core' so AFL detects crashes:  echo core | sudo tee /proc/sys/kernel/core_pattern
"""

import argparse
import csv
import json
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
FUZZ_SH = REPO_ROOT / "pipeline" / "fuzz.sh"

# AFL++ plot_data column aliases (names vary slightly across versions).
COL = {
    "time":    ["relative_time"],
    "crashes": ["saved_crashes", "unique_crashes", "total_crashes"],
    "edges":   ["edges_found", "map_size"],
    "eps":     ["execs_per_sec"],
    "execs":   ["total_execs"],
}
COLORS = {"instrumented": "#d1495b", "plain": "#2e86ab"}

# ANSI colours for terminal output
_C = {
    "instrumented": "\033[91m",  # bright red
    "plain":        "\033[94m",  # bright blue
    "reset":        "\033[0m",
    "bold":         "\033[1m",
    "green":        "\033[92m",
    "yellow":       "\033[93m",
    "grey":         "\033[90m",
}


# ----------------------------------------------------------------------------- run

def core_pattern_ok():
    try:
        return Path("/proc/sys/kernel/core_pattern").read_text().strip().startswith("core")
    except OSError:
        return True  # not Linux / can't tell — don't block


def build_cmd(target, seeds, input_mode, targs, out_dir, secs, args):
    cmd = ["bash", str(FUZZ_SH), "-input", input_mode,
           "-i", str(seeds), "-o", str(out_dir), "-t", str(secs)]
    if targs:
        cmd += ["-targs", targs]
    if getattr(args, "asan", False):
        cmd += ["-asan"]
    if target == "plain":
        cmd += ["-plain", "-pua", str(args.plain_pua)]
        if args.plain_include:
            cmd += ["-I", *map(str, args.plain_include)]
        if args.plain_link:
            cmd += ["-link", *map(str, args.plain_link)]
    return cmd


def _poll_plot_data(path):
    """Return (edges, crashes) from the last line of AFL's plot_data, or (0, 0)."""
    try:
        lines = path.read_text().splitlines()
        data_lines = [l for l in lines if l.strip() and not l.startswith("#")]
        if not data_lines:
            return 0, 0
        header = [c.strip() for c in lines[0].lstrip("#").split(",")]
        row = [v.strip() for v in data_lines[-1].split(",")]
        def pick(names):
            for n in names:
                if n in header:
                    idx = header.index(n)
                    return int(float(row[idx])) if idx < len(row) else 0
            return 0
        return pick(COL["edges"]), pick(COL["crashes"])
    except Exception:
        return 0, 0


def run_trials(args):
    from tqdm import tqdm

    env = dict(os.environ,
               AFL_NO_AFFINITY="1",
               AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES="1",
               AFL_SKIP_CPUFREQ="1")

    total = len(args.targets) * args.trials
    overall = tqdm(total=total, desc="all trials", unit="trial",
                   colour="cyan", dynamic_ncols=True, file=sys.stderr,
                   position=0, leave=True)

    for target in args.targets:
        tc = _C.get(target, "")
        reset = _C["reset"]
        bold = _C["bold"]
        tqdm.write(f"\n{tc}{bold}━━━ target: {target} ━━━{reset}", file=sys.stderr)

        for i in range(1, args.trials + 1):
            trial_dir = args.results / target / f"t{i}"
            shutil.rmtree(trial_dir, ignore_errors=True)
            trial_dir.mkdir(parents=True, exist_ok=True)
            cmd = build_cmd(target, args.seeds, args.input, args.targs,
                            trial_dir, args.time, args)

            if args.dry_run:
                tqdm.write(f"  [dry-run] {' '.join(cmd)}", file=sys.stderr)
                overall.update(1)
                continue

            plot_data_path = trial_dir / "default" / "plot_data"
            log = (trial_dir / "fuzz.log").open("w")
            proc = subprocess.Popen(cmd, cwd=str(REPO_ROOT), env=env,
                                    stdout=log, stderr=subprocess.STDOUT)

            trial_bar = tqdm(total=args.time, desc=f"  {tc}{bold}{target}{reset} t{i}/{args.trials}",
                             unit="s", colour="magenta" if target == "instrumented" else "blue",
                             dynamic_ncols=True, file=sys.stderr,
                             position=1, leave=False, bar_format=(
                                 "{desc}: {percentage:3.0f}%|{bar}| "
                                 "{n:.0f}/{total}s  [{elapsed}<{remaining}]  {postfix}"))

            start = time.monotonic()
            last_tick = 0
            while proc.poll() is None:
                elapsed = time.monotonic() - start
                tick = int(elapsed)
                if tick > last_tick:
                    trial_bar.update(min(tick - last_tick, args.time - last_tick))
                    last_tick = tick
                edges, crashes = _poll_plot_data(plot_data_path)
                crash_label = f"💥 crashes={crashes}" if crashes else "crashes=0"
                trial_bar.set_postfix_str(f"edges={edges}  {crash_label}", refresh=True)
                time.sleep(0.5)

            proc.wait()
            log.close()
            trial_bar.update(args.time - last_tick)
            edges, crashes = _poll_plot_data(plot_data_path)
            crash_label = f"💥 crashes={crashes}" if crashes else "crashes=0"
            trial_bar.set_postfix_str(f"edges={edges}  {crash_label}", refresh=True)
            trial_bar.close()

            rc = proc.returncode
            if not plot_data_path.exists():
                tqdm.write(f"  {_C['yellow']}WARNING: no plot_data (rc={rc}); "
                           f"see {trial_dir/'fuzz.log'}{_C['reset']}", file=sys.stderr)

            overall.update(1)

    overall.close()


# --------------------------------------------------------------------------- parse

def _pick(header, names):
    for n in names:
        if n in header:
            return header.index(n)
    return None


def parse_plot_data(path):
    """Return dict of float arrays keyed by COL names, or None if unusable."""
    import numpy as np
    header, rows = None, []
    for line in Path(path).read_text().splitlines():
        line = line.strip()
        if not line:
            continue
        if line.startswith("#"):
            header = [c.strip() for c in line[1:].split(",")]
            continue
        if header is None:
            continue
        rows.append([v.strip() for v in line.split(",")])
    if header is None or not rows:
        return None
    idx = {k: _pick(header, names) for k, names in COL.items()}
    if idx["time"] is None or idx["crashes"] is None:
        return None
    out = {}
    for key, j in idx.items():
        vals = []
        for r in rows:
            try:
                vals.append(float(r[j]) if j is not None and j < len(r) else 0.0)
            except ValueError:
                vals.append(0.0)
        out[key] = np.asarray(vals, dtype=float)
    return out


def step_fill(times, values, grid):
    """Forward-fill a cumulative series onto a common time grid (0 before first sample)."""
    import numpy as np
    if len(times) == 0:
        return np.zeros_like(grid, dtype=float)
    idx = np.searchsorted(times, grid, side="right") - 1
    return np.where(idx >= 0, values[np.clip(idx, 0, len(values) - 1)], 0.0)


def load(args):
    """results[target] = {'trials':[parsed...], 'grid':arr, 'crashes':2D, 'edges':2D, ...}"""
    import numpy as np
    grid = np.arange(0, args.time + 1, dtype=float)
    data = {}
    for target in args.targets:
        trials = []
        for tdir in sorted((args.results / target).glob("t*")):
            pd = tdir / "default" / "plot_data"
            if pd.exists():
                p = parse_plot_data(pd)
                if p:
                    trials.append(p)
        if not trials:
            data[target] = None
            continue
        crashes = np.vstack([step_fill(p["time"], p["crashes"], grid) for p in trials])
        edges   = np.vstack([step_fill(p["time"], p["edges"],   grid) for p in trials])
        ttfc, etfc, final_eps = [], [], []
        for p in trials:
            hit = np.where(p["crashes"] > 0)[0]
            if len(hit):
                ttfc.append(float(p["time"][hit[0]]))
                etfc.append(float(p["execs"][hit[0]]))
            final_eps.append(float(p["eps"][-1]))
        data[target] = dict(trials=trials, grid=grid, crashes=crashes, edges=edges,
                            ttfc=ttfc, etfc=etfc, final_eps=final_eps,
                            n=len(trials),
                            final_crashes=crashes[:, -1], final_edges=edges[:, -1])
    return data


# -------------------------------------------------------------------------- stats

def mann_whitney_p(a, b):
    """Two-sided Mann-Whitney U p-value via normal approximation (no scipy). None if too small."""
    import numpy as np
    na, nb = len(a), len(b)
    if na < 3 or nb < 3:
        return None
    allv = sorted([(v, 0) for v in a] + [(v, 1) for v in b])
    ranks = {}
    i = 0
    vals = [v for v, _ in allv]
    while i < len(vals):
        j = i
        while j + 1 < len(vals) and vals[j + 1] == vals[i]:
            j += 1
        r = (i + j) / 2.0 + 1.0
        for k in range(i, j + 1):
            ranks[k] = r
        i = j + 1
    ra = sum(ranks[k] for k, (_, g) in enumerate(allv) if g == 0)
    ua = ra - na * (na + 1) / 2.0
    mu = na * nb / 2.0
    sigma = (na * nb * (na + nb + 1) / 12.0) ** 0.5
    if sigma == 0:
        return None
    z = (ua - mu) / sigma
    # two-sided normal tail
    import math
    p = 2 * (1 - 0.5 * (1 + math.erf(abs(z) / math.sqrt(2))))
    return max(0.0, min(1.0, p))


def summarize(args, data):
    import numpy as np
    rows = []
    for target in args.targets:
        d = data.get(target)
        if not d:
            rows.append(dict(target=target, trials=0, note="no successful trials (build/run failed — see logs)"))
            continue
        n = d["n"]
        nc = len(d["ttfc"])
        rows.append(dict(
            target=target,
            trials=n,
            crash_trials=nc,
            detection_rate=round(nc / n, 3) if n else 0.0,
            ttfc_mean_s=round(float(np.mean(d["ttfc"])), 2) if nc else None,
            ttfc_median_s=round(float(np.median(d["ttfc"])), 2) if nc else None,
            execs_to_crash_mean=int(np.mean(d["etfc"])) if nc else None,
            final_unique_crashes_mean=round(float(np.mean(d["final_crashes"])), 2),
            final_edges_mean=round(float(np.mean(d["final_edges"])), 1),
            execs_per_sec_mean=int(np.mean(d["final_eps"])),
        ))
    return rows


# --------------------------------------------------------------------------- plot

def plot(args, data):
    import numpy as np
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    fig, ax = plt.subplots(2, 2, figsize=(13, 9))
    fig.suptitle(f"Fuzzing efficiency: instrumented vs plain  "
                 f"(input={args.input}, {args.trials} trials × {args.time}s)", fontsize=13)

    def band(a, target, title, ylabel):
        d = data.get(target)
        if not d:
            return
        grid = d["grid"]
        m, s = a.mean(axis=0), a.std(axis=0)
        c = COLORS.get(target, None)
        ax_.plot(grid, m, color=c, label=f"{target} (n={d['n']})")
        ax_.fill_between(grid, m - s, m + s, color=c, alpha=0.18)

    # (0,0) crashes over time
    ax_ = ax[0][0]
    for t in args.targets:
        if data.get(t):
            band(data[t]["crashes"], t, None, None)
    ax_.set_title("Cumulative unique crashes vs time")
    ax_.set_xlabel("time (s)"); ax_.set_ylabel("unique crashes (mean ± std)")
    ax_.legend(); ax_.grid(alpha=0.3)

    # (0,1) coverage over time
    ax_ = ax[0][1]
    for t in args.targets:
        if data.get(t):
            band(data[t]["edges"], t, None, None)
    ax_.set_title("Edge coverage vs time")
    ax_.set_xlabel("time (s)"); ax_.set_ylabel("edges found (mean ± std)")
    ax_.legend(); ax_.grid(alpha=0.3)

    # (1,0) time-to-first-crash per trial
    ax_ = ax[1][0]
    for k, t in enumerate(args.targets):
        d = data.get(t)
        if not d:
            continue
        c = COLORS.get(t)
        xs = np.random.default_rng(k).normal(k, 0.05, size=len(d["ttfc"]))
        ax_.scatter(xs, d["ttfc"], color=c, alpha=0.8, zorder=3)
        if d["ttfc"]:
            ax_.hlines(np.mean(d["ttfc"]), k - 0.2, k + 0.2, color=c, lw=2)
        censored = d["n"] - len(d["ttfc"])
        if censored:
            ax_.scatter([k] * censored, [args.time] * censored, marker="x",
                        color=c, alpha=0.6, label=f"{t}: {censored} no-crash")
    ax_.set_title("Time to first crash (per trial; lower = faster)")
    ax_.set_xticks(range(len(args.targets))); ax_.set_xticklabels(args.targets)
    ax_.set_ylabel("seconds"); ax_.grid(alpha=0.3, axis="y")
    if any((data.get(t) and data[t]["n"] - len(data[t]["ttfc"])) for t in args.targets):
        ax_.legend()

    # (1,1) throughput
    ax_ = ax[1][1]
    xs, heights, cols = [], [], []
    for k, t in enumerate(args.targets):
        d = data.get(t)
        if not d:
            continue
        xs.append(k); heights.append(float(np.mean(d["final_eps"]))); cols.append(COLORS.get(t))
    ax_.bar(xs, heights, color=cols, width=0.5)
    ax_.set_title("Throughput (mean execs/sec)")
    ax_.set_xticks(range(len(args.targets))); ax_.set_xticklabels(args.targets)
    ax_.set_ylabel("execs/sec"); ax_.grid(alpha=0.3, axis="y")

    fig.tight_layout(rect=[0, 0, 1, 0.96])
    out = args.results / "fuzzbench.png"
    fig.savefig(out, dpi=120)
    print(f"[plot] wrote {out}")


# ---------------------------------------------------------------------------- main

def report(args, data):
    rows = summarize(args, data)
    # write json + csv
    (args.results / "summary.json").write_text(json.dumps(rows, indent=2))
    keys = sorted({k for r in rows for k in r})
    with (args.results / "summary.csv").open("w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=keys); w.writeheader(); w.writerows(rows)

    print("\n================ SUMMARY ================")
    for r in rows:
        print(f"\n[{r['target']}]")
        for k, v in r.items():
            if k != "target":
                print(f"   {k:26} {v}")

    # verdict
    di, dp = data.get("instrumented"), data.get("plain")
    if di and dp and di["ttfc"] and dp["ttfc"]:
        import numpy as np
        mi, mp = np.mean(di["ttfc"]), np.mean(dp["ttfc"])
        faster = "instrumented" if mi < mp else "plain"
        ratio = (max(mi, mp) / min(mi, mp)) if min(mi, mp) > 0 else float("inf")
        p = mann_whitney_p(di["ttfc"], dp["ttfc"])
        print("\n================ VERDICT ================")
        print(f"   mean time-to-first-crash: instrumented={mi:.1f}s  plain={mp:.1f}s")
        print(f"   -> {faster} found crashes ~{ratio:.2f}x faster (wall-clock)")
        ei, ep = np.mean(di["etfc"]), np.mean(dp["etfc"])
        print(f"   mean execs-to-first-crash: instrumented={ei:,.0f}  plain={ep:,.0f}")
        if p is not None:
            sig = "significant" if p < 0.05 else "NOT significant"
            print(f"   Mann-Whitney U on TTFC: p={p:.3f} ({sig} at a=0.05)")
        else:
            print("   (need >=3 crashing trials per target for a p-value)")
    print("=========================================\n")


def main():
    ap = argparse.ArgumentParser(description="Benchmark instrumented vs plain fuzzing efficiency.")
    ap.add_argument("--time", type=int, default=120, help="seconds per trial (default 120)")
    ap.add_argument("--trials", type=int, default=5, help="trials per target (default 5)")
    ap.add_argument("--seeds", type=Path, default=REPO_ROOT / "evaluation" / "seeds-cat")
    ap.add_argument("--input", choices=["argv", "file", "stdin"], default="file")
    ap.add_argument("--targs", default="",
                    help='args for the program in file/stdin modes; use = for dash args, e.g. --targs=-A')
    ap.add_argument("--targets", nargs="+", default=["instrumented", "plain"],
                    choices=["instrumented", "plain"])
    ap.add_argument("--results", type=Path, default=REPO_ROOT / "evaluation" / "bench" / "results")
    ap.add_argument("--plain-pua", type=Path, default=REPO_ROOT / "examples" / "catCU" / "catPUA.c")
    ap.add_argument("--plain-include", nargs="*", type=Path, default=[])
    ap.add_argument("--plain-link", nargs="*", type=Path, default=[])
    ap.add_argument("--asan", action="store_true", help="compile with AddressSanitizer (plain); expect ASan instrumented binary")
    ap.add_argument("--dry-run", action="store_true", help="print fuzz.sh commands, don't run")
    ap.add_argument("--plot-only", action="store_true", help="skip running; parse+plot existing results")
    args = ap.parse_args()
    args.results = args.results.resolve()
    args.results.mkdir(parents=True, exist_ok=True)

    if not args.plot_only and not core_pattern_ok():
        print("WARNING: /proc/sys/kernel/core_pattern is not 'core'. AFL may miss crashes,")
        print("         invalidating this benchmark. Fix once per boot:")
        print("         echo core | sudo tee /proc/sys/kernel/core_pattern\n")

    if not args.plot_only:
        run_trials(args)
        if args.dry_run:
            return

    data = load(args)
    plot(args, data)
    report(args, data)


if __name__ == "__main__":
    main()

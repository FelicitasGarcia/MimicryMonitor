#!/usr/bin/env python3
"""
Interleaved comparison for the AFL IV-feedback mechanism (see
instrumentation/mm_afl_reporter.c, pipeline/instrument.sh -afl-iv-feedback).

Four conditions, same --example otherwise identical (seeds, grammar,
exec-timeout, ...):

  stop_only   iv-feedback=off, policy=stop-v   (just stop -- today's baseline
                                                behavior, no bitmap nudge)
  fb_only     iv-feedback=on,  policy=n        (just feedback -- monitor never
                                                aborts early, isolates the
                                                bitmap-nudge effect on its own)
  fb_stop     iv-feedback=on,  policy=stop-v   (feedback AND stop -- the full
                                                mechanism as intended)
  none        plain AFL, no monitor at all -- the baseline. Fuzzed ONCE and
              shared across the comparison, not re-run per instrumented arm:
              plain ignores policy/iv-feedback entirely, so fuzzing it three
              times (once per instrumented arm) only burned CPU on identical
              runs and told us nothing an extra "none" trial wouldn't.

Trials are NOT run back-to-back per condition. Instead they're interleaved
round-robin: trial 1 of every condition runs before trial 2 of any of them.
This spreads whatever time-correlated noise the machine has (other processes,
thermal throttling, etc.) evenly across conditions instead of concentrating it
in whichever one happens to run first/last -- so an observed difference is
less likely to just be "which condition happened to run during a quiet/busy
stretch."

Reuses targetbench.py's build/fuzz/report/plot functions directly so each
condition's results are laid out exactly like a normal targetbench.py
campaign -- readable by campaign_dashboard.py and re-plottable with
--skip-fuzz. On top of that, produces one combined comparison chart across
all four conditions (campaign-totals bars + ranked hit-rate + throughput +
a concrete-numbers summary table, same column format as a single campaign's
report).

Usage:
  evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/run_iv_feedback_experiment.py \\
      --example cat_sleep --trials 10 --time 1800 \\
      --experiment-dir 2026-08-03_10x1800s_abcd-only-sleep

  # re-render reports/plots/comparison from whatever trials already ran
  # (e.g. after Ctrl-C, or just to redraw without re-fuzzing):
  evaluation/bench/.venv/bin/python evaluation/bench/rq1_effect/run_iv_feedback_experiment.py \\
      --example cat_sleep --trials 10 --time 1800 \\
      --experiment-dir 2026-08-03_10x1800s_abcd-only-sleep --skip-fuzz
"""
import argparse
import shutil
import sys
import warnings
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import targetbench as tb

np = tb.np
plt = tb.plt
mticker = tb.mticker

# (name, target_kind, iv_feedback, policy) -- target_kind picks which of
# targetbench.py's two fuzz variants ("instrumented"/"plain") this condition
# actually builds and runs. Only the instrumented variants vary policy/
# iv-feedback; "none" is the one shared plain baseline.
CONDITIONS = [
    ("stop_only", "instrumented", False, "stop-v"),
    ("fb_only",   "instrumented", True,  "n"),
    ("fb_stop",   "instrumented", True,  "stop-v"),
    ("none",      "plain",        False, "n"),
]

ARM_TITLES = {
    "stop_only": "Stop-v only",
    "fb_only":   "Feedback only",
    "fb_stop":   "Feedback + stop-v",
    "none":      "None (plain AFL)",
}

# Categorical palette slots 1-4 (blue/orange/aqua/yellow) -- validated
# adjacent-pairlist CVD-safe order for bar charts (see dataviz skill
# references/palette.md); fixed order, not cycled.
ARM_COLORS = {
    "stop_only": "#2a78d6",
    "fb_only":   "#eb6834",
    "fb_stop":   "#1baf7a",
    "none":      "#eda100",
}


def rex_trial_already_done(trial_dir, trial_seconds):
    """True if trial_dir holds a genuinely finished trial (not just started/
    interrupted), so a re-run of this experiment can skip it instead of
    deleting and re-fuzzing from scratch. Same generous finish-slack as
    campaign_dashboard.py's STALLED check -- fuzzer_stats here is only
    rewritten every ~60-90s, but the outer `timeout` wrapper kills afl-fuzz
    at exactly trial_seconds, so a cleanly-finished trial's last snapshot can
    land a few seconds short of the nominal duration."""
    fs = trial_dir / "default" / "fuzzer_stats"
    try:
        run_time = None
        for line in fs.read_text().splitlines():
            if line.startswith("run_time"):
                run_time = int(line.split(":", 1)[1].strip())
                break
        if run_time is None:
            return False
        finish_slack = max(120, trial_seconds * 0.05)
        return run_time >= trial_seconds - finish_slack
    except (FileNotFoundError, ValueError):
        return False


def make_arm_args(example, campaign, iv_feedback, policy, trials, time_s, experiment, no_grammar=False):
    argv = [
        "--example", example,
        "--trials",  str(trials),
        "--time",    str(time_s),
        "--experiment", experiment,
        "--campaign", campaign,
        "--policy",  policy,
    ]
    if iv_feedback:
        argv.append("--iv-feedback")
    if no_grammar:
        argv.append("--no-grammar")
    args = tb.parse_args(argv)
    args.results.mkdir(parents=True, exist_ok=True)
    args.out = args.results / f"{example}.png"
    return args


EXPERIMENT_README = """\
# IV-feedback comparison — {date}, {trials} trials x {time_s}s

Interleaved comparison of the AFL IV-feedback mechanism
(`instrumentation/mm_afl_reporter.c`, `pipeline/instrument.sh -afl-iv-feedback`)
on the `{example}` example.

**Conditions:**
- `stop_only` — iv-feedback OFF, policy stop-v  (just stop -- today's baseline,
                                                  no bitmap nudge)
- `fb_only`   — iv-feedback ON,  policy n       (just feedback -- monitor never
                                                  aborts early)
- `fb_stop`   — iv-feedback ON,  policy stop-v  (feedback AND stop)
- `none`      — plain AFL, no monitor -- fuzzed ONCE and shared across the
                comparison (plain ignores policy/iv-feedback, so it isn't
                re-run per instrumented arm)

Trials are interleaved round-robin across all four conditions (trial 1 of
every condition before trial 2 of any of them) to spread time-correlated
machine noise evenly rather than concentrating it in whichever condition
happens to run first or last.

**Files:**
- `iv_feedback_comparison.png` -- combined chart across all 4 conditions
  (campaign totals, ranked hit rate, throughput, summary table)
- `iv_feedback_summary.md` -- same summary table as markdown
- `<condition>/report.md`, `<condition>/{example}.png` -- per-condition detail
  (same layout a normal targetbench.py campaign produces)

Generated by `evaluation/bench/rq1_effect/run_iv_feedback_experiment.py`.
"""

INDEX_README_HEADER = """\
# IV-feedback experiment history

Each subfolder is one full attempt at the AFL IV-feedback comparison, named
`<date>_<trials>x<time>s_<suffix>`. Newest first below; see each folder's own
README.md for that attempt's specifics (condition definitions, and even the
--example under test, may have changed between attempts -- check before
comparing across folders).

"""


def update_index_readme():
    """(Re)write results/rq1_effect/iv_feedback/README.md by scanning subfolders,
    newest first, pulling each one's title line from its own README.md."""
    root = tb.REPO / "evaluation/bench/results/rq1_effect/iv_feedback"
    lines = [INDEX_README_HEADER]
    subdirs = sorted((d for d in root.iterdir() if d.is_dir()), reverse=True)
    for d in subdirs:
        readme = d / "README.md"
        title = d.name
        if readme.exists():
            first_line = readme.read_text().splitlines()[0].lstrip("# ").strip()
            if first_line:
                title = first_line
        lines.append(f"- **{d.name}/** — {title}")
    (root / "README.md").write_text("\n".join(lines) + "\n")


def _campaign_totals(rows):
    tot_execs = sum(r["total_execs"] for r in rows)
    tot_hits  = sum(r["target_hits"] for r in rows)
    tot_rate  = tot_hits / tot_execs * 100 if tot_execs else 0.0
    return tot_execs, tot_hits, tot_rate


def make_combined_plot(arm_rows, arms, out_path, cli):
    """Combined chart across all conditions, laid out like a single
    targetbench.py campaign's report but with N condition-bars instead of
    2 target-bars: campaign totals (execs bar, hits shaded inside),
    all-trials ranked by hit rate, throughput boxplot, and a concrete-numbers
    summary table."""
    ex_title = tb.EXAMPLES[cli.example]["title"]
    fig, axes = plt.subplots(2, 2, figsize=(14, 11))
    fig.suptitle(f"IV-feedback comparison — {ex_title}", y=0.975,
                 fontsize=13, fontweight="bold")
    fig.text(0.5, 0.945, f"({cli.trials} trials × {cli.time}s per condition)",
              ha="center", fontsize=10.5)

    campaign_totals = {name: _campaign_totals(arm_rows[name]) for name in arms}
    totals_parts = [
        f"{ARM_TITLES[name]}: {h:,} hits / {e:,} execs ({r:.1f}%)"
        for name, (e, h, r) in campaign_totals.items()
    ]
    fig.text(0.5, 0.915, "Campaign totals — " + "    |    ".join(totals_parts),
              ha="center", fontsize=8, color="#333333")

    ax_bars, ax_ranked, ax_eps, ax_table = axes.flat

    # ── 1. campaign totals: executions bar with hits shaded inside ──────────
    ax = ax_bars
    xs = np.arange(len(arms))
    bar_w = 0.55
    for xi, name in enumerate(arms):
        tot_execs, tot_hits, tot_rate = campaign_totals[name]
        c = ARM_COLORS[name]
        ax.bar(xi, tot_execs, bar_w, color=c, alpha=0.30, edgecolor=c, linewidth=1)
        ax.bar(xi, tot_hits, bar_w, color=c, alpha=0.95)
        ax.text(xi, tot_execs, f"{tot_execs:,}\nexecs", ha="center", va="bottom",
                fontsize=8, color=c, fontweight="bold", linespacing=1.2)
        ax.text(xi, tot_hits / 2, f"{tot_hits:,} hits\n({tot_rate:.1f}%)",
                ha="center", va="center", fontsize=8, color="white", fontweight="bold")
    ax.set_xticks(xs)
    ax.set_xticklabels([ARM_TITLES[n] for n in arms], fontsize=8.5)
    ax.set_ylabel("Count (campaign total)")
    ax.set_title("Campaign totals: executions vs. target hits")
    ax.set_ylim(0, max(v[0] for v in campaign_totals.values()) * 1.18)
    ax.yaxis.set_major_formatter(mticker.FuncFormatter(
        lambda x, _: f"{int(x/1000)}k" if x >= 1000 else str(int(x))))
    ax.grid(True, axis="y", alpha=0.3)

    # ── 2. hit rate, all trials across all conditions, sorted ascending ─────
    ax = ax_ranked
    SHORT = {"stop_only": "S", "fb_only": "F", "fb_stop": "B", "none": "N"}
    all_bars = []
    for name in arms:
        for r in arm_rows[name]:
            all_bars.append((r["hit_rate"] * 100, f"{SHORT[name]}{r['trial']}",
                             ARM_COLORS[name], r["target_hits"], r["total_execs"]))
    all_bars.sort(key=lambda x: x[0])
    bar_vals   = [b[0] for b in all_bars]
    bar_labels = [b[1] for b in all_bars]
    bar_colors = [b[2] for b in all_bars]
    bars = ax.bar(range(len(bar_vals)), bar_vals, color=bar_colors, alpha=0.85)
    for bar, (v, _, _, hits, execs) in zip(bars, all_bars):
        ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.3,
                f"{v:.1f}%\n{hits}/{execs}", ha="center", va="bottom",
                fontsize=5.5, linespacing=1.2)
    ax.set_xticks(range(len(bar_labels)))
    ax.set_xticklabels(bar_labels, fontsize=6.5)
    ax.set_ylabel("Hit rate (%)")
    ax.set_title("All trials ranked by hit rate  (label: hits/execs)")
    ax.set_ylim(0, max(105, ax.get_ylim()[1] * 1.15))
    for name in arms:
        ax.bar(0, 0, color=ARM_COLORS[name], alpha=0.85, label=ARM_TITLES[name])
    ax.legend(fontsize=7)
    ax.grid(True, axis="y", alpha=0.3)

    # ── 3. throughput boxplot per condition ──────────────────────────────────
    ax = ax_eps
    eps_data = [[r["mean_eps"] for r in arm_rows[name]] for name in arms]
    bp = ax.boxplot(eps_data, patch_artist=True, widths=0.4)
    for patch, name in zip(bp["boxes"], arms):
        patch.set_facecolor(ARM_COLORS[name])
        patch.set_alpha(0.7)
    for element in ("whiskers", "caps", "medians", "fliers"):
        for item in bp[element]:
            item.set_color("black")
    ax.set_xticklabels([ARM_TITLES[n] for n in arms], fontsize=8)
    ax.set_ylabel("Execs / sec")
    ax.set_title("Throughput (exec/sec)")
    ax.grid(True, axis="y", alpha=0.3)

    # ── 4. concrete-numbers summary table ────────────────────────────────────
    ax = ax_table
    ax.axis("off")
    ax.set_title("Campaign summary", fontsize=11, fontweight="bold", pad=14)

    table_metrics = [
        ("Total execs",      lambda rs: f"{sum(r['total_execs'] for r in rs):,}"),
        ("Total hits",       lambda rs: f"{sum(r['target_hits'] for r in rs):,}"),
        ("Campaign hit %",   lambda rs: f"{sum(r['target_hits'] for r in rs)/sum(r['total_execs'] for r in rs)*100:.1f}%"
                              if sum(r['total_execs'] for r in rs) else "—"),
        ("Mean execs/trial", lambda rs: f"{sum(r['total_execs'] for r in rs)/len(rs):,.1f}"),
        ("Mean hits/trial",  lambda rs: f"{sum(r['target_hits'] for r in rs)/len(rs):,.1f}"),
        ("Mean hit rate",    lambda rs: f"{sum(r['hit_rate'] for r in rs)/len(rs)*100:.1f}%"),
        ("Best hit rate",    lambda rs: f"{max(r['hit_rate'] for r in rs)*100:.1f}%"),
        ("Worst hit rate",   lambda rs: f"{min(r['hit_rate'] for r in rs)*100:.1f}%"),
    ]
    col_labels = ["Metric"] + [ARM_TITLES[n] for n in arms]
    cell_text = [[label] + [fn(arm_rows[n]) for n in arms] for label, fn in table_metrics]

    def tint(hex_color, amount=0.85):
        r, g, b = (int(hex_color[i:i+2], 16) for i in (1, 3, 5))
        r, g, b = (int(v + (255 - v) * amount) for v in (r, g, b))
        return f"#{r:02x}{g:02x}{b:02x}"

    tbl = ax.table(cellText=cell_text, colLabels=col_labels,
                    cellLoc="center", loc="upper center")
    tbl.auto_set_font_size(False)
    tbl.set_fontsize(8)
    tbl.scale(1, 1.6)
    for (r, c), cell in tbl.get_celld().items():
        cell.set_edgecolor("#cccccc")
        if r == 0:
            cell.set_facecolor("#e0e0e0")
            cell.set_text_props(fontweight="bold", fontsize=7.5)
        elif c == 0:
            cell.set_text_props(ha="left")
        else:
            cell.set_facecolor(tint(ARM_COLORS[arms[c - 1]]))

    with warnings.catch_warnings():
        warnings.simplefilter("ignore")
        plt.tight_layout(pad=1.5, rect=(0, 0, 1, 0.89))
    fig.savefig(out_path, dpi=150)
    plt.close(fig)
    print(f"[comparison] saved → {out_path}")


def write_combined_summary(arm_rows, arms, out_path):
    """Markdown mirror of the summary table: concrete totals + means per
    condition, same metric set as an individual campaign's report.md."""
    table_metrics = [
        ("Total execs",      lambda rs: f"{sum(r['total_execs'] for r in rs):,}"),
        ("Total hits",       lambda rs: f"{sum(r['target_hits'] for r in rs):,}"),
        ("Campaign hit %",   lambda rs: f"{sum(r['target_hits'] for r in rs)/sum(r['total_execs'] for r in rs)*100:.1f}%"
                              if sum(r['total_execs'] for r in rs) else "—"),
        ("Mean execs/trial", lambda rs: f"{sum(r['total_execs'] for r in rs)/len(rs):,.1f}"),
        ("Mean hits/trial",  lambda rs: f"{sum(r['target_hits'] for r in rs)/len(rs):,.1f}"),
        ("Mean hit rate",    lambda rs: f"{sum(r['hit_rate'] for r in rs)/len(rs)*100:.1f}%"),
        ("Best hit rate",    lambda rs: f"{max(r['hit_rate'] for r in rs)*100:.1f}%"),
        ("Worst hit rate",   lambda rs: f"{min(r['hit_rate'] for r in rs)*100:.1f}%"),
    ]
    lines = ["# IV-feedback comparison — concrete campaign numbers\n",
             "| Metric | " + " | ".join(ARM_TITLES[n] for n in arms) + " |",
             "|---|" + "---:|" * len(arms)]
    for label, fn in table_metrics:
        lines.append(f"| {label} | " + " | ".join(fn(arm_rows[n]) for n in arms) + " |")
    out_path.write_text("\n".join(lines) + "\n")
    print(f"[summary] saved → {out_path}")


def main():
    p = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--example",    default="cat", choices=list(tb.EXAMPLES))
    p.add_argument("--trials",     type=int, default=5,
                    help="interleaved rounds, i.e. trials per condition (default 5)")
    p.add_argument("--time",       type=int, default=120,
                    help="seconds per trial (default 120)")
    p.add_argument("--skip-build", action="store_true",
                    help="skip building all 4 binaries (3 instrumented + 1 plain); "
                         "assumes they already exist from a previous run")
    p.add_argument("--skip-fuzz",  action="store_true",
                    help="skip building AND fuzzing -- just re-render reports/plots/"
                         "comparison from whatever trial data already exists on disk")
    p.add_argument("--experiment-dir", default=None,
                    help="dated folder name under results/rq1_effect/iv_feedback/ "
                         "(default: <today>_<trials>x<time>s_abcd). Reuse an existing "
                         "name with --skip-fuzz to re-render its chart.")
    p.add_argument("--no-grammar", action="store_true",
                    help="disable the grammar mutator for all 4 conditions -- "
                         "fuzz with plain AFL++ mutations instead")
    cli = p.parse_args()

    import datetime
    experiment_dir = cli.experiment_dir or (
        f"{datetime.date.today().isoformat()}_{cli.trials}x{cli.time}s_abcd"
    )
    experiment = f"rq1_effect/iv_feedback/{experiment_dir}"

    arm_args = {
        name: make_arm_args(cli.example, name, iv_feedback, policy, cli.trials, cli.time,
                             experiment, no_grammar=cli.no_grammar)
        for name, _, iv_feedback, policy in CONDITIONS
    }

    experiment_root = tb.REPO / "evaluation/bench/results" / experiment
    if not cli.skip_fuzz:
        (experiment_root / "README.md").write_text(EXPERIMENT_README.format(
            date=datetime.date.today().isoformat(), trials=cli.trials, time_s=cli.time,
            example=cli.example,
        ))

    if not cli.skip_build and not cli.skip_fuzz:
        for name, target_kind, _, _ in CONDITIONS:
            print(f"\n{'='*60}\nbuilding condition: {name} ({target_kind})\n{'='*60}")
            if target_kind == "instrumented":
                tb.build_instrumented(arm_args[name])
            else:
                tb.build_plain(arm_args[name])

    completed_rounds = 0
    if not cli.skip_fuzz:
        try:
            for r in range(1, cli.trials + 1):
                print(f"\n{'#'*60}\n round {r}/{cli.trials} (interleaved across all conditions)\n{'#'*60}")
                for name, target_kind, _, _ in CONDITIONS:
                    args = arm_args[name]
                    trial_dir = args.results / target_kind / f"t{r}"
                    log_path  = args.results / target_kind / f"t{r}_stoplog.txt"
                    if rex_trial_already_done(trial_dir, cli.time):
                        print(f"\n-- {name:10s} | {target_kind:12s} | trial {r} -- already complete, skipping")
                        continue
                    print(f"\n-- {name:10s} | {target_kind:12s} | trial {r} --")
                    if trial_dir.exists():
                        shutil.rmtree(trial_dir)
                    tb.fuzz_trial(target_kind, trial_dir, log_path, args)
                completed_rounds = r
        except KeyboardInterrupt:
            print(f"\n[interrupted] {completed_rounds} full round(s) completed -- "
                  f"rendering partial report/plots from those.")
    else:
        completed_rounds = cli.trials

    print(f"\n{'='*60}\nrendering reports/plots ({completed_rounds} trial(s) per condition)\n{'='*60}")
    all_rows = {}
    for name, target_kind, _, _ in CONDITIONS:
        args = arm_args[name]
        args.trials = completed_rounds or 1  # avoid div-by-zero if nothing ran yet
        if completed_rounds == 0:
            print(f"[{name}] no completed trials yet, skipping report")
            continue
        try:
            data = tb.load_results(args, targets=(target_kind,))
            rows = tb.save_summary(data, args)
            all_rows[name] = rows
            tb.save_report(data, rows, args)
            tb.make_plots(data, rows, args, args.out)
        except Exception as e:
            # A rendering bug in one condition must never cost the others their
            # report/plot -- the raw trial data is already safe on disk.
            print(f"[{name}] FAILED to render report/plot: {e!r}")

    if all_rows:
        arms = [name for name, _, _, _ in CONDITIONS if name in all_rows]
        comparison_path = experiment_root / "iv_feedback_comparison.png"
        try:
            make_combined_plot(all_rows, arms, comparison_path, cli)
        except Exception as e:
            print(f"[comparison] FAILED to render: {e!r}")
        try:
            write_combined_summary(all_rows, arms, experiment_root / "iv_feedback_summary.md")
        except Exception as e:
            print(f"[summary] FAILED to render: {e!r}")

    update_index_readme()

    print(f"\n[done] results under:")
    print(f"  {experiment_root}/")
    for name, _, _, _ in CONDITIONS:
        print(f"    {name}/")


if __name__ == "__main__":
    main()

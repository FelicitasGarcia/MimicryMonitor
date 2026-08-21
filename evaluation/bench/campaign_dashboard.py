#!/usr/bin/env python3
"""Live terminal dashboard for run2-style targetbench.py campaigns.
Run directly in a real terminal (not through tail/pipe) -- it redraws
in place using ANSI cursor control, in the NORMAL screen buffer (not the
vim/htop-style alternate buffer), so your terminal's native scrollback
(mouse wheel, Shift+PageUp, search) works normally. Ctrl-C to quit;
read-only, doesn't touch anything under evaluation/bench/results.

Usage:
  evaluation/bench/.venv/bin/python evaluation/bench/campaign_dashboard.py
  evaluation/bench/.venv/bin/python evaluation/bench/campaign_dashboard.py --expand
(or plain `python3`, no extra deps beyond the standard library)

By default, finished trials are collapsed into one summary line per
contiguous run (e.g. "t1-t12 done, mean 20.8%") to keep each frame short.
Pass --expand to show every trial individually instead -- with scrollback
available there's no need to cap output to the visible terminal height.

Edit CAMPAIGNS below to point at whichever --example/--campaign result
directories you want to watch.
"""
import shutil
import sys
import time
from pathlib import Path

REPO    = Path(__file__).resolve().parents[2]
RESULTS = REPO / "evaluation/bench/results"

# Each entry: (example, campaign, path relative to results/, trials range,
# seconds/trial, targets present on disk for this campaign). Trials/seconds/
# targets are per-campaign since different runs use different params -- e.g.
# the iv-feedback conditions below are each single-target (3 instrumented-only
# arms + 1 shared plain "none" baseline, not an instrumented+plain pair per
# arm), unlike a normal targetbench.py campaign which has both.
_EXP = "rq1_effect/iv_feedback/2026-08-21_10x1200s_cat_splice"
CAMPAIGNS = [
    ("cat_splice", "stop_only",    Path(f"{_EXP}/stop_only"),    range(1, 11), 1200, ["instrumented"]),
    ("cat_splice", "fb_only",      Path(f"{_EXP}/fb_only"),      range(1, 11), 1200, ["instrumented"]),
    ("cat_splice", "fb_path_only", Path(f"{_EXP}/fb_path_only"), range(1, 11), 1200, ["instrumented"]),
    ("cat_splice", "fb_stop",      Path(f"{_EXP}/fb_stop"),      range(1, 11), 1200, ["instrumented"]),
    ("cat_splice", "fb_path_stop", Path(f"{_EXP}/fb_path_stop"), range(1, 11), 1200, ["instrumented"]),
    ("cat_splice", "none",         Path(f"{_EXP}/none"),         range(1, 11), 1200, ["plain"]),
]

RESET  = "\033[0m"
BOLD   = "\033[1m"
DIM    = "\033[2m"
GREY   = "\033[90m"
RED    = "\033[31m"
YELLOW = "\033[33m"
GREEN  = "\033[32m"
CYAN   = "\033[36m"
BLUE   = "\033[34m"
MAGENTA= "\033[35m"


def color_for_rate(pct):
    if pct >= 30:
        return GREEN
    if pct >= 15:
        return YELLOW
    return RED


def bar(pct, width, color):
    filled = max(0, min(width, int(round(width * pct / 100))))
    return f"{color}{'█' * filled}{GREY}{'░' * (width - filled)}{RESET}"


def time_bar(elapsed, total, width, color=CYAN):
    if total <= 0:
        return GREY + ("·" * width) + RESET
    frac = max(0.0, min(1.0, elapsed / total))
    filled = int(round(width * frac))
    return f"{color}{'▮' * filled}{GREY}{'▯' * (width - filled)}{RESET}"


def parse_stoplog_counts(path):
    total = 0
    hits = 0
    try:
        with open(path, "r", errors="ignore") as f:
            for line in f:
                if not line.strip():
                    continue
                total += 1
                if "target=1" in line:
                    hits += 1
    except FileNotFoundError:
        return None
    return total, hits


STALE_AFTER_SECONDS = 30  # fuzzer_stats not updated in this long => the process is dead, not slow


def trial_run_time(trial_dir):
    fs = trial_dir / "default" / "fuzzer_stats"
    try:
        d = {}
        for line in fs.read_text().splitlines():
            if ":" in line:
                k, v = line.split(":", 1)
                d[k.strip()] = v.strip()
        last_update = d.get("last_update")
        return int(d.get("run_time", 0)), (int(last_update) if last_update else None)
    except Exception:
        return None, None


def trial_status(rel, target, t, trial_seconds):
    """Return dict with counts/timing for one trial, or None if not started."""
    trial_dir = RESULTS / rel / target / f"t{t}"
    stoplog   = RESULTS / rel / target / f"t{t}_stoplog.txt"
    counts = parse_stoplog_counts(stoplog)
    if counts is None:
        return None
    total, hits = counts
    run_time, last_update = trial_run_time(trial_dir)
    # fuzzer_stats here is only rewritten every ~60-90s (not every 1s), but the
    # outer `timeout` wrapper kills afl-fuzz at exactly trial_seconds -- so a
    # trial that ran its full, successful duration can leave its last stats
    # snapshot noticeably short of trial_seconds. A tight slack (e.g. 2s)
    # misreads that as STALLED forever, since the process really is dead by
    # the time anyone looks. A crash/hang, by contrast, dies far earlier than
    # this margin, so it's still caught.
    finish_slack = max(120, trial_seconds * 0.05)
    unfinished = run_time is not None and run_time < trial_seconds - finish_slack
    stale = last_update is not None and (time.time() - last_update) > STALE_AFTER_SECONDS
    running = unfinished and not stale
    stalled = unfinished and stale
    return {
        "total": total, "hits": hits,
        "pct": (hits / total * 100) if total else 0.0,
        "run_time": run_time, "running": running, "stalled": stalled,
    }


def trial_line(target, t, st, trial_seconds):
    tcolor = MAGENTA if target == "instrumented" else GREY
    label = f"{tcolor}{target:>11}{RESET} {BOLD}t{t:<2}{RESET}"
    c = color_for_rate(st["pct"])
    b = bar(st["pct"], 24, c)
    pct_str = f"{c}{st['pct']:5.1f}%{RESET}"
    if st["run_time"] is not None:
        tb = time_bar(st["run_time"], trial_seconds, 12)
        time_str = f"{tb} {st['run_time']:>4}s/{trial_seconds}s"
        if st["running"]:
            state = f"{GREEN}RUNNING{RESET}"
        elif st["stalled"]:
            state = f"{RED}STALLED — dead, needs redo{RESET}"
        else:
            state = f"{GREY}done{RESET}"
    else:
        time_str = " " * 17
        state = f"{GREY}done{RESET}"
    return f"  {label}  {b} {pct_str}  execs={st['total']:<8,} hits={st['hits']:<7,}  {time_str}  {state}"


def render(expand=False):
    lines = []
    now = time.strftime("%H:%M:%S")
    term_h = shutil.get_terminal_size(fallback=(120, 40)).lines
    lines.append(f"{BOLD}{CYAN}MimicryMonitor — live dashboard{RESET}  {DIM}{now}  (term rows: {term_h}){RESET}")

    # ── pass 1: gather everything + find the single active (running) trial ──
    all_status = {}   # (rel, target, t) -> status dict or None
    active = None     # (example, campaign, rel, target, t, status, trial_seconds)
    for example, campaign, rel, trials, trial_seconds, targets in CAMPAIGNS:
        for target in targets:
            for t in trials:
                st = trial_status(rel, target, t, trial_seconds)
                all_status[(rel, target, t)] = st
                if st is not None and st["running"]:
                    active = (example, campaign, rel, target, t, st, trial_seconds)

    # ── "NOW" banner pinned at the very top, regardless of terminal height ──
    lines.append("")
    if active:
        example, campaign, rel, target, t, st, trial_seconds = active
        lines.append(f"{BOLD}{GREEN}▶ NOW RUNNING:{RESET} {BOLD}{example}/{campaign}{RESET}  " + trial_line(target, t, st, trial_seconds).strip())
    else:
        lines.append(f"{BOLD}{YELLOW}▶ (no trial currently marked RUNNING -- between trials, or all done){RESET}")

    # ── pass 2: one section per campaign, collapsed to fit any terminal ──
    for example, campaign, rel, trials, trial_seconds, targets in CAMPAIGNS:
        started = any(all_status[(rel, tgt, t)] is not None for tgt in targets for t in trials)
        complete = all(
            all_status[(rel, tgt, t)] is not None and not all_status[(rel, tgt, t)]["running"]
            for tgt in targets for t in trials
        )
        lines.append(f"\n{BOLD}{BLUE}▌ {example} / {campaign}{RESET}")

        if not started:
            lines.append(f"  {GREY}not started yet{RESET}")
            continue

        if complete:
            for target in targets:
                rates = [all_status[(rel, target, t)]["pct"] for t in trials]
                hits  = [all_status[(rel, target, t)]["hits"] for t in trials]
                execs = [all_status[(rel, target, t)]["total"] for t in trials]
                mean = sum(rates) / len(rates)
                mean_hits = sum(hits) / len(hits)
                mean_execs = sum(execs) / len(execs)
                c = color_for_rate(mean)
                lines.append(f"  {target:>11}  {GREEN}COMPLETE{RESET}  mean hit rate {c}{mean:5.1f}%{RESET}  "
                             f"mean execs {mean_execs:,.0f}  mean hits {mean_hits:,.0f}  over {len(rates)} trials")
            continue

        # in progress: collapse both pending AND finished trials into compact
        # summaries -- only RUNNING/STALLED trials get a full detail line.
        # (Finished trials used to get one line each, which overflowed the
        # terminal with no way to scroll back once a campaign had more than
        # a handful of completed trials -- see feedback that prompted this.)
        for target in targets:
            pending_run = []
            done_run = []

            def flush_pending():
                if pending_run:
                    lines.append(f"  {GREY}{target:>11} t{pending_run[0]}-t{pending_run[-1]:<2} pending{RESET}")
                    pending_run.clear()

            def flush_done():
                if not done_run:
                    return
                if expand:
                    for dt in done_run:
                        lines.append(trial_line(target, dt, all_status[(rel, target, dt)], trial_seconds))
                else:
                    rates = [all_status[(rel, target, t)]["pct"] for t in done_run]
                    hits  = [all_status[(rel, target, t)]["hits"] for t in done_run]
                    execs = [all_status[(rel, target, t)]["total"] for t in done_run]
                    mean = sum(rates) / len(rates)
                    mean_hits = sum(hits) / len(hits)
                    mean_execs = sum(execs) / len(execs)
                    c = color_for_rate(mean)
                    lo, hi = done_run[0], done_run[-1]
                    span = f"t{lo}" if lo == hi else f"t{lo}-t{hi}"
                    lines.append(f"  {GREY}{target:>11}{RESET} {span:<8} {GREEN}done{RESET}  "
                                 f"mean hit rate {c}{mean:5.1f}%{RESET}  mean execs {mean_execs:,.0f}  "
                                 f"mean hits {mean_hits:,.0f}  over {len(done_run)} trial(s)")
                done_run.clear()

            for t in trials:
                st = all_status[(rel, target, t)]
                if st is None:
                    flush_done()
                    pending_run.append(t)
                    continue
                flush_pending()
                if st["running"] or st["stalled"]:
                    flush_done()
                    lines.append(trial_line(target, t, st, trial_seconds))
                else:
                    done_run.append(t)
            flush_done()
            flush_pending()

    return "\n".join(lines)


def main():
    expand = "--expand" in sys.argv
    hide_cursor = "\033[?25l"
    show_cursor = "\033[?25h"
    sys.stdout.write(hide_cursor)
    sys.stdout.flush()
    try:
        while True:
            frame = render(expand=expand)
            # Reset to the current viewport's home + erase-to-end before
            # drawing, same redraw-in-place trick tools like npm's progress
            # bar use -- NOT the alternate screen buffer, so content that
            # scrolls past the top is still in the terminal's normal
            # scrollback, not lost.
            sys.stdout.write("\033[H\033[J")
            sys.stdout.write(frame + "\n")
            sys.stdout.flush()
            time.sleep(2)
    except KeyboardInterrupt:
        pass
    finally:
        sys.stdout.write(show_cursor)
        sys.stdout.flush()


if __name__ == "__main__":
    main()

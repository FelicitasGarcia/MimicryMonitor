#!/usr/bin/env python3
"""
notion_publish.py -- publish a finished campaign's artifacts to the Notion
tracking page ("Experimentos MM — Tracking").

Appends, at the end of the page, a collapsible toggle:

    ### Campaña: <name> — <date>        (toggle heading)
        Config: trials × time · policy · example · commit
        Target reachability
          <cat.png>                     (the 4-panel targetbench PNG)
        Overhead                        (only if the overhead PNG exists)
          <overhead_micro_<name>.png>
        Resumen
          <Summary table from report.md>

Run it after targetbench.py finishes (or any time with --skip-fuzz results
already on disk):

    python3 evaluation/bench/notion_publish.py --example cat --campaign camp1

    # explicit paths instead of --example/--campaign:
    python3 evaluation/bench/notion_publish.py \
        --results evaluation/bench/results/cat/camp1

--combined mode: for a run_iv_feedback_experiment.py experiment root (holds
iv_feedback_comparison.png + iv_feedback_summary.md + a README.md, with one
subfolder per condition) instead of a single targetbench.py campaign folder.
Publishes the combined 4-condition comparison chart + its concrete-numbers
table as one toggle, rather than the per-condition single-target chart:

    python3 evaluation/bench/notion_publish.py --combined \
        --results evaluation/bench/results/rq1_effect/iv_feedback/2026-08-04_20x1800s_abcd \
        --campaign "cat (no-sleep) 20x1800s"

One-time setup:
  1. Create an internal integration at https://www.notion.so/my-integrations
     and copy its secret.
  2. On the tracking page in Notion: ••• menu → Connections → add your
     integration (otherwise the API returns 404 for the page).
  3. export NOTION_TOKEN=ntn_...          (or pass --token)

No dependencies beyond the standard library.
"""

import argparse
import json
import mimetypes
import os
import re
import subprocess
import sys
import urllib.error
import urllib.request
import uuid
from datetime import date
from pathlib import Path

API            = "https://api.notion.com/v1"
NOTION_VERSION = "2022-06-28"
# "Experimentos MM — Tracking (cat / fuzzing diferencial)"
DEFAULT_PAGE   = "3b892dbb42ef81c49ce1e513baedcf22"
REPO           = Path(__file__).resolve().parents[2]


# ── low-level API helpers ────────────────────────────────────────────────────

class NotionPublishError(RuntimeError):
    """Raised on any failure to publish. Callers embedding publish() (e.g. an
    auto-publish step at the end of a fuzzing campaign) should catch this and
    treat it as non-fatal -- the campaign's own results are already safe on
    disk regardless of whether the Notion post succeeds. Only the CLI
    entrypoint (main()) turns this into a hard sys.exit."""


def api(token, method, path, payload=None):
    req = urllib.request.Request(API + path, method=method)
    req.add_header("Authorization", f"Bearer {token}")
    req.add_header("Notion-Version", NOTION_VERSION)
    data = None
    if payload is not None:
        req.add_header("Content-Type", "application/json")
        data = json.dumps(payload).encode()
    try:
        with urllib.request.urlopen(req, data) as r:
            return json.load(r)
    except urllib.error.HTTPError as e:
        raise NotionPublishError(f"{method} {path} -> HTTP {e.code}\n{e.read().decode()}") from e


def upload_file(token, path: Path) -> str:
    """Upload a local file via the Notion File Upload API; return its id."""
    created = api(token, "POST", "/file_uploads", {"filename": path.name})
    ctype = mimetypes.guess_type(path.name)[0] or "application/octet-stream"

    boundary = uuid.uuid4().hex
    body = (
        f"--{boundary}\r\n"
        f'Content-Disposition: form-data; name="file"; filename="{path.name}"\r\n'
        f"Content-Type: {ctype}\r\n\r\n"
    ).encode() + path.read_bytes() + f"\r\n--{boundary}--\r\n".encode()

    req = urllib.request.Request(created["upload_url"], data=body, method="POST")
    req.add_header("Authorization", f"Bearer {token}")
    req.add_header("Notion-Version", NOTION_VERSION)
    req.add_header("Content-Type", f"multipart/form-data; boundary={boundary}")
    try:
        with urllib.request.urlopen(req) as r:
            json.load(r)
    except urllib.error.HTTPError as e:
        raise NotionPublishError(f"upload {path.name} -> HTTP {e.code}\n{e.read().decode()}") from e
    print(f"[notion] uploaded {path.name}")
    return created["id"]


# ── block builders ───────────────────────────────────────────────────────────

def rt(text, bold=False, code=False, color="default"):
    return [{"type": "text", "text": {"content": text},
             "annotations": {"bold": bold, "code": code, "color": color}}]


def paragraph(text, bold=False):
    return {"type": "paragraph", "paragraph": {"rich_text": rt(text, bold=bold)}}


def image(file_upload_id, caption=""):
    blk = {"type": "image",
           "image": {"type": "file_upload",
                     "file_upload": {"id": file_upload_id}}}
    if caption:
        blk["image"]["caption"] = rt(caption)
    return blk


def md_table_to_block(md_lines):
    """['| a | b |', '|---|---|', '| 1 | 2 |'] -> Notion table block."""
    rows = []
    for ln in md_lines:
        if re.fullmatch(r"\|[\s:|-]+\|", ln.strip()):
            continue                      # separator row
        cells = [c.strip() for c in ln.strip().strip("|").split("|")]
        # strip markdown bold; the whole-cell style is lost, which is fine here
        cells = [re.sub(r"\*\*(.*?)\*\*", r"\1", c) for c in cells]
        rows.append({"type": "table_row",
                     "table_row": {"cells": [rt(c) for c in cells]}})
    if not rows:
        return None
    width = len(rows[0]["table_row"]["cells"])
    return {"type": "table",
            "table": {"table_width": width, "has_column_header": True,
                      "children": rows}}


# ── report.md parsing ────────────────────────────────────────────────────────

def parse_report_fields(report_path: Path):
    """Return a dict of the '**Key:** value' metadata lines from targetbench's
    report.md (Trials, Policy, Campaign, IV feedback, ...)."""
    if not report_path.exists():
        return {}
    text = report_path.read_text()
    return {m.group(1).strip(): m.group(2).strip()
            for m in re.finditer(r"\*\*(.+?):\*\*\s*(.+?)\s*$", text, re.M)}


def parse_report(report_path: Path):
    """Return (config_line, summary_table_lines) from targetbench's report.md."""
    fields = parse_report_fields(report_path)
    if not fields:
        return None, []
    config = (f"{fields.get('Trials', '?')} · policy={fields.get('Policy', '?')} · "
              f"campaign={fields.get('Campaign', '?')}")

    text = report_path.read_text()
    summary, in_summary = [], False
    for ln in text.splitlines():
        if ln.startswith("## Summary"):
            in_summary = True
            continue
        if in_summary:
            if ln.startswith("|"):
                summary.append(ln)
            elif summary:
                break
    return config, summary


def parse_combined(experiment_root: Path):
    """Return (config_line, summary_table_lines) for a run_iv_feedback_experiment.py
    experiment root: config comes from the experiment's own README.md title
    line (has trials/time/example baked in already), table is the whole of
    iv_feedback_summary.md (no '## Summary' heading to find -- the file IS
    the table)."""
    readme = experiment_root / "README.md"
    config = readme.read_text().splitlines()[0].lstrip("# ").strip() if readme.exists() else None

    summary_path = experiment_root / "iv_feedback_summary.md"
    if not summary_path.exists():
        return config, []
    summary = [ln for ln in summary_path.read_text().splitlines() if ln.startswith("|")]
    return config, summary


def git_commit():
    try:
        return subprocess.run(["git", "-C", str(REPO), "rev-parse", "--short", "HEAD"],
                              capture_output=True, text=True, check=True).stdout.strip()
    except Exception:
        return None


# ── "Panorama de campañas" overview-table row ───────────────────────────────
# In addition to the per-campaign toggle, the tracking page has a "Panorama
# de campañas" section with one table per trial-duration bucket ("Trials de
# 1200s", "Trials de 1800s", ...) summarizing every campaign of that duration
# in one row: Campaña | Fecha | Config | Mejor variante MM | Mean hits/trial
# | Plain AFL | Δ vs plain. This mirrors that table by hand so far; append a
# row there too instead of leaving it stale.

def panorama_metrics(results: Path):
    """Mean target hits/trial for instrumented vs. plain, from summary.json --
    the same numbers save_report()'s '## Summary' table is built from.
    Returns None if summary.json is missing or either target has no trials."""
    summary_path = results / "summary.json"
    if not summary_path.exists():
        return None
    rows = json.loads(summary_path.read_text())

    def mean_hits(target):
        vals = [r["target_hits"] for r in rows if r["target"] == target]
        return sum(vals) / len(vals) if vals else None

    mm, plain = mean_hits("instrumented"), mean_hits("plain")
    if mm is None or plain is None:
        return None
    delta = mm - plain
    ratio = mm / plain if plain else float("inf")
    return mm, plain, delta, ratio


def variant_label(policy, iv_feedback_enabled):
    tag = {"stop-v": "stop-v", "stop-iv": "stop-iv", "n": "n"}.get(policy, policy)
    if iv_feedback_enabled:
        return f"Feedback + {tag}"
    return f"{tag[0].upper()}{tag[1:]} only"


def build_panorama_row(campaign, fields, metrics):
    mm, plain, delta, ratio = metrics
    color = "green" if delta >= 0 else "red"
    sign  = "+" if delta >= 0 else "−"
    delta_text = f"{sign}{abs(delta):,.1f} ({ratio:.2f}×)"
    variant = variant_label(fields.get("Policy", "stop-v"),
                             fields.get("IV feedback", "disabled") == "enabled")
    return {
        "type": "table_row",
        "table_row": {"cells": [
            rt(campaign),
            rt(date.today().isoformat()),
            rt(fields.get("Trials", "?")),
            rt(variant),
            rt(f"{mm:,.1f}"),
            rt(f"{plain:,.1f}"),
            rt(delta_text, color=color),
        ]},
    }


def list_children(token, block_id):
    out, cursor = [], None
    while True:
        path = f"/blocks/{block_id}/children?page_size=100"
        if cursor:
            path += f"&start_cursor={cursor}"
        r = api(token, "GET", path)
        out.extend(r["results"])
        if not r.get("has_more"):
            break
        cursor = r["next_cursor"]
    return out


def find_panorama_table(token, page, time_suffix):
    """Return the block id of the 'Trials de <time_suffix>' table under
    'Panorama de campañas' (e.g. time_suffix='1200s'), or None if that
    duration bucket doesn't have a section yet -- new buckets aren't
    auto-created, since the section also carries a hand-written intro
    callout that a script shouldn't try to author."""
    blocks = list_children(token, page)
    target = f"Trials de {time_suffix}"
    for i, b in enumerate(blocks):
        if b["type"] != "heading_2":
            continue
        text = "".join(r["plain_text"] for r in b["heading_2"]["rich_text"]).strip()
        if text == target and i + 1 < len(blocks) and blocks[i + 1]["type"] == "table":
            return blocks[i + 1]["id"]
    return None


def append_panorama_row(token, page, campaign, fields, metrics):
    trials_field = fields.get("Trials", "")
    m = re.search(r"(\d+s)\s*$", trials_field)
    if not m:
        print(f"[notion] panorama: couldn't parse duration from Trials={trials_field!r}, skipping")
        return
    time_suffix = m.group(1)
    table_id = find_panorama_table(token, page, time_suffix)
    if table_id is None:
        print(f"[notion] panorama: no 'Trials de {time_suffix}' table on the page yet, skipping")
        return
    for row in list_children(token, table_id)[1:]:          # [0] is the header row
        cells = row["table_row"]["cells"]
        first = "".join(r["plain_text"] for r in cells[0]) if cells else ""
        if first.strip() == campaign.strip():
            print(f"[notion] panorama: '{campaign}' already has a row in "
                  f"Trials de {time_suffix}, skipping")
            return
    api(token, "PATCH", f"/blocks/{table_id}/children",
        {"children": [build_panorama_row(campaign, fields, metrics)]})
    print(f"[notion] panorama: appended row for '{campaign}' to Trials de {time_suffix}")


# ── main ─────────────────────────────────────────────────────────────────────

def parse_args():
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--example",  default="cat")
    p.add_argument("--campaign", default=None,
                   help="campaign name (as passed to targetbench --campaign)")
    p.add_argument("--results",  type=Path, default=None,
                   help="explicit results dir; overrides --example/--campaign")
    p.add_argument("--combined", action="store_true",
                   help="--results is a run_iv_feedback_experiment.py experiment "
                        "root (iv_feedback_comparison.png + iv_feedback_summary.md), "
                        "not a single targetbench.py campaign folder")
    p.add_argument("--page",     default=os.environ.get("NOTION_PAGE", DEFAULT_PAGE),
                   help="Notion page id (default: the MM tracking page)")
    p.add_argument("--token",    default=os.environ.get("NOTION_TOKEN"),
                   help="integration secret (default: $NOTION_TOKEN)")
    p.add_argument("--dry-run",  action="store_true",
                   help="show what would be published without calling the API")
    return p.parse_args()


def publish(results: Path, campaign, page, token, example="cat", combined=False,
            dry_run=False):
    """Core publish logic, importable from other scripts (targetbench.py's
    and run_iv_feedback_experiment.py's auto-publish steps) as well as the
    CLI below. Raises NotionPublishError on any failure -- never sys.exit,
    so an importing caller can catch it and treat a Notion hiccup as
    non-fatal to a campaign whose real results are already safe on disk.
    Returns True if something was published (or would be, in dry-run)."""
    results = Path(results)
    if not results.exists():
        raise NotionPublishError(f"results dir not found: {results}")

    fields = {}
    if combined:
        bench_png    = results / "iv_feedback_comparison.png"
        overhead_png = None  # no per-condition overhead concept at this level
        config, summary = parse_combined(results)
    else:
        bench_png    = results / f"{example}.png"
        overhead_png = (REPO / "evaluation/bench/results/rq2_overhead/micro"
                        / campaign / f"overhead_micro_{campaign}.png")
        fields = parse_report_fields(results / "report.md")
        config, summary = parse_report(results / "report.md")

    commit = git_commit()
    header = f"Campaña: {campaign} — {date.today().isoformat()}"

    print(f"[plan] page      : {page}")
    print(f"[plan] toggle    : {header}")
    print(f"[plan] config    : {config or '(no report.md)'}"
          + (f" · commit={commit}" if commit else ""))
    print(f"[plan] bench png : {bench_png if bench_png.exists() else '(missing!)'}")
    print(f"[plan] overhead  : {overhead_png if overhead_png and overhead_png.exists() else '(none)'}")
    print(f"[plan] summary   : {len(summary)} table rows")
    if dry_run:
        return True
    if not token:
        raise NotionPublishError("no token: export NOTION_TOKEN=... (see module docstring for setup)")
    if not bench_png.exists() and not (overhead_png and overhead_png.exists()) and not summary:
        raise NotionPublishError("nothing to publish")

    # 1. toggle heading appended at the end of the page
    toggle = api(token, "PATCH", f"/blocks/{page}/children", {
        "children": [{
            "type": "heading_3",
            "heading_3": {"rich_text": rt(header), "is_toggleable": True},
        }]
    })["results"][0]["id"]

    # 2. children of the toggle (separate request so the summary table's
    #    rows stay within Notion's 2-level nesting limit per request)
    children = []
    if config:
        line = f"Config: {config}" + (f" · commit={commit}" if commit else "")
        children.append(paragraph(line, bold=True))
    if bench_png.exists():
        children.append(paragraph("Campaign comparison" if combined else "Target reachability"))
        children.append(image(upload_file(token, bench_png),
                              caption=f"{'iv_feedback comparison' if combined else 'targetbench'} — {campaign}"))
    if overhead_png and overhead_png.exists():
        children.append(paragraph("Overhead"))
        children.append(image(upload_file(token, overhead_png),
                              caption=f"overhead_micro — {campaign}"))
    if summary:
        children.append(paragraph("Resumen"))
        tbl = md_table_to_block(summary)
        if tbl:
            children.append(tbl)

    api(token, "PATCH", f"/blocks/{toggle}/children", {"children": children})
    print(f"[notion] published campaign '{campaign}' "
          f"({sum(1 for c in children if c['type'] == 'image')} image(s))")

    # 3. one summary row in the "Panorama de campañas" overview table for
    #    this trial-duration bucket (best-effort -- the toggle above is the
    #    part of the campaign already safely published either way)
    if not combined:
        metrics = panorama_metrics(results)
        if metrics is None:
            print("[notion] panorama: summary.json missing or incomplete, skipping")
        else:
            try:
                append_panorama_row(token, page, campaign, fields, metrics)
            except NotionPublishError as e:
                print(f"[notion] panorama row skipped (non-fatal): {e}")

    return True


def main():
    args = parse_args()
    campaign = args.campaign or "default"
    results = args.results or (REPO / "evaluation/bench/results" / args.example / campaign)
    try:
        publish(results, campaign, args.page, args.token,
                example=args.example, combined=args.combined, dry_run=args.dry_run)
    except NotionPublishError as e:
        sys.exit(f"[error] {e}")


if __name__ == "__main__":
    main()

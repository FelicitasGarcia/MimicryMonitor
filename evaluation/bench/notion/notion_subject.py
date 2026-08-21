#!/usr/bin/env python3
"""
notion_subject.py -- one page per experimental subject, each holding its own
"Campañas" database (rich schema, mirroring the original "IV-feedback
campaigns" view), created on demand by notion_publish.py.

Model: the "Suejtos" table has one row per subject (cat, cut, ...). A subject
row IS a Notion page; opening it shows only that subject's campaigns -- no RQ
sections, no callout. Each subject owns its campaigns database, embedded in
its page. This module owns the on-demand creation of both:

    ensure_subject_page(token, name) -> page_id
        Find (or create) the subject's row in "Suejtos", returning its page id.
    ensure_campaigns_db(token, subject_page_id) -> database_id
        Find (or create) the "Campañas" database embedded in that page.
    publish_campaign_row(token, db_id, row, body_children=None) -> None
        Upsert one campaign (idempotent by campaign name) into that database.
    publish_subject_campaign(token, subject, results, campaign, ...) -> None
        High-level: parse a campaign folder the same way notion_publish.publish()
        does and write it as a row with a cat-style body (chart image(s) +
        Resumen summary table) -- the three calls above, wired together.

Rich campaign schema (mirrors cat's migrated table): Campaña (title) · Fecha ·
Trials · Time/trial (s) · Best condition · Conditions · Grammar · Commit ·
MM hits/trial · Plain hits/trial · Δ vs plain · Δ vs plain (×). Any field with
no datum is left unset rather than filled with a wrong value -- notably
Best condition / Conditions, which only exist for combined (A/B/C/D) runs and
stay empty for plain targetbench campaigns.

Targets the same Notion API version as notion_publish.py (2022-06-28) and
reuses its api()/rt() helpers -- one HTTP path, one error type, no new deps.
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field
from datetime import date
from pathlib import Path


def _helpers():
    """Lazily import api()/rt() from notion_publish. Deferred to call time to
    avoid a circular import: notion_publish imports this module at load, so a
    module-level `from notion_publish import ...` here would run before
    notion_publish has finished defining those names."""
    from notion_publish import api, rt
    return api, rt


def _publish_helpers():
    """Lazily import the report-parsing / body-block builders from
    notion_publish, same deferral reason as _helpers(). These are the exact
    functions notion_publish.publish() uses to build a toggle's contents --
    reused here so a subject's row body is pixel-for-pixel the same style as
    the already-migrated cat database (chart image(s) + Resumen table)."""
    from notion_publish import (
        build_result_children, parse_report, parse_report_fields,
        parse_combined, panorama_metrics, git_commit, REPO,
    )
    return (build_result_children, parse_report, parse_report_fields,
            parse_combined, panorama_metrics, git_commit, REPO)


def _find_descendant_container(token: str, root_id: str, predicate):
    """Lazily import notion_publish.find_descendant_container -- see
    _helpers() for the deferral reason."""
    from notion_publish import find_descendant_container
    return find_descendant_container(token, root_id, predicate)


# DATABASE id of the "Suejtos" table (the <database> id, not the collection id).
SUJETOS_DB = "3c392dbb-42ef-809d-b57f-c19333f694b3"

# Title property of the "Suejtos" database and of each per-subject campaigns db.
NAME_PROP     = "Name"
CAMPAIGNS_DB  = "Campañas"
CAMPAIGN_PROP = "Campaña"

# Best condition / Conditions option set, matching cat's migrated table colors.
_CONDITION_COLORS = {
    "stop_only": "yellow", "fb_only": "blue", "fb_path_only": "red",
    "fb_stop": "green", "fb_path_stop": "orange", "none": "default",
}

# Reverse of run_iv_feedback_experiment.py's ARM_TITLES: the combined summary
# table's columns are human-readable display titles ("Stop-v only", ...), but
# _CONDITION_COLORS / the select options above are keyed by the raw condition
# slug -- this maps a parsed column header back to its slug so "Best condition"
# lands on the existing colored option instead of Notion auto-creating a new,
# uncolored one for the display-title text.
_ARM_TITLE_TO_SLUG = {
    "Stop-v only": "stop_only",
    "Feedback only": "fb_only",
    "Feedback (path) only": "fb_path_only",
    "Feedback + stop-v": "fb_stop",
    "Feedback (path) + stop-v": "fb_path_stop",
    "None (plain AFL)": "none",
}


# ── subject row (page) ───────────────────────────────────────────────────────

def _title_text(page: dict, prop: str) -> str:
    title = page.get("properties", {}).get(prop, {}).get("title", [])
    return "".join(t["plain_text"] for t in title).strip()


def ensure_subject_page(token: str, name: str) -> str:
    """Return the page id of the "Suejtos" row named `name`, creating a minimal
    row (name only; commits/description left blank for manual curation) if none
    exists. Idempotent: a rerun of the same subject reuses its row."""
    api, rt = _helpers()
    want = name.strip()
    found = api(token, "POST", f"/databases/{SUJETOS_DB}/query",
                {"filter": {"property": NAME_PROP, "title": {"equals": want}},
                 "page_size": 100})
    for page in found.get("results", []):
        if _title_text(page, NAME_PROP) == want:
            return page["id"]
    created = api(token, "POST", "/pages", {
        "parent": {"database_id": SUJETOS_DB},
        "properties": {NAME_PROP: {"title": rt(want)}},
    })
    print(f"[notion] subject: created Suejtos row '{want}' ({created['id']}) "
          f"-- fill in Commit OP/PUA and description by hand")
    return created["id"]


# ── per-subject campaigns database ───────────────────────────────────────────

def campaigns_schema() -> dict:
    """Rich property schema, identical to cat's migrated "Campañas" table."""
    cond_opts = [{"name": n, "color": c} for n, c in _CONDITION_COLORS.items()]
    return {
        CAMPAIGN_PROP:       {"title": {}},
        "Fecha":             {"date": {}},
        "Trials":            {"number": {"format": "number"}},
        "Time/trial (s)":    {"number": {"format": "number"}},
        "Best condition":    {"select": {"options": cond_opts}},
        "Conditions":        {"multi_select": {"options": cond_opts}},
        "Grammar":           {"rich_text": {}},
        "Commit":            {"rich_text": {}},
        "MM hits/trial":     {"number": {"format": "number"}},
        "Plain hits/trial":  {"number": {"format": "number"}},
        "Δ vs plain":        {"number": {"format": "number"}},
        "Δ vs plain (×)":    {"number": {"format": "number"}},
    }


def _find_campaigns_db(token: str, subject_page_id: str):
    """Find the "Campañas" child_database anywhere under the subject page --
    not just its direct children. A fresh page only ever has it as a direct
    child, but once someone hand-drags it into the callout (replicating cat's
    exact nested style, which the API itself can't create -- see
    ensure_campaigns_db's docstring) it becomes a *grandchild* of the page,
    nested inside the callout block. A direct-children-only search misses
    that and wrongly concludes no database exists yet, creating a duplicate."""
    def is_campaigns_db(b):
        return (b["type"] == "child_database"
                and b.get("child_database", {}).get("title") == CAMPAIGNS_DB)
    found = _find_descendant_container(token, subject_page_id, is_campaigns_db)
    return found[1] if found else None


CALLOUT_TEXT = (
    "Una fila por campaña, publicado por notion_publish.py al cierre de cada "
    "corrida. Cada fila trae el PNG de resultados y la tabla resumen del "
    "report.md (o de la comparación combinada) como contenido de su propia "
    "página."
)


def ensure_campaigns_db(token: str, subject_page_id: str) -> str:
    """Return the id of the "Campañas" database embedded in the subject's page,
    creating it (with the rich schema, as an INLINE table -- visible directly
    on the page, not a link to a separate sub-page) if absent, preceded by a
    gray descriptive callout. Idempotent: reused on later campaigns.

    Visual note: cat's original migrated database is nested literally *inside*
    a gray callout block (its `parent` is the callout's block id). Confirmed
    live that the API cannot create that -- `POST /databases` rejects any
    `block_id` parent regardless of `is_inline` (HTTP 400, only `page_id`/
    `database_id` are accepted); that nesting can only be done by hand in the
    Notion UI (drag the inline table into the callout after creation). This
    places an equivalent gray callout right before an inline (not full-page)
    database instead -- same visual read, not literally nested -- but if
    someone later hand-drags it into the callout to match exactly, the lookup
    (_find_campaigns_db) still finds it there on the next run."""
    api, rt = _helpers()
    existing = _find_campaigns_db(token, subject_page_id)
    if existing:
        return existing["id"]
    callout = {
        "type": "callout",
        "callout": {
            "rich_text": rt(CALLOUT_TEXT),
            "icon": {"type": "emoji", "emoji": "👁"},  # closest public-API stand-in for cat's built-in "view" icon
            "color": "gray_background",
        },
    }
    api(token, "PATCH", f"/blocks/{subject_page_id}/children", {"children": [callout]})
    created = api(token, "POST", "/databases", {
        "parent": {"type": "page_id", "page_id": subject_page_id},
        "title": rt(CAMPAIGNS_DB),
        "is_inline": True,
        "properties": campaigns_schema(),
    })
    print(f"[notion] subject: created '{CAMPAIGNS_DB}' db ({created['id']}) "
          f"in subject page {subject_page_id}")
    return created["id"]


# ── campaign row upsert ──────────────────────────────────────────────────────

@dataclass(frozen=True)
class CampaignRow:
    """One row of a subject's rich campaigns table. `campaign` is the upsert
    key. Every field beyond campaign/date is optional: any left None is omitted
    from the row rather than written as a wrong value. best_condition and
    conditions only apply to combined (A/B/C/D) runs; they stay None for plain
    campaigns, leaving those columns empty."""
    campaign: str
    date: str                                   # ISO, e.g. "2026-08-06"
    trials: int | None = None
    time_s: int | None = None
    best_condition: str | None = None           # combined runs only
    conditions: list[str] = field(default_factory=list)  # combined runs only
    grammar: str | None = None
    commit: str | None = None
    mm_hits: float | None = None
    plain_hits: float | None = None
    delta: float | None = None
    ratio: float | None = None

    def properties(self) -> dict:
        _, rt = _helpers()
        props: dict = {
            CAMPAIGN_PROP: {"title": rt(self.campaign)},
            "Fecha":       {"date": {"start": self.date}},
        }
        if self.trials is not None:
            props["Trials"] = {"number": self.trials}
        if self.time_s is not None:
            props["Time/trial (s)"] = {"number": self.time_s}
        if self.best_condition is not None:
            props["Best condition"] = {"select": {"name": self.best_condition}}
        if self.conditions:
            props["Conditions"] = {"multi_select": [{"name": c} for c in self.conditions]}
        if self.grammar is not None:
            props["Grammar"] = {"rich_text": rt(self.grammar)}
        if self.commit is not None:
            props["Commit"] = {"rich_text": rt(self.commit)}
        if self.mm_hits is not None:
            props["MM hits/trial"] = {"number": self.mm_hits}
        if self.plain_hits is not None:
            props["Plain hits/trial"] = {"number": self.plain_hits}
        if self.delta is not None:
            props["Δ vs plain"] = {"number": self.delta}
        if self.ratio is not None:
            props["Δ vs plain (×)"] = {"number": self.ratio}
        return props


def _row_key(page: dict) -> str:
    return _title_text(page, CAMPAIGN_PROP)


def publish_campaign_row(token: str, db_id: str, row: CampaignRow,
                          body_children: list[dict] | None = None) -> None:
    """Upsert `row` into the campaigns database by campaign name: if a row with
    that name exists it's archived and replaced, else appended. (The API has no
    in-place row edit; archive+create keeps the table read-by-name, not by
    position.) `body_children` -- normally notion_publish.build_result_children()
    output -- is written as the new row's own page content: chart image(s) +
    Resumen summary table, the same visual style as cat's migrated database.
    Omit it to write properties only (e.g. a row curated by hand)."""
    api, _ = _helpers()
    existing = api(token, "POST", f"/databases/{db_id}/query",
                   {"filter": {"property": CAMPAIGN_PROP,
                               "title": {"equals": row.campaign.strip()}},
                    "page_size": 100})
    for page in existing.get("results", []):
        if _row_key(page) == row.campaign.strip():
            api(token, "PATCH", f"/pages/{page['id']}", {"archived": True})
            break
    created = api(token, "POST", "/pages",
        {"parent": {"database_id": db_id}, "properties": row.properties()})
    if body_children:
        api(token, "PATCH", f"/blocks/{created['id']}/children",
            {"children": body_children})
    n_images = sum(1 for c in body_children if c["type"] == "image") if body_children else 0
    print(f"[notion] subject: upserted campaign row '{row.campaign}'"
          + (f" ({n_images} image(s))" if body_children else ""))


# ── high-level: campaign folder -> subject row + cat-style body ─────────────

def _best_condition_from_summary(summary_lines: list[str]):
    """Parse a combined run's summary table (see notion_publish.parse_combined)
    for the condition with the highest 'Mean hits/trial', excluding the plain
    baseline column. Returns (best_condition, best_hits, plain_hits) or
    (None, None, None) if the table doesn't have the expected shape -- this is
    best-effort dressing for structured properties, never fatal to publishing
    the row itself."""
    header = next((ln for ln in summary_lines if ln.strip().startswith("| Metric")), None)
    hits_row = next((ln for ln in summary_lines if ln.strip().startswith("| Mean hits/trial")), None)
    if not header or not hits_row:
        return None, None, None
    cols = [c.strip() for c in header.strip().strip("|").split("|")][1:]
    vals = [c.strip() for c in hits_row.strip().strip("|").split("|")][1:]
    try:
        parsed = [(c, float(v.replace(",", ""))) for c, v in zip(cols, vals)]
    except ValueError:
        return None, None, None
    plain = next((v for c, v in parsed if "none" in c.lower() or "plain" in c.lower()), None)
    instrumented = [(c, v) for c, v in parsed if not ("none" in c.lower() or "plain" in c.lower())]
    if not instrumented:
        return None, None, plain
    best_condition, best_hits = max(instrumented, key=lambda cv: cv[1])
    best_condition = _ARM_TITLE_TO_SLUG.get(best_condition, best_condition)
    return best_condition, best_hits, plain


def _parse_trials_time(fields: dict):
    """Extract (trials, time_s) from report.md's free-text 'Trials' field,
    e.g. '3 × 90s' -> (3, 90). Returns (None, None) if it doesn't match."""
    m = re.search(r"(\d+)\D+?(\d+)s", fields.get("Trials", ""))
    return (int(m.group(1)), int(m.group(2))) if m else (None, None)


def publish_subject_campaign(token: str, subject: str, results, campaign: str,
                              example: str = "cat", combined: bool = False) -> None:
    """High-level entry point: parse a campaign's results the same way
    notion_publish.publish() does, then write it as a row in `subject`'s own
    Campañas database instead of a page toggle -- same visual style as cat's
    migrated table (chart image(s) + Resumen summary table as the row's own
    page content), just organized per-subject instead of in one shared
    database with a Sujeto/Example column.

    `results` is a Path: a single targetbench.py campaign folder for
    combined=False, or a run_iv_feedback_experiment.py experiment root
    (containing iv_feedback_comparison.png etc.) for combined=True -- exactly
    notion_publish.publish()'s `results` argument.
    """
    (build_result_children, parse_report, parse_report_fields,
     parse_combined, panorama_metrics, git_commit, REPO) = _publish_helpers()

    results = Path(results)
    if not results.exists():
        raise FileNotFoundError(f"results dir not found: {results}")

    trials = time_s = mm_hits = plain_hits = delta = ratio = None
    best_condition = None
    conditions: list[str] = []

    if combined:
        bench_png = results / "iv_feedback_comparison.png"
        overhead_png = None
        config, summary = parse_combined(results)
        best_condition, mm_hits, plain_hits = _best_condition_from_summary(summary)
        if mm_hits is not None and plain_hits:
            delta = mm_hits - plain_hits
            ratio = mm_hits / plain_hits
        header = next((ln for ln in summary if ln.strip().startswith("| Metric")), None)
        if header:
            titles = [c.strip() for c in header.strip().strip("|").split("|")][1:]
            conditions = [_ARM_TITLE_TO_SLUG.get(t, t) for t in titles]
        m = re.search(r"(\d+)\s*trials?\D+?(\d+)s", config or "", re.I)
        if m:
            trials, time_s = int(m.group(1)), int(m.group(2))
    else:
        bench_png = results / f"{example}.png"
        overhead_png = (REPO / "evaluation/bench/results/rq2_overhead/micro"
                        / campaign / f"overhead_micro_{campaign}.png")
        fields = parse_report_fields(results / "report.md")
        config, summary = parse_report(results / "report.md")
        trials, time_s = _parse_trials_time(fields)
        metrics = panorama_metrics(results)
        if metrics is not None:
            mm_hits, plain_hits, delta, ratio = metrics

    grammar = None
    if not combined:
        grammar = parse_report_fields(results / "report.md").get("Grammar")

    commit = git_commit()

    subject_page_id = ensure_subject_page(token, subject)
    db_id = ensure_campaigns_db(token, subject_page_id)

    row = CampaignRow(
        campaign=campaign,
        date=date.today().isoformat(),
        trials=trials,
        time_s=time_s,
        best_condition=best_condition,
        conditions=conditions,
        grammar=grammar,
        commit=commit,
        mm_hits=mm_hits,
        plain_hits=plain_hits,
        delta=delta,
        ratio=ratio,
    )
    body = build_result_children(token, bench_png, overhead_png, summary, combined,
                                  campaign, config=None, commit=None)
    publish_campaign_row(token, db_id, row, body_children=body)

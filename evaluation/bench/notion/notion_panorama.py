"""Upsert idempotente de filas en la tabla panorama de Notion.

Extiende ``notion_publish.py``: además del toggle por campaña, mantiene la
tabla panorama ("Trials de 1200s", "Trials de 1800s", ...) sin duplicados.
La clave de idempotencia es el nombre de campaña: si ya existe una fila con
ese nombre en la tabla de la duración correspondiente, se reemplaza; si no,
se agrega.

Requiere ``NOTION_TOKEN`` en el entorno y el ID de la página de experimentos.

Uso desde notion_publish.py::

    from notion_panorama import PanoramaRow, upsert_row
    upsert_row(page_id, PanoramaRow(
        campaign="cat_sleep new-location 10ms",
        date="2026-08-06",
        config="10 × 1800s",
        best_variant="Feedback + stop-v",
        mm_hits=153_999.2,
        plain_hits=46_841.7,
    ))
"""

from __future__ import annotations

import os
from dataclasses import dataclass

import requests

API = "https://api.notion.com/v1"
HEADERS = {
    "Authorization": f"Bearer {os.environ.get('NOTION_TOKEN', '')}",
    "Notion-Version": "2022-06-28",
    "Content-Type": "application/json",
}


@dataclass(frozen=True)
class PanoramaRow:
    """Una fila de la tabla panorama. ``campaign`` es la clave de upsert."""

    campaign: str
    date: str          # ISO, e.g. "2026-08-06"
    config: str        # e.g. "10 × 1800s"
    best_variant: str  # e.g. "Feedback + stop-v"
    mm_hits: float     # mean hits/trial de la mejor variante MM
    plain_hits: float  # mean hits/trial de plain AFL

    @property
    def duration(self) -> str:
        """Duración de trial ("1800s"), usada para elegir la tabla destino."""
        return self.config.split("×")[-1].strip()

    def cells(self) -> list[str]:
        """Celdas en el orden de columnas de la tabla panorama."""
        delta = self.mm_hits - self.plain_hits
        ratio = self.mm_hits / self.plain_hits if self.plain_hits else 0.0
        return [
            self.campaign, self.date, self.config, self.best_variant,
            f"{self.mm_hits:,.1f}", f"{self.plain_hits:,.1f}",
            f"{delta:+,.1f} ({ratio:.2f}×)",
        ]


def _get(url: str, **kw) -> dict:
    resp = requests.get(url, headers=HEADERS, timeout=30, **kw)
    resp.raise_for_status()
    return resp.json()


def _children(block_id: str) -> list[dict]:
    """Todos los hijos directos de un bloque, siguiendo la paginación."""
    blocks, cursor = [], None
    while True:
        params = {"start_cursor": cursor} if cursor else {}
        data = _get(f"{API}/blocks/{block_id}/children", params=params)
        blocks += data["results"]
        if not data.get("has_more"):
            return blocks
        cursor = data["next_cursor"]


def _find_table(page_id: str, duration: str) -> str:
    """ID de la tabla panorama bajo el heading "Trials de <duration>".

    Recorre los hijos de la página: al encontrar el heading cuya text
    contenga la duración, devuelve la primera tabla que le sigue.
    """
    in_section = False
    for block in _children(page_id):
        btype = block["type"]
        if btype.startswith("heading"):
            texts = block[btype]["rich_text"]
            heading = "".join(t["plain_text"] for t in texts)
            in_section = duration in heading
        elif in_section and btype == "table":
            return block["id"]
    raise LookupError(f"tabla panorama para trials de {duration} no encontrada")


def _row_key(row: dict) -> str:
    """Texto plano de la primera celda de una fila (nombre de campaña)."""
    cells = row["table_row"]["cells"]
    return "".join(t["plain_text"] for t in cells[0]) if cells else ""


def _as_row_block(cells: list[str]) -> dict:
    return {
        "type": "table_row",
        "table_row": {
            "cells": [[{"type": "text", "text": {"content": c}}] for c in cells],
        },
    }


def upsert_row(page_id: str, row: PanoramaRow) -> None:
    """Inserta o reemplaza la fila de ``row.campaign`` en la tabla panorama.

    Reemplazo = borrar la fila vieja + agregar la nueva (la API de Notion no
    permite editar celdas de table_row in place). El orden puede variar tras
    un reemplazo; la tabla se lee por campaña, no por posición.
    """
    table_id = _find_table(page_id, row.duration)
    for existing in _children(table_id):
        if _row_key(existing) == row.campaign:
            requests.delete(
                f"{API}/blocks/{existing['id']}", headers=HEADERS, timeout=30,
            ).raise_for_status()
            break
    requests.patch(
        f"{API}/blocks/{table_id}/children",
        headers=HEADERS, timeout=30,
        json={"children": [_as_row_block(row.cells())]},
    ).raise_for_status()

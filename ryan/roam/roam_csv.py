"""CSV-driven vocabulary loader for Roam Talon grammar.

Phase F (per docs/COMPOSABLE-REFACTOR-PLAN.md §7 step 19–20).

Externalises spoken-form ↔ canonical-ID mappings into 3 CSVs under
~/.talon/user/roam-vocabulary/, watched for live edits, with auto-add-on-
missing-row to prevent vocabulary loss when a new canonical ID is added
to defaults but not yet present in the user's CSV.

Three lists, three CSV files:

    roam-pronouns.csv    →  user.roam_pronoun
    roam-actions.csv     →  user.roam_action_verb        (Phase F NEW)
    roam-scopes.csv      →  user.roam_containing_scope
                            user.roam_every_scope
                            user.roam_ordinal_scope

The scopes CSV has a 3rd column ('Modifier kind') routing each row to
one of three Talon lists.

Canonical defaults below are the source of truth. If a CSV is missing
or blank, defaults are written. If a canonical ID exists in defaults
but not in the CSV, a row is appended with the default spoken form.
"""

from __future__ import annotations

import csv
from pathlib import Path
from typing import Callable, Optional

from talon import Context, Module, app, fs

# ─────────────────────── canonical defaults ──────────────────────────
# Pinned in Phase F task #1 — derived from the inline ctx.lists
# definitions originally in roam_tmem_ext.py.

PRONOUN_DEFAULTS: dict[str, str] = {
    "current":         "cursor",
    "cursor":          "cursor",
    "selected":        "selection",
    "selected blocks": "selection",
    "selection":       "selection",
    "source":          "source",
    "that":            "that",
    "this":            "cursor",
}

# Single-target action verbs only. Compound rules (transfers, swaps,
# nudge, addToSelection, removeFromSelection) keep their own grammar.
# The legacy fold↔collapse / unfold↔expand cross-mapping is preserved
# verbatim — see hats.talon comment block.
ACTION_VERB_DEFAULTS: dict[str, str] = {
    "bar":      "openInSidebar",
    "chuck":    "remove",
    "collapse": "expand",
    "delete":   "remove",
    "expand":   "collapse",
    "fold":     "collapse",
    "load":     "zoom",
    "mark":     "setSelection",
    "sidebar":  "openInSidebar",
    "take":     "setSelection",
    "unfold":   "expand",
    "zoom":     "zoom",
}

CONTAINING_DEFAULTS: dict[str, str] = {
    "folks":     "parent",
    "page":      "page",
    "parent":    "parent",
    "top level": "topLevel",
}

EVERY_DEFAULTS: dict[str, str] = {
    "child":       "child",
    "children":    "child",
    "descendant":  "descendant",
    "descendants": "descendant",
    "kid":         "child",
    "kids":        "child",
    "neighbor":    "sibling",
    "neighbors":   "sibling",
    "neighbour":   "sibling",
    "neighbours":  "sibling",
    "sibling":     "sibling",
    "siblings":    "sibling",
    "sub":         "descendant",
    "subs":        "descendant",
}

ORDINAL_DEFAULTS: dict[str, str] = {
    "child":    "child",
    "kid":      "child",
    "sibling":  "sibling",
    "siblings": "sibling",
}

# ───────────────────────────── paths ─────────────────────────────────

_TALON_USER = Path(__file__).resolve().parent.parent.parent  # ~/.talon/user
VOCAB_DIR   = _TALON_USER / "roam-vocabulary"
PRONOUNS_CSV = VOCAB_DIR / "roam-pronouns.csv"
ACTIONS_CSV  = VOCAB_DIR / "roam-actions.csv"
SCOPES_CSV   = VOCAB_DIR / "roam-scopes.csv"

# ─────────────────────────── module wiring ───────────────────────────

mod = Module()

# Phase F: list declarations live with the loader that owns their values.
# Captures referencing {user.roam_*} live in roam_tmem_ext.py — Talon
# resolves list names globally so cross-file references work.
mod.list("roam_pronoun",
         desc="Roam pronoun marks (cursor / that / source / selection) — CSV-driven")
mod.list("roam_action_verb",
         desc="Single-target action verbs (chuck/take/zoom/...) — Phase F CSV-driven")
mod.list("roam_containing_scope",
         desc="Containing modifier scope (parent/page/topLevel) — CSV-driven")
mod.list("roam_every_scope",
         desc="Every modifier scope (child/descendant/sibling) — CSV-driven")
mod.list("roam_ordinal_scope",
         desc="Ordinal modifier scope (child/sibling) — CSV-driven")

ctx = Context()

# ────────────────────────── CSV utilities ────────────────────────────

def _read_rows(path: Path, n_cols: int) -> list[list[str]]:
    """Read CSV rows, skipping the header line and blank rows.
    Returns list of stripped column lists. Tolerates missing files."""
    if not path.exists():
        return []
    out: list[list[str]] = []
    with path.open(newline="") as fh:
        reader = csv.reader(fh)
        for i, row in enumerate(reader):
            if i == 0:                  # header
                continue
            stripped = [c.strip() for c in row]
            if len(stripped) < n_cols or not stripped[0]:
                continue                # blank/short row
            out.append(stripped[:n_cols])
    return out


def _write_csv(path: Path, header: str, rows: list[list[str]]) -> None:
    """Write a CSV with header + blank line + sorted rows."""
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as fh:
        fh.write(header + "\n\n")
        # Sort by primary key (spoken form), then by remaining columns
        for row in sorted(rows, key=lambda r: tuple(r)):
            fh.write(", ".join(row) + "\n")


# ──────────────────────── per-CSV loaders ────────────────────────────

def _load_simple(path: Path,
                 defaults: dict[str, str],
                 header: str) -> dict[str, str]:
    """Load a 2-column CSV (spoken_form, id). If file is missing/empty,
    seed with defaults. Auto-add canonical IDs missing from CSV."""
    rows = _read_rows(path, 2)
    if not rows:
        rows = [[k, v] for k, v in defaults.items()]
        _write_csv(path, header, rows)
        return dict(defaults)

    spoken_to_id = {row[0]: row[1] for row in rows}
    # Auto-add: every canonical ID must have at least one spoken form.
    present_ids = set(spoken_to_id.values())
    missing = [(spoken, cid) for spoken, cid in defaults.items()
               if cid not in present_ids]
    if missing:
        for spoken, cid in missing:
            rows.append([spoken, cid])
            spoken_to_id[spoken] = cid
        _write_csv(path, header, rows)
        app.notify("roam-vocabulary", f"auto-added {len(missing)} row(s) to {path.name}")
    return spoken_to_id


def _load_scopes() -> dict[str, dict[str, str]]:
    """Load roam-scopes.csv, returning {kind: {spoken: id}} for the 3 kinds.
    Rows have 3 cols: spoken_form, scope_id, modifier_kind."""
    header = "Spoken form, Scope ID, Modifier kind"
    rows = _read_rows(SCOPES_CSV, 3)

    kind_defaults: dict[str, dict[str, str]] = {
        "containing": CONTAINING_DEFAULTS,
        "every":      EVERY_DEFAULTS,
        "ordinal":    ORDINAL_DEFAULTS,
    }

    if not rows:
        rows = [[s, sid, kind]
                for kind, defs in kind_defaults.items()
                for s, sid in defs.items()]
        _write_csv(SCOPES_CSV, header, rows)

    by_kind: dict[str, dict[str, str]] = {k: {} for k in kind_defaults}
    for spoken, sid, kind in rows:
        if kind in by_kind:
            by_kind[kind][spoken] = sid

    # Auto-add: ensure every canonical ID for each kind has ≥1 spoken form.
    appended = 0
    for kind, defs in kind_defaults.items():
        present_ids = set(by_kind[kind].values())
        for spoken, sid in defs.items():
            if sid not in present_ids:
                by_kind[kind][spoken] = sid
                rows.append([spoken, sid, kind])
                present_ids.add(sid)
                appended += 1
    if appended:
        _write_csv(SCOPES_CSV, header, rows)
        app.notify("roam-vocabulary", f"auto-added {appended} row(s) to {SCOPES_CSV.name}")

    return by_kind


# ───────────────────── populate / watch ──────────────────────────────

def populate_lists() -> None:
    """Load all CSVs and assign ctx.lists['user.roam_*']."""
    ctx.lists["user.roam_pronoun"] = _load_simple(
        PRONOUNS_CSV, PRONOUN_DEFAULTS, "Spoken form, Pronoun")

    ctx.lists["user.roam_action_verb"] = _load_simple(
        ACTIONS_CSV, ACTION_VERB_DEFAULTS, "Spoken form, Action ID")

    by_kind = _load_scopes()
    ctx.lists["user.roam_containing_scope"] = by_kind["containing"]
    ctx.lists["user.roam_every_scope"]      = by_kind["every"]
    ctx.lists["user.roam_ordinal_scope"]    = by_kind["ordinal"]


def _on_fs_change(_path: str, _flags) -> None:
    populate_lists()


_watching = False

def start_watching() -> None:
    """Register fs watcher on roam-vocabulary/ — reload on any CSV edit."""
    global _watching
    if _watching:
        return
    VOCAB_DIR.mkdir(parents=True, exist_ok=True)
    fs.watch(str(VOCAB_DIR), _on_fs_change)
    _watching = True


# Initial load + watch happens at module import.
def _on_ready():
    populate_lists()
    start_watching()


app.register("ready", _on_ready)

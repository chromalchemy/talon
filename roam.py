from talon import Module, Context
import re

mod = Module()
ctx = Context()
ctx.matches = r"""
tag: user.roam
"""

mod.list("roam_tag", desc="Declared Roam page/tag names")

@mod.capture(rule="{self.roam_tag}")
def one_roam_tag(m) -> str:
    "One Roam Tag"
    return str(m)

ctx.lists["self.roam_tag"] = {
    "project": "project",
    "conflict": "conflict",
    "today": "today",
    "week": "week",
    "someday": "someday",
    "urgent": "urgent",
    "roam": "roam",
    "library": "lib",
    "get bit": "gb",
    "clj": "clojure",
    "talon": "talon",
    "cursorless": "cursorles",
    "ergonomics": "ergonomics",
}


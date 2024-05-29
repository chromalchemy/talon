from talon import Module, Context
import re

mod = Module()
ctx = Context()
ctx.matches = r"""
tag: user.roam
"""

mod.list("roam_tag", desc="Declared Roam tag names")

# @mod.capture(rule="{self.roam_tag}")
# def one_roam_tag(m) -> str:
#     "One Roam Tag"
#     return str(m)

mod.list("roam_ref", desc="Declared Roam reference ids")

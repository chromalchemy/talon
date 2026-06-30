"""Talon-facing stub for tlisp.demo.

Declares the Module/action signatures (Talon only discovers these in .py
files it loads itself). Bodies delegate to the Basilisp namespace via a
late-bound module-attribute lookup, so redefining a fn over nREPL takes
effect on the very next voice command -- no reload, no watcher."""

import importlib
import os
import sys

from talon import Module

LISP_ROOT = os.path.dirname(os.path.abspath(__file__))
if LISP_ROOT not in sys.path:
    sys.path.insert(0, LISP_ROOT)

_demo = None
try:
    _boot = importlib.import_module("00_boot")
    _demo = _boot.load_lpy("tlisp.demo")
except Exception as e:
    print(f"basilisp: tlisp.demo load error: {e!r}")

mod = Module()


@mod.action_class
class Actions:
    def basilisp_demo_hello(text: str):
        """Demo action implemented in Basilisp (tlisp.demo/hello)"""
        if _demo is None:
            print("basilisp: tlisp.demo not loaded")
            return
        _demo.hello(text)

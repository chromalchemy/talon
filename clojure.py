from talon import Context, Module

mod = Module()
ctx = Context()
ctx.matches = r"""
tag: user.clojure
"""

mod.list("clojure_core", desc="Clojure functions")

@mod.capture(rule="{self.clojure_core}")
def clojure_fn(m) -> str:
    "One Clojure Function"
    return str(m)

ctx.lists["self.clojure_core"] = {
    "assert": "*assert*",
}

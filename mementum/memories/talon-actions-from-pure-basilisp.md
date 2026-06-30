💡 Talon actions can be registered from pure Basilisp — no Python stub.

The "Talon only discovers Module/action_class in .py files" barrier is
just a **ResourceContext** requirement. Recipe (proven 2026-06-11,
`lisp/tlisp/spike.lpy`):

1. `rctx = talon.scripting.rctx; c = rctx.context("user.lisp.tlisp.spike")`
   — first dotted segment of the name becomes the action namespace, so
   it must start with `user.`.
2. Inside `with c.enter():` create `talon.Module()` and call
   `.action_class(cls)`.
3. `cls` = `type("Actions", (), {name: fn})` where fn is a Basilisp fn
   with `__name__`, `__qualname__`, `__doc__`, `__annotations__` set
   (action_class introspects all four; basilisp fns accept setattr).
4. **`mod._load()` is required** — decls only commit then (Talon's
   loader normally does this after a file load). Without it:
   "Action ... is not declared".
5. Reload safety: stash the ResourceContext in a `sys.modules` sentinel
   keyed by ctx-name; `.free()` the previous one before re-registering.
   Verified: save-reload leaves exactly 1 module + 1 impl, new body live.

⚠️ `rctx` is Talon internals — re-verify after Talon upgrades.

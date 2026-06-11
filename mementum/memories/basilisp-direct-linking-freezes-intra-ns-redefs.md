💡 Basilisp direct-links intra-namespace calls by default (compiled to raw
Python name refs, bypassing the Var). Consequence: nREPL-redefining `hello`
does NOT change behavior of a same-namespace `foo` that calls it — `foo`
keeps the old function object. Fix: `(defn ^:redef hello ...)` forces
callers through the Var. Mark any fn you intend to redefine live.

Immune paths (why the talon stubs work without it): Python-side late-bound
module-attribute lookups (`mod.hello(...)`) — re-def reassigns the module
attr; and file-save reloads, which recompile the entire namespace together.

Bonus: `^:redef` also gates off the "redefining Var" analyzer warning
(`__should_warn_on_redef`). Reload warnings generally ("may shadow an
existing alias" etc.) are *ungated* `logger.warning` calls from
`basilisp.lang.compiler.analyzer` — not controllable via `compiler_opts`;
suppress by logger level, scoped (see `_reload_quiet` in `lisp/00_boot.py`).

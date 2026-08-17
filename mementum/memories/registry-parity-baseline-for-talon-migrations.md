🔁 When migrating a Talon action surface (py → lpy or any rewrite):
snapshot the live registry BEFORE, diff AFTER. Catches bugs static
review misses.

Before (nREPL into Talon, port 7891):
- find the module: filter `registry.modules` values by `.path`
- baseline = {decl-name → str(inspect.signature(decl.proto))} from
  `mod._actions`; also capture `mod._lists` keys.

After the new module loads:
- set-diff decl names both directions; string-compare signatures
  (catches lost type annotations, dropped defaults, renamed args).
- check `len(registry.impls.actions[name]) == 1` per action and that
  the impl's `.ctx` is the NEW module — proves clean takeover after
  unloading the old file.

In the roam.py migration this immediately caught: (a) dashed Clojure
params produced unannotated python args (annotation keys must be
munged to match compiled names), (b) a failed register! leaking a
partial 18-action module that a name-only check would have missed.

Caveat: REPL eval history pins dead module objects in
`registry.modules` (weak refs) — a lingering old module that owns no
impls is inert; Talon restart clears it.

Sequencing (rebelle.py migration, 2026-08-17): for a *colocated*
migration, the .py module's registry `.path` IS the dotted name the
.lpy ctx will claim (`user.ryan.rebelle.rebelle`). Retire the .py
(rename → `.migrated-to-lisp`) BEFORE writing the .lpy, else both are
live briefly → duplicate impls per action during the window. Talon
unloads on rename (`loader: [-]` in log); the watcher loads the .lpy
on save. Roam never hit this — it first migrated into `lisp/tlisp/`
under a different ctx name.

❌ Basilisp: using an `:import` alias in *value position* at module top
level fails at (re)load with a munged NameError.

`(ns x (:import [talon :as pytalon]))` then
`(def actions (.-actions pytalon))` → `NameError: name 'talon_ziDNOb'
is not defined` when the namespace is imported as a file (worked fine
form-by-form in the REPL, which is what made it confusing).

Alias use in *call/symbol* position is fine (`pytalon/Module`,
`rctx/context`). It's only bare-value references to the aliased module
object that break.

Workaround: fetch the module object explicitly —

    (:import importlib)
    (def actions (.-actions (importlib/import-module "talon")))

Hit during the roam.py → tlisp.roam migration (2026-06-11). The
watcher's fail-safe ("previous definitions still live") made this a
non-event; the log line names the missing munged symbol.

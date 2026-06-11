🔁 When embedding a lisp runtime in a host app (Basilisp-in-Talon), don't
build file-watcher reload machinery — run an nREPL server in-process and
make host-facing stubs delegate **late-bound** (module-attribute lookup per
call). Redefs over nREPL apply on the next invocation with zero reloads.

Why not watchers: the old `basilisp` branch's loader called
`fs.watch(user_dir, ...)` at module level — Talon re-executes the file on
every reload, so watchers accumulated (no `fs.unwatch`), and its
touch-a-sibling-py reload scheme caused cascade storms (touch → Talon
reload → importlib.reload → full recompile → more fs events).

Daemon-thread server startup guard: **probe the port**, not module globals
(host reloads reset module state). And verify the chosen port isn't taken
by an unrelated process first — 7888 was a stray java nREPL; talon basilisp
lives on **7891** (roam bridge bb daemon is 6888).

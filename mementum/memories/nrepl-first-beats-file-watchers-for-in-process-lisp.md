🔁 When embedding a lisp runtime in a host app (Basilisp-in-Talon), make
host-facing stubs delegate **late-bound** (module-attribute lookup per call).
Then *either* an nREPL redef *or* a direct module reimport updates behavior
with zero host-level reloads — run an in-process nREPL server for
fine-grained eval, and a file watcher for save-to-update parity.

File watchers are fine **if**:
- scoped to the lisp source dir only (not the whole user dir),
- deduped across host reloads — module globals reset per reload, but
  `sys.modules` entries survive: park the registered callback in a sentinel
  module and `fs.unwatch` the previous one before `fs.watch`,
- reimporting the changed module directly (`importlib.reload`, with
  bytecode writing enabled — see the dont_write_bytecode memory).

What's NOT fine (the v1 `basilisp` branch bugs): watching the entire user
dir, no unwatch → watchers accumulate on every host reload, and
touch-a-sibling-py cascade reload schemes. Measured direct reimport:
~0.02-0.04s per save.

Daemon-thread server startup guard: **probe the port**, not module globals.
And verify the chosen port isn't taken by an unrelated process first — 7888
was a stray java nREPL; talon basilisp lives on **7891** (roam bridge bb
daemon is 6888).

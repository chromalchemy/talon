❌ Talon sets `sys.dont_write_bytecode=True` process-wide. Basilisp's `.lpyc`
namespace cache silently never writes → every Talon launch recompiles
basilisp.core (~19s) on the loader thread, triggering watchdog storms. This
was the entire mystery slowness of the old `basilisp` branch.

Fix: scoped context-manager flip of the flag around basilisp compiles only
(see `lisp/00_boot.py`). Cache *reads* are unaffected by the flag — once
written, warm init is fast even with the flag back on.

Pre-warm from CLI with `~/.talon/bin/python` (same CPython as Talon →
compatible bytecode magic number): set `sys.dont_write_bytecode=False`,
`import basilisp.main; basilisp.main.init()`.

Measured: 17.4s cold → 0.30s warm (basilisp 0.5.1, python 3.13.7).

Diagnosed live by evaluating `sys/dont_write_bytecode` over nREPL inside
the running Talon process.

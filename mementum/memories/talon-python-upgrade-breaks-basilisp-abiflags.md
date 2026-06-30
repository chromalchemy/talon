💡 A Talon update can bump its bundled Python (seen: 3.13 → **3.14.5
free-threaded / "3.14t"**, `sys.abiflags == 't'`, GIL off). This
silently breaks the whole basilisp layer:

- `import basilisp` fails → `00_boot.py` aborts → `load_all_lpy()` never
  runs → no `.lpy` modules load → all pure-Basilisp actions vanish AND
  nREPL :7891 never starts. A leftover detached brain JVM on :7892 can
  fool you into thinking boot ran.
- Symptom in talon.log: recurring TRACE `lists skipped because they have
  no matching declaration: user.roam_ref / user.roam_tag` (any
  `t/deflist`-declared list whose `.talon-list` values can't attach).
  Tell-tale: `basilisp boot error: ModuleNotFoundError("No module named
  'basilisp'")`.

Two-part fix:
1. Reinstall into the **new** venv site-packages (`python3.14t/`).
   No cp314t wheels exist for the C-ext deps → install pure-Python:
   `pyrsistent` via `PYRSISTENT_SKIP_EXTENSION=1`; `immutables` via a
   patched `setup.py` (add `IMMUTABLES_SKIP_EXTENSION` escape). Both have
   clean runtime fallbacks. Then `pip install --no-deps basilisp==0.5.1`.
   Use `~/.talon/bin/python` (== Talon's interpreter).
2. `ensure_paths()` must build the venv path with `sys.abiflags`
   (`python{maj}.{min}{abiflags}`) — bare `python3.14` ≠ `python3.14t`.

rctx/Module action registration still worked post-upgrade. Verify: touch
`00_boot.py`, watch for `boot-loaded N .lpy modules`, then "basil roam
test".

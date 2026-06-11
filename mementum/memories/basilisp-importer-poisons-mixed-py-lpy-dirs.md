💡 Upstream basilisp bug: `BasilispImporter.find_spec` returns
`ModuleSpec(fullname, None, is_package=True)` with EMPTY
`submodule_search_locations` for "namespace package" dirs (.lpy present,
no `__init__`). The importer sits FIRST on `sys.meta_path`, so it claims
parent packages like `user.ryan.roam` before Python's PathFinder — and
every sibling `.py` module in a mixed .py/.lpy dir then fails with
`ModuleNotFoundError` (of its own name, raised at importlib._bootstrap).

Talon symptoms: "import failed" at startup for the .py files, plus
looping `WARNING lists skipped because they have no matching
declaration` for every list those modules declare. The voice grammar
backed by those lists silently dies after restart.

Fix: `_patch_importer_namespace_specs()` in `lisp/00_boot.py` wraps
`find_spec` to fill in the real directory path (`fe4e2fb`).

Debug recipe: via nREPL :7891, inspect
`sys.modules["user.x.y"].__path__` — empty list = poisoned. Repair live:
pop the poisoned entries from sys.modules, touch the failed .py files.

Candidate upstream PR: basilisp `importer.py` namespace-package branch
should set submodule_search_locations to the matched root_path.

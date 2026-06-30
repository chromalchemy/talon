🎯 User directive: prefer Basilisp-shipped infrastructure over hand-rolled or external deps, when appropriate.

Stated 2026-06-11 during the brain-shim bencode refactor. Before hand-rolling a protocol/utility or adding a venv dependency, check what Basilisp already ships: `basilisp.contrib.*` (bencode, nrepl_server, pytest, sphinx), `basilisp.edn`, etc. Example: tlisp.brain's hand-rolled bencode was replaced with `basilisp.contrib.bencode` (`bc/encode`, `bc/decode-all` with `:keywordize-keys` + `:string-fn` — same usage as nrepl_server.lpy itself, which is good reference code for contrib APIs).

Rationale: one implementation maintained upstream, identical semantics to Talon's own :7891 server, fewer lines to own. A small perf cost (~2-3ms/call for bencode decode-all buffering) is acceptable; correctness/maintenance wins unless on a genuinely hot path.

Discovery route: grep `~/.talon/.venv/.../site-packages/basilisp/contrib/` and read how basilisp's own code consumes the API.

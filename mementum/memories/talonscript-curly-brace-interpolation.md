❌ TalonScript string literals are f-string-like; `{{` and `}}` escape literal braces

I had this wrong twice. The user has now corrected me twice.

**Mechanism (correct):** TalonScript string literals are templated.
Bare `{name}` interpolates a captured value (e.g. `{number}`,
`{user.letters}`). To embed a literal `{` or `}`, double it: `{{` and
`}}`. So `"{{:type \"implicit\"}}"` parses fine and yields the literal
string `{:type "implicit"}` — and `"{{:opacity {number}}}"` yields
`{:opacity 5}` with the number captured at runtime.

**What I said wrong:**
- "The lexer reads `:type` as a KEYNAME inside string literals." Wrong.
  The `unexpected token :type` error was a downstream symptom: `{:type
  …}` was parsed as an interpolation expression, and `:type` isn't a
  valid expression inside one.
- Gotcha #21 in `~/dev/tmem-roam-ext/docs/REFACTOR-PROGRESS.md` (now
  rewritten) used to frame this as "no inline dict literals" — that's
  the **workaround**, not the rule. You can have inline EDN/dict-shaped
  literals; you just need to double-brace them.

**In-repo proof** (cross-grep `{{` in `*.talon`):
- `~/.talon/user/ryan/photoshop/menu_actions.talon:1523` —
  `user.ps_command_nb("(fade-layer {{:opacity {number}}})")` ships
  literal EDN with a number interpolated at runtime.
- `~/.talon/user/ryan/rebelle/brush/brush.talon:12` — multi-line EDN
  block with nested `{{:r 255 :g 0 :b 0}}`.

**Design principle the user stated explicitly:**
> Avoid Python helpers that mirror Clojure ones.

The wrapper-action pattern (e.g. `roam_nudge_implicit(direction)`
building EDN in Python) was rejected because it mirrors a payload
shape that already lives unambiguously on the Clojure side. Two
parallel surfaces drift; a single inline-escape literal in TalonScript
keeps the construction in exactly one place. The chosen fix was
`user.roam_nudge("{{:type \"implicit\"}}", roam_direction)` — zero
new Python.

**Decision tree for embedded EDN/JSON in `.talon` bodies:**
1. Shape varies with grammar? Use a `@mod.capture` returning the EDN
   string; pass through as a NAME reference.
2. Shape is fixed (or only differs by interpolated values)? Use
   inline-escape `{{...}}` in the string literal.
3. Helper would build the shape from positional args, but the
   construction logic is already canonical in the receiving language
   (Clojure)? **Don't add the helper** — use option 2.
4. Helper would non-trivially construct or transform something that
   doesn't exist on the receiving side? Then a Python helper is fine.

**Future me, when seeing a `{...}` parse error in `.talon`:** check
brace doubling first. The error message points at the wrong thing.

💡 Recon: defining Talon VOICE COMMANDS (not just actions) from pure
Basilisp — feasibility mapped 2026-08-17 via live :7891 introspection,
spike NOT yet attempted. Findings (re-derivation would cost a session):

- Public `talon.Context.commands` is a READ-ONLY property (no fset) —
  Python-defined contexts have never carried commands; .talon files are
  the only supported source. So this is internals territory, same genre
  as the rctx trick behind tlisp.talon/register!.
- Internal `talon.scripting.context.Context` `.commands` is a
  **DictionaryMeta** (Talon's reactive dict) keyed by MUNGED rule
  strings (`__watercolor__tool___pi__water__brush__`) →
  `talon.scripting.types.CommandImpl`.
- `CommandImpl(ctx, rule: Rule, script: TalonScript, lineno,
  experiments=None)`.
- `TalonScript(filename, start_line, code, lines: Sequence[Statement])`
  — the lark compile entry lives around talon_script.py:857.

Spike plan: compile-or-duck-type a script (an object with `.run` may
suffice — CommandImpl just dispatches), inject into a rctx-created
context's commands DictionaryMeta, check the grammar engine picks it
up live. Unknowns: Rule parsing from rule string, whether injection
outside the loader propagates to speech, reload semantics.

Shipped instead (established pattern, do this by default): body in
.lpy as defaction — spec as a real Clojure map, `(str "(fn! "
(pr-str spec) ")")` over tlisp.nrepl — .talon keeps a one-line rule.
Remember: .talon refs use the MUNGED action name (user.reb_default_brush;
lark can't lex `-`), and a leading `'` on an eval string is a silent
no-op (returns the unevaluated list).

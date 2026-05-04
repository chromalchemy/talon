🎯 List-target arity: keep grammar uniform, enforce per-action

When generalising a single-target rule to accept lists (cursorless §3.5
shape: `primitive (and primitive)*` with single-element collapse), the
question of "what about verbs that semantically can only take one
target?" has two answers:

- **Option A (cursorless):** every action-verb rule accepts a target
  uniformly (primitive | range | list). The action handler decides
  whether multi-uid is meaningful: distribute (most editing verbs) or
  reject with a structured error (`list-not-supported`). Grammar stays
  one rule.

- **Option B:** split the verb list (`distributive_action_verb` vs
  `single_action_verb`), two rules, parse-time rejection. Verb
  classification ends up duplicated across CSV + Python and drifts on
  every new verb.

Cursorless picked A across an order-of-magnitude more verbs than we
have. The pattern matches the broader §4 design: slot *types* enforce
arity (Target vs Destination vs ScopeType), but multiplicity *within*
a slot is opaque to the grammar. We did the same in
`tmem-roam-ext`/`talon`: `chuck A and B` parses; `zoom A and B`
errors at the bridge.

Single-element collapse (return bare primitive when count=1) is what
makes this cheap downstream: handlers that don't care about multi-uid
never see a list at all.

When designing future composable grammars, default to A.

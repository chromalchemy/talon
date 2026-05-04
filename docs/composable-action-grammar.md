# Composable Action Grammars

A design pattern for spoken (or typed) command languages that pair an
**action** with one or more **targets** (named directly or inferred from
context) and serialize the result to a JSON RPC payload that an editor /
runtime / agent can execute.

The pattern is distilled from
[`cursorless-talon`](https://github.com/cursorless-dev/cursorless-talon),
in particular `src/cursorless.talon`, and is intended to be reusable for
any domain where you say *"do X to that thing over there"*.

---

## 1. The problem the pattern solves

A naive command grammar bakes the target into the action:

```
delete this line
delete this word
delete this function
copy that word to the cursor
```

You end up writing one rule per (verb × scope × variant), which explodes
combinatorially and makes it impossible to add a new scope without
touching every action.

A composable grammar factors the sentence into three orthogonal slots:

```
<action>   <target>?    <destination>?
```

…and lets each slot be independently extended. New scope → all actions
gain it. New action → all existing targets work with it. Marks, scopes,
modifiers, ranges, and lists become reusable grammar fragments.

The cost: you must carefully separate the **shape** of the parse (rule
arity, optionality, where source/destination/anchor sit) from the
**vocabulary** (the actual words "funk", "past", "to", "next", "and").
Cursorless does this by keeping all wording in CSV files and keeping the
grammar shape in code.

---

## 2. The three-layer model

```
              ┌──────────────────────────────────────────┐
              │  ACTION  (chooses arity & slot shape)    │
              └────────────────┬─────────────────────────┘
                               │ takes 0..N of:
              ┌────────────────▼─────────────────────────┐
              │  TARGET  /  DESTINATION                  │
              │  (= structured "what to act on")         │
              └────────────────┬─────────────────────────┘
                               │ built from:
              ┌────────────────▼─────────────────────────┐
              │  MARK  +  MODIFIER*                      │
              │  (= "where" + "how to expand/refine")    │
              └──────────────────────────────────────────┘
```

Every layer above is *optional in the right context* — that is the
"inferred from scope context cues" behaviour the user asked about.
Cursorless models inference by introducing two sentinel target types:
`ImplicitTarget` and `ImplicitDestination`. When the grammar omits a
slot, the capture inserts the sentinel and the runtime fills it in
(usually "the current selection" or "where the cursor is").

---

## 3. Targets — the core abstraction

A target is a tree, not a string. The four node types are:

| Type | Built from | Spoken example |
|------|------------|----------------|
| `Primitive` | optional `Mark` + ordered `Modifier[]` | *"air"*, *"funk air"*, *"every funk"* |
| `Range` | anchor `Primitive` + active `Primitive` + connective | *"air past bat"*, *"past bat"* (implicit anchor) |
| `List` | `Primitive | Range` joined by a connective | *"air and bat and cap"* |
| `Implicit` | nothing | (sentinel — "current selection / inferred") |

### 3.1 Primitive target — `mark + modifier*`

```
primitive := modifier+ mark?
           | mark
```

So a primitive target is **at minimum either a mark or a non-empty
modifier chain**, and may be both. Concretely, in cursorless:

```python
# src/targets/primitive_target.py
@mod.capture(
    rule="<user.cursorless_modifier>+ [<user.cursorless_mark>] "
         "| <user.cursorless_mark>"
)
def cursorless_primitive_target(m) -> PrimitiveTarget:
    ...
    return PrimitiveTarget(mark, modifiers)
```

The *omitted mark* case is the inference path: *"funk"* (no mark) means
"the function containing the cursor" — the runtime resolves it against
the current selection. The *omitted modifier* case is the literal path:
*"air"* means "the token marked `air`", no expansion needed.

### 3.2 Marks — how you name a thing

A mark is a leaf — it identifies *one location* without expansion logic.
Cursorless ships four kinds; only the first is exotic, the rest are
generic and you should reuse them in any system:

| Mark | Purpose | Generic shape |
|------|---------|---------------|
| `decoratedSymbol` | hat-decorated character (Cursorless-specific) | `{type, color, character}` |
| `simpleMark` | named singletons like `cursor`, `that`, `source`, `nothing` | `{type}` |
| `lineNumber` | absolute / relative / modulo-100 line number | `{type, lineNumberType, lineNumber}` |
| `literal` | fuzzy text match — *"phrase X"* | wraps a regex modifier |

The two **system-defined marks every grammar should provide** are:

- **`that`** — the result of the previous command's target (the
  "last-thing pronoun"). Lets you say *"copy funk … paste after that"*
  without re-naming it.
- **`source`** — the source of the previous bring/move (so *"bring funk
  … format source"* keeps working on the just-moved code). Source as a
  separate pronoun is what makes bring/move chains feel ergonomic.

Without these two pronouns the grammar still parses, but users
constantly reach for the mouse to "show me what just happened".

### 3.3 Modifiers — how you reshape the thing the mark points at

Modifiers are the workhorse of composition. They wrap a target with
extra structure: *"the function containing X"*, *"every word in X"*,
*"the first three statements of X"*, *"start of X"*, *"inside X"*.

In cursorless they're declared once as a flat union:

```python
# src/modifiers/modifiers.py
modifiers = [
    "<user.cursorless_interior_modifier>",   # inside
    "<user.cursorless_head_tail_modifier>",  # head, tail
    "<user.cursorless_position_modifier>",   # start of, end of
    "<user.cursorless_simple_modifier>",     # bounds, just, leading, trailing
    "<user.cursorless_simple_scope_modifier>",  # funk, state, class, every funk
    "<user.cursorless_ordinal_scope>",       # first/last/third etc.
    "<user.cursorless_relative_scope>",      # next funk, 3 funks
]
```

The crucial design choice: **modifiers stack left-to-right** in the
spoken form but apply **innermost-first** semantically. *"start of every
funk"* parses as `[startOf, everyScope(funk)]` and the runtime applies
`everyScope` first, then `startOf` to each. The grammar doesn't enforce
a particular order — it just collects modifiers and the runtime
interprets them positionally.

The seven canonical modifier categories you should plan for:

1. **Containing scope** — *"funk"* → `containingScope(funk)` —
   *"the smallest X enclosing the cursor"*.
2. **Every scope** — *"every funk"* → `everyScope(funk)` —
   *"all X in the surrounding container"*.
3. **Ancestor scope** — *"outer funk"* → `containingScope(funk,
   ancestorIndex=N)` — *"climb N levels of nesting"*. (Cursorless does
   this by counting how many times the user said "outer".)
4. **Ordinal scope** — *"first funk"*, *"third past fifth word"* —
   index by position, optionally as a range.
5. **Relative scope** — *"next funk"*, *"three previous lines"*,
   *"funk backward"* — direction + offset + length.
6. **Position** — *"start of"*, *"end of"* — collapse a range to a
   point.
7. **Head / Tail / Interior** — *"head funk"*, *"inside round"* —
   asymmetric or boundary-stripping operations.

### 3.4 Range targets — `[anchor] connective active`

A range is an anchor primitive, an active primitive, and a connective
that says how to treat the endpoints:

```python
# src/targets/range_target.py
@mod.capture(rule=
    "[<user.cursorless_primitive_target>] "
    "<user.cursorless_range_connective_with_type> "
    "<user.cursorless_primitive_target>"
)
def cursorless_range_target(m) -> RangeTarget:
    ...
    anchor = ImplicitTarget() if len(primitive_targets) == 1 \
             else primitive_targets[0]
    return RangeTarget(anchor, primitive_targets[-1],
                       excludeAnchor, excludeActive, rangeType)
```

Two patterns to internalise:

- **The anchor is optional and defaults to `ImplicitTarget()`.** This
  is what makes *"past bat"* mean "from current selection up to bat".
  Same trick is used in swap (see §4).
- **The connective carries semantics, not just punctuation.** Cursorless
  encodes inclusive/exclusive on each end *into the connective itself*
  via the list `cursorless_range_connective` whose values include
  `rangeExclusive`, `rangeExcludingStart`, `rangeExcludingEnd`,
  `rangeInclusive`. The connective can also carry a *range type* like
  `vertical` (column-range), so *"slice"* vs *"past"* picks both
  endpoint policy and geometric interpretation.

### 3.5 List targets — `target (connective target)*`

```python
# src/targets/target.py
@mod.capture(rule=
    "<user.cursorless_primitive_or_range_target> "
    "({user.cursorless_list_connective} "
    " <user.cursorless_primitive_or_range_target>)*"
)
```

If the list collapses to one element, return the bare primitive/range —
don't wrap a single-element `ListTarget`. This keeps downstream
serialisation ergonomic.

### 3.6 Destinations — targets with an insertion mode

A destination is *"a target plus how to attach to it"*:

```
destination := (insertion_mode target) (connective insertion_mode target)*
insertion_mode := "before" | "after" | "to"
```

The same list-of-targets shape is reused, each element annotated with
how the inserted material lands:

```python
# src/targets/destination.py
@dataclass
class PrimitiveDestination:
    insertionMode: Literal["to", "before", "after"]
    target: Union[ListTarget, RangeTarget, PrimitiveTarget]
```

Crucially, *the user picks the mode by saying a different connective
word*: "before", "after", or "to". The grammar treats them
symmetrically. There is also `ImplicitDestination` — used when an
action's destination slot is omitted entirely.

---

## 4. Actions — choose your arity, choose your slots

Each action gets its own Talon list, and each list is matched by **one
grammar rule** that hard-codes the arity and slot shape. The action
list values are stable internal IDs (e.g. `pasteFromClipboard`,
`replaceWithTarget`); user-facing words come from CSV. Below is the
full table of cursorless's slot shapes — these are the *only* shapes
you need for a surprisingly broad command surface:

| Shape | Talon rule (paraphrased) | Example |
|-------|---------------------------|---------|
| **Action + target** | `<action> <target>` | *"chuck funk"* (delete fn) |
| **Action + source + destination?** | `<bringMove> <target> [<destination>]` | *"bring air to bat"*, *"move air"* |
| **Action + destination** | `<paste> <destination>` | *"paste after funk"* |
| **Action + 2 targets w/ connective** | `<swap> [<target>] <conn> <target>` | *"swap air with bat"* |
| **Action + 2 targets w/ preposition** | `<call> <target> on <target>` | *"call funk on air"* |
| **Modifier + action + target** | `<wrapper> <wrap> <target>` | *"round wrap air"* |
| **Subject + format + target** | `<formatters> form <target>` | *"camel form air"* |
| **Action + scope + visualizer** | `<show> <scope> [<viz>]` | *"visualize funk"* |

The shapes' Python:

```python
# src/cursorless.talon (excerpt)
<user.cursorless_action_or_ide_command> <user.cursorless_target>:
    user.private_cursorless_action_or_ide_command(...)

{user.cursorless_bring_move_action} <user.cursorless_bring_move_targets>:
    user.private_cursorless_bring_move(...)

{user.cursorless_swap_action} <user.cursorless_swap_targets>:
    user.private_cursorless_swap(cursorless_swap_targets)

{user.cursorless_paste_action} <user.cursorless_destination>:
    user.private_cursorless_paste(cursorless_destination)

<user.cursorless_wrapper_paired_delimiter>
    {user.cursorless_wrap_action}
    <user.cursorless_target>:
    user.private_cursorless_wrap_with_paired_delimiter(...)
```

### 4.1 Source vs destination

The single most useful design decision in cursorless is keeping
**source** and **destination** as different *types*, not different
positions in a flat argument list:

```python
@dataclass
class BringMoveTargets:
    source: CursorlessTarget         # is just a target
    destination: CursorlessDestination  # has insertion mode
```

When the user says *"bring air"* (no destination), the rule still
parses because the destination is optional and an `ImplicitDestination`
is inserted. The runtime knows what *"to where the cursor is"* means.
The grammar never has to choose between *"is this a source or a
destination?"* — the rule's slot type already answered that.

Similarly, **paste only takes a destination**, never a target:
*"paste after funk"* parses, *"paste funk"* does not. This prevents a
whole class of "I meant to insert" bugs at parse time.

### 4.2 Implicit anchors / second targets

Two-argument actions where one argument can be elided use the same
`Implicit*` sentinel trick:

```python
# swap.py
@mod.capture(rule=
    "[<user.cursorless_target>] "
    "{user.cursorless_swap_connective} "
    "<user.cursorless_target>"
)
def cursorless_swap_targets(m) -> SwapTargets:
    targets = m.cursorless_target_list
    return SwapTargets(
        ImplicitTarget() if len(targets) == 1 else targets[0],
        targets[-1],
    )
```

So *"swap with bat"* swaps the current selection with bat. The grammar
never has to be ambiguous about which argument is implicit — leftmost
wins, by convention, for every two-target action.

---

## 5. Scope context cues — *"funk"* without a mark

This is what the user asked about as "inferred from scope context
cues." There are three places the grammar lets context fill in for an
explicit mark:

1. **Bare modifier as a target.** *"funk"* alone is a primitive target
   with no mark — the runtime resolves it as *"the funk containing
   the cursor"*. Mechanism: the primitive rule allows `modifier+`
   without a mark.

2. **Implicit `that` / `source` pronouns.** Once any command runs,
   `that` points at its target and `source` at its source (for
   bring/move). These are first-class marks, so they slot into any
   primitive: *"every funk in that"*, *"end of source"*.

3. **Implicit anchor / destination.** Range and swap default a missing
   first argument to `ImplicitTarget`; bring/move default a missing
   destination to `ImplicitDestination`.

The unifying rule: **make the implicit thing a real value in the AST,
not a `null`.** Downstream code pattern-matches on `ImplicitTarget` /
`ImplicitDestination` and treats them as legitimate operands. Nullable
slots create ambiguity that explodes in serialisation and in the
runtime's interpreter.

---

## 6. Scope and the scope/range duality

A *scope* is both:

- a **modifier** (e.g. `containingScope(funk)`) that reshapes a target;
  used inside primitive targets.
- a **noun** that some actions consume directly (e.g. visualizer:
  *"visualize funk"*) — there it is captured as
  `cursorless_scope_type` and *not* wrapped in a target at all.

The rule of thumb:

- If the action operates *on a region of code*, it takes a **target**
  (which itself contains a scope-modifier). Use this for mutation,
  selection, navigation.
- If the action operates *on the concept of a scope* (visualization,
  configuration, "what counts as a funk in this language?"), it takes
  a **scope type** directly.

Cursorless declares two list pairs — `cursorless_scope_type` and
`cursorless_scope_type_plural` — so that ordinal/relative modifiers can
demand the plural form (*"first three funks"* parses; *"first three
funk"* doesn't):

```python
# src/modifiers/relative_scope.py
@mod.capture(rule=
    "[{user.cursorless_every_scope_modifier}] "
    "<user.cursorless_relative_direction> "
    "<number_small> <user.cursorless_scope_type_plural>"
)
def cursorless_relative_scope_plural(m): ...
```

This is one of the cheapest disambiguation techniques and worth copying.

---

## 7. RPC payload — what actually crosses the wire

Every command, regardless of which grammar rule produced it, ends up
shipped through a single RPC entry point:

```python
# src/command.py
CURSORLESS_COMMAND_ID = "cursorless.command"

actions.user.private_cursorless_run_rpc_command_get(
    CURSORLESS_COMMAND_ID,
    construct_cursorless_command(action),  # {version, spokenForm, action}
)
```

The `action` payload is a plain JSON dict. Schemas vary by action name;
the four common shapes are:

```jsonc
// Single-target action
{ "name": "remove", "target": <target> }

// Bring / move
{ "name": "replaceWithTarget" | "moveToTarget",
  "source": <target>,
  "destination": <destination> }

// Paste / replace
{ "name": "pasteFromClipboard", "destination": <destination> }
{ "name": "replace", "destination": <destination>,
  "replaceWith": ["text", ...] }

// Swap
{ "name": "swapTargets", "target1": <target>, "target2": <target> }

// Wrap
{ "name": "wrapWithPairedDelimiter",
  "left": "(", "right": ")",
  "target": <target> }

// Call as function
{ "name": "callAsFunction",
  "callee": <target>, "argument": <target> }

// Pass-through to host editor
{ "name": "executeCommand",
  "commandId": "editor.action.formatDocument",
  "options": {},
  "target": <target> }
```

A `<target>` is recursively:

```jsonc
// primitive
{ "type": "primitive",
  "mark": { "type": "decoratedSymbol", "symbolColor": "blue", "character": "a" },
  "modifiers": [ {"type": "containingScope", "scopeType": {"type":"namedFunction"}}, ... ] }

// range
{ "type": "range",
  "anchor": <primitive | implicit>,
  "active": <primitive>,
  "excludeAnchor": false, "excludeActive": false,
  "rangeType": "vertical" }       // optional

// list
{ "type": "list", "elements": [<primitive | range>, ...] }

// implicit
{ "type": "implicit" }
```

A `<destination>` has the same shape but each leaf carries
`insertionMode`:

```jsonc
{ "type": "primitive", "insertionMode": "after", "target": <target> }
```

The wrapper envelope adds three things the runtime needs but the
grammar shouldn't:

```jsonc
{
  "version": 7,                     // schema version, bump on breaks
  "spokenForm": "chuck funk",       // for telemetry / debugging
  "usePrePhraseSnapshot": true,     // resolve marks against frozen state
  "action": { ... }
}
```

The **pre-phrase snapshot** flag is the unsung hero of correctness:
the runtime captures editor state at the start of the utterance and
resolves marks against it, so changes that happen mid-phrase (cursor
moves, the user typing) don't shift what *"air"* points at. Any
RPC-driven command grammar that resolves identifiers from a mutable
world should adopt this.

---

## 8. Build order — how to bring this up in a new system

This is the order I'd build a clone of this pattern from scratch:

1. **Define the JSON command envelope and bump policy.** One field
   `version`, one field `name`, then per-action sub-schemas. Lock this
   first; the grammar rewrites itself around the schema, not the other
   way around.

2. **Build marks bottom-up.** Start with `cursor` and `that` (the
   minimum useful pronoun set). Add `source` the moment you implement
   any action with separate source/destination slots.

3. **Implement `PrimitiveTarget` with mark-only semantics.** Single
   rule, no modifiers yet. *"delete air"* should work end-to-end and
   round-trip JSON through your RPC.

4. **Add containing-scope modifier.** *"delete funk"* — the first
   "modifier-only" primitive — proves the inference path.

5. **Add `ImplicitTarget` + `RangeTarget`.** Pick one inclusive and one
   exclusive connective ("past" / "until" works). Now *"delete past
   bat"* works.

6. **Add `ListTarget` with one connective ("and").** Now batch ops
   work for free for every action you've already added.

7. **Add `Destination` + `ImplicitDestination` + bring/move/paste.**
   This is the moment source/destination separation pays off — paste
   gets *only* a destination by type, bring gets a source and an
   optional destination.

8. **Layer in the modifier categories one at a time:** every-scope →
   ordinal-scope → relative-scope → position → head/tail → interior.
   Each one is independent.

9. **Externalise vocabulary to CSV** the moment you have more than two
   users. The Python/Talon code should reference stable internal IDs
   (`pasteFromClipboard`, `containingScope`); the CSV maps spoken
   words to those IDs. This is what lets users localise / customise
   without touching code.

10. **Wire the pre-phrase snapshot.** Until you have it, multi-target
    commands that span a slow-resolving identifier will silently
    misbehave.

11. **Expose two public captures and a small CRUD action surface**
    (see §10). Users should be able to write new commands without
    reading any of your grammar internals.

---

## 9. Anti-patterns to avoid

- **Strings instead of trees.** If your action payload contains
  `"target": "funk air"` instead of a structured object, every
  consumer has to re-parse — and your modifiers don't compose.
- **One action, multiple optional positional args.** `bring(source,
  destination)` where both can be omitted is ambiguous in spoken form.
  Use distinct *types* (`Target` vs `Destination`) so the rule arity
  is unambiguous.
- **Nullable slots instead of `Implicit*`.** The runtime always has to
  branch; pattern-matching on a real `ImplicitTarget` is cleaner.
- **Putting wording in code.** *"funk"*, *"chuck"*, *"past"* should
  live in CSV. The grammar should refer to `namedFunction`, `remove`,
  `rangeExclusive`.
- **Mark resolution against live state.** Snapshot at phrase start.
- **Per-action target parsers.** Define `<target>` once; every action
  reuses it.
- **A scope that's only a modifier (or only a noun).** Decide whether
  scopes are first-class nouns for some actions; if so, expose
  `cursorless_scope_type` separately.
- **Exposing your whole grammar as the public extension API.** Users
  who want to build *"hello \<target\>"* shouldn't need to know about
  modifiers, range connectives, or your insertion-mode list — see §10.
- **Mixing extension-via-config and extension-via-code into one
  channel.** New IDE commands should land via CSV; new shapes of
  command (new arities, new slot types) should land via grammar code.
  If users have to edit both for either case, the boundary is wrong.
- **Building a parseable string DSL with the same surface as the
  spoken grammar.** When you cross a process boundary as a string,
  ship a *narrower* subset and keep the sugar in the host (§11).

---

## 10. Public surface — exposing the grammar to extensions

The internal grammar tree from §3-§7 is rich and recursive. The
*public* surface that Cursorless exposes for users to build their own
commands is deliberately tiny:

**Two captures.** That's it.

```
<user.cursorless_target>       — anywhere a target makes sense
<user.cursorless_destination>  — anywhere a destination makes sense
```

A user writing *"hello \<target\>"* never sees marks, modifiers,
ranges, or lists — they get a fully composed `cursorless_target`
value. The whole reason for the §3 effort is so this can be a single
opaque capture downstream. If your public API has six captures, you
got the layering wrong.

**A CRUD-shaped action surface.** Cursorless's public Talon actions
factor cleanly into read / write / lift, plus a couple of
specialisations:

| Action | Shape | Purpose |
|--------|-------|---------|
| `cursorless_command(action_id, target)` | invoke by id | run any built-in action |
| `cursorless_ide_command(cmd_id, target)` | pass-through | invoke a host-IDE command on a Cursorless-selected target |
| `cursorless_get_text(target, hide=False) -> str` | **read** | extract text from a target |
| `cursorless_get_text_list(target, hide=False) -> [str]` | **read** | extract text from a list-target's elements |
| `cursorless_insert(destination, text)` | **write** | put text at a destination |
| `cursorless_create_destination(target, mode="to")` | **lift** | promote a target to a destination |
| `cursorless_reformat(target, formatters)` | specialisation | apply a named formatter |
| `cursorless_insert_snippet(body, dest?, scope?)` | specialisation | insert a templated snippet |
| `cursorless_wrap_with_snippet(body, target, var, scope)` | specialisation | wrap a target with a templated snippet |

The three workhorses are **`get_text`**, **`insert`**, and
**`create_destination`**. With those three you can express any
"read-modify-write" command without touching the grammar:

```talon
# user.hello is a plain Python action: str -> str
hello <user.cursorless_target>:
    old = user.cursorless_get_text(cursorless_target, true)
    new = user.hello(old)
    destination = user.cursorless_create_destination(cursorless_target)
    user.cursorless_insert(destination, new)
```

This is **the** named pattern to internalise:

> *target → `get_text` → arbitrary host transform → `create_destination` → `insert`.*

It cleanly separates the parts of the system: the grammar resolves
*where*, the user's Python decides *what*, and the runtime handles
*how to write back*. Note that `create_destination` is what makes the
target/destination distinction (§3.6) usable from outside — without
it, users would have to re-parse a destination from scratch.

**A pass-through escape hatch.** `cursorless_ide_command` lets users
fire any host-side command against a target the grammar selected. The
common pattern when even that isn't enough is:

```talon
# Set selection cursorless-style, then fire any RPC command.
echo <user.cursorless_target>:
    user.cursorless_command("setSelection", cursorless_target)
    user.run_rpc_command("workbench.action.tasks.runTask", "Echo")
```

The grammar's job ends at *"the right thing is now selected"*; from
there, host conventions take over. **Always provide an action that
just sets selection** — it is the universal interop point.

**A data-driven action menu.** Cursorless lets users register new
"action-shaped" IDE commands purely by editing a CSV
(`actions_custom.csv`):

```csv
Spoken form, VSCode command
push down, editor.action.moveLinesDownAction
join, editor.action.joinLines
```

Suddenly *"push down air and bat"* and *"join air past bat"* both
work, with full target-grammar composition, with zero code change.
This is the principle:

> **The action *menu* should grow by configuration; the action
> *shapes* (arities, slot types) should grow by code.**

If a new spoken form needs a new arity (e.g., a third target type), it
deserves a code change. Otherwise it's a CSV row.

**Per-action implicit-slot semantics.** Worth calling out because the
docs surface it explicitly: when a public-API caller invokes
`cursorless_command("replaceWithTarget", target)`, the *target* is
treated as the **source** of the bring, and the **destination** is the
current selection — not vice versa. Each action gets to decide what
its omitted slot means; *"current selection"* is *not* universally the
right default. Document the implicit-slot mapping per action, and keep
it consistent (Cursorless's rule of thumb: for any source/destination
action, the omitted slot is whichever one wasn't named in the
public-API signature).

**Schema-versioning at the envelope, not the grammar.** The same
internal `version` field the RPC envelope carries (§7) is what lets
the public API be stable while the grammar evolves. If you bump the
envelope on a breaking change, public-API users get a clear error;
the spoken-form CSVs migrate via Cursorless's "missing-line auto-add"
trick (§ Customisation), where deleting a row triggers a
re-population on next reload — preventing accidental loss of vocabulary.

---

## 11. Embedded subset — the railroad lesson

Cursorless ships an experimental *string-parsed* command form,
`cursorless_x_custom_command("chuck block <target>", cursorless_target)`,
which lets you express commands as strings interpolated with target
captures. The grammar this string parser accepts is **deliberately
narrower than the spoken grammar**, and the railroad diagram makes
that narrowness visible:

```
main          ::= action
action        ::= simpleActionName target
                | bringMove        target destination
destination   ::= primitiveDestination
                | insertionMode target
target        ::= primitiveTarget                 -- no range, no list
primitiveTarget
              ::= modifier+
                | mark
                | modifier+ mark
modifier      ::= scopeType
                | direction scopeType             -- containing + relative only
scopeType     ::= simpleScopeTypeType
                | pairedDelimiter
mark          ::= simpleMarkType
                | placeholderTarget               -- ← see below
```

What's in this subset:

- Single-target and bring/move (the two slot shapes that cover the
  vast majority of commands).
- Containing-scope and relative-scope modifiers (the two most
  productive scope operators).
- Simple marks and **placeholders**.

What's *not* in this subset:

- Ranges, lists, every-scope, ordinal-scope, head/tail, interior,
  position, decorated marks, line numbers, custom regex scopes, swap,
  call, wrap, snippets…

Three lessons fall out of this:

**1. Placeholder-as-mark is the right way to do interpolation.** The
railroad shows `mark ::= simpleMarkType | placeholderTarget`. The
`<target>` in the command string isn't a separate "argument hole"
production — it's *a kind of mark*. So a string like `"chuck block
<target>"` parses as *"chuck"* (action) + *"block"* (containing-scope
modifier) + *"\<target\>"* (placeholder mark). At runtime, the
placeholder is resolved to the actual cursorless_target the caller
passed in. The grammar didn't need a new production; placeholders
just slot in wherever a mark would.

If you build any embedded DSL that needs to mix structural text with
host-language values, copy this trick: **make the placeholder a leaf
type in your existing grammar, not a parallel argument-substitution
mechanism.** It composes with everything that can already contain a
leaf, and it doesn't add ambiguity to the parser.

**2. The embedded subset should be smaller than the spoken
grammar.** Cursorless deliberately ships less when the grammar is
encoded as a string. The reasons are operational: spoken sugar like
*"every funk in the first three classes past bat"* is hard to write,
hard to read, and hard to debug as a literal string. A string DSL is
for **programs writing programs**, where the structure is usually
"verb noun" or "verb noun in noun"; humans constructing those strings
want the grammar to be obvious at a glance.

If you're building an LLM-driven command generator (the obvious
modern reason to ship an embedded subset), this lesson hardens
further: the LLM should emit the *narrow* subset, and the host should
expand any sugar before parsing. Otherwise the LLM has to reproduce
all your phonetic affordances, which it will get wrong.

**3. Stable subset = stable contract.** The full spoken grammar is
free to evolve (new modifier categories, new range types, new scope
shapes) because it lives behind two opaque public captures (§10). The
*embedded* subset becomes a contract the moment any caller hand-writes
strings against it. So pick the subset to be *exactly* the operators
that are orthogonal and won't change — single-target and bring/move
shapes, containing and relative scope, primitive targets, simple
marks, placeholders. Anything else can be added to spoken Talon
grammar without breaking embedded callers.

---

## 12. Quick reference — the nine composition rules

1. **A target is `mark? + modifier*`**, with at least one of the two.
2. **A range is `anchor? + connective + active`**, anchor optional →
   `Implicit`.
3. **A list is `elem (connective elem)*`**, single-elem collapses.
4. **A destination is a target with `insertionMode`** (`to` /
   `before` / `after`).
5. **Source and destination are different types**, not different
   positions; arity is enforced by the action's rule.
6. **Pronouns (`cursor`, `that`, `source`) are first-class marks**, so
   they compose in every primitive.
7. **Action lists pick the slot shape**; new actions pick from the
   shape menu, never reinvent it.
8. **Public extension surface is two captures
   (`<target>`, `<destination>`) plus a small CRUD action set**
   (`get_text`, `insert`, `create_destination`, `command`,
   `ide_command`). New action vocabulary lands by CSV; new action
   *shapes* land by code.
9. **An embedded string-parseable subset is a contract** —
   keep it strictly narrower than the spoken grammar, and make
   placeholders a kind of mark, not a parallel substitution mechanism.

If your grammar honours those nine rules, adding a new scope or a new
action becomes a one-file change, your RPC payloads stay
machine-checkable, and external callers can build whole new command
families without ever touching your grammar internals.

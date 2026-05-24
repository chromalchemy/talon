🌀❌ Grep the user's codebase BEFORE claiming a feature is broken or missing

**Meta-pattern. Single most important lesson from this session.**

**What happened:** Twice in one session I confidently told the user
that Talon features didn't exist:

1. "`print(...)` isn't a valid Talon action" → it is, used in
   `community/core/keys/keys.talon:6` and ~10 other files in his repo.
2. "`myapp = running_applications` is dead weight, you can't assign
   captures to variables like that" → completely standard pattern in
   `clippy-talon/`, `talon-ai-tools/`, and elsewhere.

Both times the proof was **2 directories away in the user's own code**.
The user had to drop a `vscode://` deeplink to correct me. Embarrassing
and avoidable.

**The trigger phrase that should snap me to attention:**

> "I've used it before"
> "this works elsewhere"
> "doesn't [feature X] exist?"

When the user — who lives in the system every day — pushes back on a
claim I made, **they're almost always right**. My job at that moment
is not to defend my prior, it's to grep their codebase for working
examples and update my model.

**The diagnostic loop I should run, in order:**

1. **Grep their own user dir first.** For Talon: `~/.talon/user/`.
   For bb: their bb.edn files and skill packs. For Roam: their JS
   extension code. For anything: the workspace roots the system prompt
   already lists.
2. **Look at the community/upstream code if not found there.** Talon
   community repo, babashka book, Adobe UXP docs.
3. **Only if BOTH come back empty** do I conclude "this construct
   genuinely doesn't exist" — and even then, propose a verification
   step rather than asserting.

**Why this matters more than the domain-specific lessons:**

- Domain knowledge decays / gets superseded.
- This meta-pattern compounds across every session.
- The user pays the cost of my wrong claims (writes a correction,
  drops a link, has to re-explain). Future-me's job is to make that
  cost approach zero.

**Specific bias to override:** I tend to assume "small DSL" languages
(Talon, bb.edn, .skill files) have *less* surface area than they
actually do. They often have surprising built-ins. Default to
"probably has it, let me look" rather than "probably doesn't, let me
suggest a workaround".

**Concrete check, before claiming any Talon construct doesn't exist:**
```bash
grep -rn "FEATURE_NAME" ~/.talon/user/ --include="*.talon" | head -20
grep -rn "FEATURE_NAME" ~/.talon/user/ --include="*.py"    | head -20
```

If anything matches → I'm wrong. Read the matches and update.

**Future me:** read this memory at the start of any session where the
user is debugging their own code in a system they built or
customized. The reflex you need is grep-first-then-claim, not the
reverse.

**Cross-reference:** `talon-script-has-print-and-assignment.md` is the
concrete instance that prompted this memory.

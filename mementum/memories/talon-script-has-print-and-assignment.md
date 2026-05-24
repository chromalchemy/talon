❌ `.talon` files DO have `print()` and `var = expr` assignment — I was wrong twice

**Both features I incorrectly told the user don't exist in TalonScript:**

**1. `print()` is a built-in TalonScript action.**

Usage with interpolation (community keys file):
```talon
<user.alt_arrow_keys>:
    print("alt_arrow_key: {alt_arrow_keys}")
    key(alt_arrow_keys)
```

Usage with bare variable (multiple real examples):
```talon
print(items)              # clippy-talon/src/clippy.talon
print(cmd)                # community/apps/warp/warp.talon
print(user.number_string) # ryan/linnworks/packages.talon
```

It prints to `~/.talon/talon.log`. Tail with `tail -F ~/.talon/talon.log`.

**2. Variable assignment with `name = expr` is a common idiomatic pattern.**

```talon
# clippy-talon/src/clippy.talon:34
items = user.clippy_get_items(clippy_targets)
print(items)

# talon-ai-tools/GPT/gpt.talon
text = edit.selected_text()
result = user.gpt_answer_question(text)

# community/apps/evernote/mac.talon
key_wait = 9.0
```

**What I claimed (and was wrong about):**
- "`print` is a Python function — there's no way to call it from .talon"
  → Wrong, it's a built-in action.
- "The `myapp = running_applications` line is dead weight" / "Talon
  command DSL doesn't have variable assignment like that"
  → Wrong, it's a normal pattern used throughout the codebase.

**The user's prompt that should have triggered cross-reference:**
> "print should be built into talon api. I've used it before"

Followed by a `vscode://` deeplink to the exact line proving it.

**Why future me cares:** TalonScript looks deceptively like Python but
is its own small DSL. Don't assume from surface syntax. The whole
language fits in a few `.talon` files in `~/.talon/user/community/` —
when in doubt about whether a construct exists, **grep the community
repo for it first**. Real examples beat my priors every time.

**Cross-reference:** see also `grep-users-codebase-before-claiming-broken.md`
for the meta-pattern this is an instance of.

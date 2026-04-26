from talon import Module, Context, actions
import uuid

mod = Module()
ctx = Context()

CODE_PATH = "/Users/ryan/dev/tmem-roam-ext"
BB_PATH = "/usr/local/bin/bb"

# Block transfer action — the verb (legacy: feeds into transfer! Clojure fn)
# NOTE: renamed from roam_action → roam_transfer_verb in Phase E to free the
# name for the new Python action user.roam_action(name, target).
mod.list("roam_transfer_verb", desc="Block transfer action verb (legacy transfer! :move/:link/:alias)")
ctx.lists["user.roam_transfer_verb"] = {
    "move": ":move",
    "link": ":link",
    "send link": ":link",
    "alias": ":alias",
    "link move": ":alias",
    "link and move": ":alias",
    "link block and move": ":alias",
    "ref block and move": ":alias",
    "ref block move": ":alias",
    "reference block and move": ":alias",
    "reference block move": ":alias",
    "leave alias": ":alias",
    "leave ref": ":alias",
    "leave ref move": ":alias",
    "leave ref and move": ":alias",
    "ref": ":link",
}

@mod.capture(rule="{user.roam_transfer_verb}")
def roam_transfer_verb(m) -> str:
    return m.roam_transfer_verb

# Block position relative to target — clojure keywords
mod.list("roam_position", desc="Block placement position")
ctx.lists["user.roam_position"] = {
    "top": ":first",
    "start": ":first",
    "first": ":first",
    "first child": ":first",
    "under": ":last",
    "bottom": ":last",
    "end": ":last",
    "last": ":last",
    "last child": ":last",
    "inside": ":last",
    "over": ":last",
    "before": ":before",
    "above": ":before",
    "after": ":after",
    "below": ":after",
    "outside": ":after",
}

@mod.capture(rule="{user.roam_position}")
def roam_position(m) -> str:
    return m.roam_position

# Base source: label, ref uid, or selection
@mod.capture(rule="<user.letters> | {user.roam_ref} | (selected [blocks] | [block] selection)")
def roam_source_base(m) -> str:
    try:
        return ":labels [:" + m.letters + "]"
    except AttributeError:
        pass
    try:
        return ':source-uid "' + m.roam_ref + '"'
    except AttributeError:
        pass
    return ":selected true"

# Source with optional parent modifier
# "A" → :labels [:A]
# "parent A" → :labels [:A] :parent true
# "parent agenda" → :source-uid "uid" :parent true
# "parent" → :parent true  (parent of focused block)
@mod.capture(rule="(parent [of] | tree) <user.roam_source_base> | parent | <user.roam_source_base>")
def roam_source(m) -> str:
    try:
        base = m.roam_source_base
    except AttributeError:
        return ":parent true"
    if len(list(m)) > 1:
        return base + " :parent true"
    return base

# Relative day direction for N-days offset (multiplier)
mod.list("roam_dnp_dir", desc="Direction for relative DNP day offset")
ctx.lists["user.roam_dnp_dir"] = {
    "forward": "1",
    "ahead": "1",
    "from now": "1",
    "after": "1",
    "back": "-1",
    "ago": "-1",
    "before": "-1",
}

# Legacy destination capture (renamed in Phase E): returns clojure kv-pair fragment.
# Still used by transfer!/zoom!/open-sidebar! rules until those rules migrate
# to the new <user.roam_target> capture (see tasks 5–7 of Phase E).
@mod.capture(rule="<user.letters> | {user.roam_tag} | {user.roam_ref} | {user.roam_daily} | <number_small> days {user.roam_dnp_dir}")
def roam_destination_legacy(m) -> str:
    try:
        return ":label :" + m.letters
    except AttributeError:
        pass
    try:
        return ':page "' + m.roam_tag + '"'
    except AttributeError:
        pass
    try:
        return ':uid "' + m.roam_ref + '"'
    except AttributeError:
        pass
    try:
        n = m.number_small
        sign = int(m.roam_dnp_dir)
        return ":daily " + str(n * sign)
    except AttributeError:
        pass
    return ":daily " + m.roam_daily

# Daily note page keywords
mod.list("roam_daily", desc="Daily note page references")
ctx.lists["user.roam_daily"] = {
    "today": ":today",
    "yesterday": ":yesterday",
    "tomorrow": ":tomorrow",
    "next day": ":next-day",
    "previous day": ":prev-day",
    "last day": ":prev-day",
    "next monday": ":next-mon",
    "next tuesday": ":next-tue",
    "next wednesday": ":next-wed",
    "next thursday": ":next-thu",
    "next friday": ":next-fri",
    "next saturday": ":next-sat",
    "next sunday": ":next-sun",
    "last monday": ":last-mon",
    "last tuesday": ":last-tue",
    "last wednesday": ":last-wed",
    "last thursday": ":last-thu",
    "last friday": ":last-fri",
    "last saturday": ":last-sat",
    "last sunday": ":last-sun",
}

@mod.capture(rule="{user.roam_daily}")
def roam_daily(m) -> str:
    return m.roam_daily

# Relative direction for nudging blocks in the outliner
mod.list("roam_direction", desc="Relative block movement direction")
ctx.lists["user.roam_direction"] = {
    "up": ":up",
    "down": ":down",
    "left above": ":left-above",
    "left up": ":left-above",
    "left": ":left-below",
    "left below": ":left-below",
    "left down": ":left-below",
    "down left": ":left-below",
    "back": ":left-below",
    "dedent": ":left-below",
    "indent less": ":left-below",
    "right": ":right",
    "indent": ":right",
    "write": ":right",
    "rate": ":right",
    "right below": ":right-below",
    "right down": ":right-below",
    "down right": ":right-below",
}

@mod.capture(rule="{user.roam_direction}")
def roam_direction(m) -> str:
    return m.roam_direction

# ════════════════════════════════════════════════════════════════════
# Phase E+G — composable captures returning EDN string fragments.
# Captures build EDN directly; actions send via clj-nrepl-eval to
# a persistent bb daemon (port 7888).
#
# Pipeline: Talon capture → EDN string → envelope → clj-nrepl-eval → execute!
# ════════════════════════════════════════════════════════════════════

NREPL_PORT = "6888"
NREPL_EVAL = "/Users/ryan/.local/bin/clj-nrepl-eval"

# ─── EDN helper ───
def _edn_str(s: str) -> str:
    """Escape a string for EDN embedding: wraps in double quotes."""
    return '"' + s.replace('\\', '\\\\').replace('"', '\\"') + '"'

# ─── Insertion mode (destination prefix) ───
mod.list("roam_insertion_mode", desc="Destination insertion mode: to/before/after")
ctx.lists["user.roam_insertion_mode"] = {
    "to":     "to",
    "into":   "to",
    "in":     "to",
    "before": "before",
    "above":  "before",
    "after":  "after",
    "below":  "after",
}

# ─── Modifier vocabulary ───
# (containing/every/ordinal scope lists in roam-vocabulary/*.talon-list — Phase F)

mod.list("roam_ordinal_word", desc="Ordinal index word (0-indexed; -1 = last)")
ctx.lists["user.roam_ordinal_word"] = {
    "first":   "0",
    "second":  "1",
    "third":   "2",
    "fourth":  "3",
    "fifth":   "4",
    "sixth":   "5",
    "seventh": "6",
    "eighth":  "7",
    "ninth":   "8",
    "tenth":   "9",
    "last":    "-1",
}

mod.list("roam_position_at", desc="Position modifier at (destination only)")
ctx.lists["user.roam_position_at"] = {
    "start":  "start",
    "top":    "start",
    "end":    "end",
    "bottom": "end",
}

# ─── Modifier captures (return EDN strings) ───
@mod.capture(rule="{user.roam_containing_scope} of")
def roam_containing_modifier(m) -> str:
    return '{:type "containing" :scope "' + m.roam_containing_scope + '"}'

@mod.capture(rule="every {user.roam_every_scope} of")
def roam_every_modifier(m) -> str:
    return '{:type "every" :scope "' + m.roam_every_scope + '"}'

@mod.capture(rule="{user.roam_ordinal_word} {user.roam_ordinal_scope} of")
def roam_ordinal_modifier(m) -> str:
    return ('{:type "ordinal" :scope "' + m.roam_ordinal_scope +
            '" :index ' + m.roam_ordinal_word + '}')

# Position modifier — only valid in destinations (bridge.clj will error on
# `position-on-target` if it leaks into a non-destination context).
@mod.capture(rule="{user.roam_position_at} of")
def roam_position_modifier(m) -> str:
    return '{:type "position" :at "' + m.roam_position_at + '"}'

# Union of non-position modifiers (used inside roam_target).
@mod.capture(rule="<user.roam_containing_modifier> "
                  "| <user.roam_every_modifier> "
                  "| <user.roam_ordinal_modifier>")
def roam_modifier(m) -> str:
    for attr in ("roam_containing_modifier", "roam_every_modifier",
                 "roam_ordinal_modifier"):
        try:
            return getattr(m, attr)
        except AttributeError:
            continue
    raise ValueError("no modifier matched in roam_modifier")

# ─── Mark capture (returns EDN string) ───
@mod.capture(rule="<user.letters> "
                  "| {user.roam_ref} "
                  "| {user.roam_tag} "
                  "| {user.roam_daily} "
                  "| {user.roam_pronoun}")
def roam_mark(m) -> str:
    try:
        return '{:type "label" :value "' + m.letters.upper() + '"}'
    except AttributeError:
        pass
    try:
        return '{:type "uid" :value ' + _edn_str(m.roam_ref) + '}'
    except AttributeError:
        pass
    try:
        return '{:type "pageTitle" :value ' + _edn_str(m.roam_tag) + '}'
    except AttributeError:
        pass
    try:
        # roam_daily list values are like ":today"; strip leading colon
        v = m.roam_daily
        val = v[1:] if v.startswith(":") else v
        return '{:type "daily" :value "' + val + '"}'
    except AttributeError:
        pass
    # Pronoun marks: cursor / that / source / selection (no :value needed)
    return '{:type "' + m.roam_pronoun + '"}'

# ─── Target capture (returns EDN string) ───
# Modifier chain reads outside-in in spoken form ("parent of every child of A")
# but bridge.clj's resolver applies modifiers left-to-right against the mark.
# So we collect modifiers in spoken order, then REVERSE for the AST list.
@mod.capture(rule="<user.roam_modifier>+ <user.roam_mark> | <user.roam_mark>")
def roam_target(m) -> str:
    mark = m.roam_mark
    try:
        modifiers = list(reversed(m.roam_modifier_list))
    except AttributeError:
        modifiers = []
    if modifiers:
        mods_edn = "[" + " ".join(modifiers) + "]"
        return '{:type "primitive" :mark ' + mark + ' :modifiers ' + mods_edn + '}'
    return '{:type "primitive" :mark ' + mark + '}'

# ─── Destination capture (returns EDN string) ───
# Optional position modifier ("start of"/"end of") chains onto the target.
@mod.capture(rule="{user.roam_insertion_mode} "
                  "[<user.roam_position_modifier>] "
                  "<user.roam_target>")
def roam_destination(m) -> str:
    target_edn = m.roam_target
    try:
        pos_mod = m.roam_position_modifier
        # Inject position modifier into the target's modifier list.
        # Target is '{:type "primitive" :mark ... [:modifiers [...]]}'
        # We append the position modifier to the modifiers vector.
        if ":modifiers [" in target_edn:
            # Insert before closing ]
            target_edn = target_edn.replace("]}", " " + pos_mod + "]}")
        else:
            # No modifiers yet — add the key before closing }
            target_edn = target_edn[:-1] + ' :modifiers [' + pos_mod + ']}'
    except AttributeError:
        pass
    return ('{:insertionMode "' + m.roam_insertion_mode + '"'
            ' :target ' + target_edn + '}')

# ─── Daemon eval helper ───
def _eval(code: str):
    """Send a Clojure expression to the bridge daemon via clj-nrepl-eval."""
    cmd = f"{NREPL_EVAL} --port {NREPL_PORT} '{code}'"
    print(cmd)
    actions.user.system_command_nb(cmd)


@mod.action_class
class Actions:
    def roam_fn(clj: str):
        """Evaluate a clojure expression in bridge.clj context (legacy).
        Falls back to bb shell-out for commands not yet on the daemon path."""
        cmd = f'''cd '{CODE_PATH}' && {BB_PATH} -e '(load-file "bridge.clj") {clj}' '''
        print(cmd)
        actions.user.system_command_nb(cmd)

    # ── Composable action surface (daemon mode) ─────────────────────
    def roam_action(name: str, target: str):
        """Action+target shape (setSelection, remove, collapse, expand,
        zoom, openInSidebar, getText, getRefs, addToSelection,
        removeFromSelection)."""
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "' + name + '" :target ' + target + '}})')

    def roam_action_pair(name: str, source: str, destination: str):
        """Action+source+destination shape (moveToTarget, linkToTarget,
        aliasMove)."""
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "' + name +
              '" :source ' + source +
              ' :destination ' + destination + '}})')

    def roam_action_dest(name: str, destination: str, string: str = ""):
        """Action+destination shape (insertNewBlock).
        string is the initial block content; default empty."""
        str_slot = (' :string ' + _edn_str(string)) if string else ""
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "' + name + '"' + str_slot +
              ' :destination ' + destination + '}})')

    def roam_swap(target1: str, target2: str, content: int = 0):
        """Action+two-targets shape (swap, swapContent)."""
        name = "swapContent" if content else "swap"
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "' + name +
              '" :target1 ' + target1 +
              ' :target2 ' + target2 + '}})')

    def roam_nudge(target: str, direction: str):
        """Nudge — single target + direction slot."""
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "nudge"'
              ' :target ' + target +
              ' :direction "' + direction + '"}})')

    def roam_move_to_position(target_edn: str, position: str):
        """Move target to first/last within its parent.
        Builds dest = {to + target's parent + position modifier}."""
        # Append containing:parent and position modifiers to the target
        if ":modifiers [" in target_edn:
            # Has modifiers — insert before closing ]}
            dt = target_edn.replace("]}", ' {:type "containing" :scope "parent"} {:type "position" :at "' + position + '"}]}')
        else:
            # No modifiers — add before closing }
            dt = target_edn[:-1] + ' :modifiers [{:type "containing" :scope "parent"} {:type "position" :at "' + position + '"}]}'
        dest = '{:insertionMode "to" :target ' + dt + '}'
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "moveToTarget"'
              ' :source ' + target_edn +
              ' :destination ' + dest + '}})')

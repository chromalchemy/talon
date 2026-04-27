from talon import Module, Context, actions
import uuid

mod = Module()
ctx = Context()

CODE_PATH = "/Users/ryan/dev/tmem-roam-ext"
BB_PATH = "/usr/local/bin/bb"

# Daily note page keywords
# Daily note page references (values in roam-vocabulary/roam_daily.talon-list)
mod.list("roam_daily", desc="Daily note page references")

@mod.capture(rule="{user.roam_daily}")
def roam_daily(m) -> str:
    return m.roam_daily

# Relative direction for nudging blocks in the outliner
# (values in roam-vocabulary/roam_direction.talon-list)
mod.list("roam_direction", desc="Relative block movement direction")

@mod.capture(rule="{user.roam_direction}")
def roam_direction(m) -> str:
    return m.roam_direction

# ════════════════════════════════════════════════════════════════════
# — composable captures returning EDN string fragments.
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

# ─── Modifier vocabulary ───
# (containing/every/ordinal scope lists in roam-vocabulary/*.talon-list )

mod.list("roam_pronoun", desc="Roam pronoun marks")
mod.list("roam_action_verb", desc="Single-target action verbs")
mod.list("roam_containing_scope", desc="Containing modifier scope")
mod.list("roam_every_scope", desc="Every modifier scope")
mod.list("roam_ordinal_scope", desc="Ordinal modifier scope")

mod.list("roam_ordinal_word", desc="Ordinal index word (0-indexed; -1 = last)")

mod.list("roam_position_at", desc="Position modifier at (destination only)")

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
        cmd = f'''{clj}'''
        print(cmd)
        _eval(cmd)

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

    # ── Talon-safe helpers (no .upper() / str() in .talon bodies) ───

    def roam_zoom_daily_offset(offset: int):
        """Zoom to a daily note page by numeric offset."""
        target = '{:type "primitive" :mark {:type "daily" :value ' + str(offset) + '}}'
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "zoom" :target ' + target + '}})')

    def roam_nudge_label(letter: str, direction: str):
        """Nudge a labeled block in a direction."""
        target = '{:type "primitive" :mark {:type "label" :value "' + letter.upper() + '"}}'
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "nudge" :target ' + target +
              ' :direction "' + direction[1:] + '"}})')

    def roam_nudge_implicit(direction: str):
        """Nudge the implicit (cursor) block in a direction."""
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "nudge" :target {:type "implicit"} :direction "' + direction[1:] + '"}})')

    def roam_swap_labels(letter1: str, letter2: str, content: int):
        """Swap two labeled blocks."""
        name = "swapContent" if content else "swap"
        t1 = '{:type "primitive" :mark {:type "label" :value "' + letter1.upper() + '"}}'
        t2 = '{:type "primitive" :mark {:type "label" :value "' + letter2.upper() + '"}}'
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "' + name + '" :target1 ' + t1 + ' :target2 ' + t2 + '}})')

    def roam_select_labels(letter1: str, letter2: str):
        """Select two labeled blocks as a list target."""
        t1 = '{:type "primitive" :mark {:type "label" :value "' + letter1.upper() + '"}}'
        t2 = '{:type "primitive" :mark {:type "label" :value "' + letter2.upper() + '"}}'
        target = '{:type "list" :elements [' + t1 + ' ' + t2 + ']}'
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "setSelection" :target ' + target + '}})')

    def roam_insert_before_label(letter: str):
        """Insert new block before a labeled block."""
        dest = '{:insertionMode "before" :target {:type "primitive" :mark {:type "label" :value "' + letter.upper() + '"}}}'
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "insertNewBlock" :destination ' + dest + '}})')

    def roam_insert_after_label(letter: str):
        """Insert new block after a labeled block."""
        dest = '{:insertionMode "after" :target {:type "primitive" :mark {:type "label" :value "' + letter.upper() + '"}}}'
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "insertNewBlock" :destination ' + dest + '}})')

    def roam_insert_child_of_label(letter: str, position: str):
        """Insert new block as first/last child of a labeled block."""
        dest = '{:insertionMode "to" :target {:type "primitive" :mark {:type "label" :value "' + letter.upper() + '"} :modifiers [{:type "position" :at "' + position + '"}]}}'
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "insertNewBlock" :destination ' + dest + '}})')

    def roam_insert_child_of_page(page: str, position: str):
        """Insert new block as first/last child of a page."""
        dest = '{:insertionMode "to" :target {:type "primitive" :mark {:type "pageTitle" :value ' + _edn_str(page) + '} :modifiers [{:type "position" :at "' + position + '"}]}}'
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "insertNewBlock" :destination ' + dest + '}})')

    def roam_insert_child_of_uid(uid: str, position: str):
        """Insert new block as first/last child of a UID block."""
        dest = '{:insertionMode "to" :target {:type "primitive" :mark {:type "uid" :value ' + _edn_str(uid) + '} :modifiers [{:type "position" :at "' + position + '"}]}}'
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "insertNewBlock" :destination ' + dest + '}})')

    def roam_insert_cursor_scope(scope: str, position: str):
        """Insert new block relative to cursor's containing scope (page or parent)."""
        dest = '{:insertionMode "to" :target {:type "primitive" :mark {:type "cursor"} :modifiers [{:type "containing" :scope "' + scope + '"} {:type "position" :at "' + position + '"}]}}'
        _eval('(execute! {:version 1 :id "voice-' + uuid.uuid4().hex[:8] +
              '" :action {:name "insertNewBlock" :destination ' + dest + '}})')

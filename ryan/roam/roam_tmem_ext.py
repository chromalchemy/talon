from talon import Module, Context, actions

mod = Module()
ctx = Context()

CODE_PATH = "/Users/ryan/dev/tmem-roam-ext"
BB_PATH = "/usr/local/bin/bb"

# Block transfer action — the verb
mod.list("roam_action", desc="Block transfer action verb")
ctx.lists["user.roam_action"] = {
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

@mod.capture(rule="{user.roam_action}")
def roam_action(m) -> str:
    return m.roam_action

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

# Destination capture: returns clojure kv-pair fragment (no braces)
@mod.capture(rule="<user.letters> | {user.roam_tag} | {user.roam_ref}")
def roam_destination(m) -> str:
    try:
        return ":label :" + m.letters
    except AttributeError:
        pass
    try:
        return ':page "' + m.roam_tag + '"'
    except AttributeError:
        pass
    return ':uid "' + m.roam_ref + '"'

@mod.action_class
class Actions:
    def roam_fn(clj: str):
        """Evaluate a clojure expression in bridge.clj context"""
        cmd = f'''cd '{CODE_PATH}' && {BB_PATH} -e '(load-file "bridge.clj") {clj}' '''
        print(cmd)
        actions.user.system_command_nb(cmd)

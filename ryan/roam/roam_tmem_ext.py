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
    "alias": ":alias",
    "ref": ":alias",
}

@mod.capture(rule="{user.roam_action}")
def roam_action(m) -> str:
    return m.roam_action

# Block position relative to target — clojure keywords
mod.list("roam_position", desc="Block placement position")
ctx.lists["user.roam_position"] = {
    "top": ":first",
    "to top": ":first",
    "to top of": ":first",
    "start": ":first",
    "first": ":first",
    "bottom": ":last",
    "to bottom": ":last",
    "to bottom of": ":last",
    "end": ":last",
    "last": ":last",
    "to": ":last",
    "inside": ":last",
    "before": ":before",
    "above": ":before",
    "after": ":after",
    "below": ":after",
    "outside": ":after",
}

@mod.capture(rule="{user.roam_position}")
def roam_position(m) -> str:
    return m.roam_position

# Source capture: returns clojure kv-pair fragment (no braces)
@mod.capture(rule="<user.letters> | {user.roam_ref} | (selected [blocks] | [block] selection)")
def roam_source(m) -> str:
    try:
        return ":labels [:" + m.letters + "]"
    except AttributeError:
        pass
    try:
        return ':source-uid "' + m.roam_ref + '"'
    except AttributeError:
        pass
    return ":selected true"

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

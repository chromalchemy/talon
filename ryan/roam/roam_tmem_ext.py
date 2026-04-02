from talon import Module, Context, actions

mod = Module()
ctx = Context()

CODE_PATH = "/Users/ryan/dev/tmem-roam-ext"
BB_PATH = "/usr/local/bin/bb"

# Move mode: spoken word → clojure keyword
mod.list("roam_move_mode", desc="Optional move mode for bridge commands")
ctx.lists["user.roam_move_mode"] = {
    "alias": ":alias",
    "ref": ":alias",
    "leave alias": ":alias",
    "link": ":link",
}

@mod.capture(rule="{user.roam_move_mode}")
def roam_move_mode(m) -> str:
    return m.roam_move_mode

# Block position relative to target — clojure keywords
mod.list("roam_position", desc="Block placement position")
ctx.lists["user.roam_position"] = {
    "top": ":first",
    "start": ":first",
    "first": ":first",
    "bottom": ":last",
    "end": ":last",
    "last": ":last",
    "before": ":before",
    "above": ":before",
    "after": ":after",
    "below": ":after",
}

@mod.capture(rule="{user.roam_position}")
def roam_position(m) -> str:
    return m.roam_position

# Source capture: returns a clojure map literal string
@mod.capture(rule="<user.letters> | {user.roam_ref} | (selected [blocks] | [block] selection)")
def roam_source(m) -> str:
    try:
        return "{:labels [:" + m.letters + "]}"
    except AttributeError:
        pass
    try:
        return '{:source-uid "' + m.roam_ref + '"}'
    except AttributeError:
        pass
    return "{:selected true}"

@mod.action_class
class Actions:
    def roam_fn(clj: str):
        """Evaluate a clojure expression in bridge.clj context"""
        cmd = f'''cd '{CODE_PATH}' && {BB_PATH} -e '(load-file "bridge.clj") {clj}' '''
        print(cmd)
        actions.user.system_command_nb(cmd)

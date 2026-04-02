from talon import Module, Context, actions

mod = Module()
ctx = Context()

CODE_PATH = "/Users/ryan/dev/tmem-roam-ext"
BB_PATH = "/usr/local/bin/bb"

# Bridge move-mode flags: "alias" → --alias, "link" → --link
mod.list("roam_move_mode", desc="Optional move mode for bridge commands")
ctx.lists["user.roam_move_mode"] = {
    "alias": "--alias",
    "ref": "--alias",
    "leave alias": "--alias",
    "link": "--link",
}

@mod.capture(rule="{user.roam_move_mode}")
def roam_move_mode(m) -> str:
    """Capture a bridge move mode flag (alias/link)"""
    return m.roam_move_mode

# Block position relative to target — values passed as --pos <value> to bridge.bb:
#   top/first/bottom/last = child placement within target
#   before/after = sibling placement
mod.list("roam_position", desc="Block placement position")
ctx.lists["user.roam_position"] = {
    "top": "first",
    "start": "first",
    "first": "first",
    "bottom": "last",
    "end": "last",
    "last": "last",
    "before": "before",
    "above": "before",
    "after": "after",
    "below": "after",
}

@mod.capture(rule="{user.roam_position}")
def roam_position(m) -> str:
    """Capture a block position value"""
    return m.roam_position

# Unified source capture: letters (label), roam_ref (UID), or selected blocks.
# Returns the CLI fragment for the source: --move A, --source-uid <uid>, --move-selected
@mod.capture(rule="<user.letters> | {user.roam_ref} | (selected [blocks] | [block] selection)")
def roam_source(m) -> str:
    """Capture a block source: label, ref UID, or current selection"""
    try:
        return "--move " + m.letters
    except AttributeError:
        pass
    try:
        return "--source-uid " + m.roam_ref
    except AttributeError:
        pass
    return "--move-selected"

@mod.action_class

class Actions:
    def roam_bb_task(call: str):
        """shell out to bb to run bb task for roam tmem extension"""
        cmd = f"cd '{CODE_PATH}' && {BB_PATH} {call} "
        print(cmd)
        actions.user.system_command_nb(cmd)

    def roam_fn(clj: str):
        """shell out to bb to eval string of roam tmem clojure code"""
        cmd = f"cd '{CODE_PATH}' && {BB_PATH} eval '{clj}' "
        print(cmd)
        actions.user.system_command_nb(cmd)

    def roam_move(base_cmd: str, position: str, mode: str) -> str:
        """Build bridge move/link command from base command, position, and mode.
        position: 'first'/'last'/'before'/'after' → appended as --pos <value>.
                  empty string for default (last child).
        mode: --alias appends flag, --link swaps verb, empty for plain move."""
        cmd = base_cmd
        # Apply position via --pos flag
        if position:
            cmd = cmd + " --pos " + position
        # Apply mode
        if mode == "--link":
            return (cmd
                .replace("--move-selected", "--link-selected")
                .replace("--source-uid", "--link-uid")
                .replace("--move", "--link"))
        elif mode == "--alias":
            return cmd + " --alias"
        return cmd


    
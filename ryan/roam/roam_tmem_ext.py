from talon import Module, Context, actions

mod = Module()
ctx = Context()

CODE_PATH = "/Users/ryan/dev/tmem-roam-ext"
BB_PATH = "/usr/local/bin/bb"

# Bridge move-mode flags: "alias" → --alias, "link" → --link
mod.list("roam_bridge_move_mode", desc="Optional move mode for bridge commands")
ctx.lists["user.roam_bridge_move_mode"] = {
    "alias": "--alias",
    "link": "--link",
    "leave alias": "--alias",
}

@mod.capture(rule="{user.roam_bridge_move_mode}")
def roam_bridge_move_mode(m) -> str:
    """Capture a bridge move mode flag (alias/link)"""
    return m.roam_bridge_move_mode

# Block position: "top"/"first" → --first, "bottom"/"last" → --last
mod.list("roam_bridge_position", desc="Child position for block placement")
ctx.lists["user.roam_bridge_position"] = {
    "top": "--first",
    "first": "--first",
    "bottom": "--last",
    "last": "--last",
}

@mod.capture(rule="{user.roam_bridge_position}")
def roam_bridge_position(m) -> str:
    """Capture a block position flag (top/bottom/first/last)"""
    return m.roam_bridge_position

@mod.action_class

class Actions:
    def roam_bb_task(call: str):
        """shell out to bb to run bb task for roam tmem extension"""
        cmd = f"cd '{CODE_PATH}' && {BB_PATH} {call} "
        print(cmd)
        actions.user.system_command_nb(cmd)

    def roam_bridge_move(base_cmd: str, mode: str) -> str:
        """Build bridge move/link command based on mode.
        mode='--alias': appends --alias to the move command.
        mode='--link': swaps --move-selected→--link-selected, --move→--link.
        mode='': returns base_cmd unchanged."""
        if mode == "--link":
            return base_cmd.replace("--move-selected", "--link-selected").replace("--move", "--link")
        elif mode == "--alias":
            return base_cmd + " --alias"
        return base_cmd


    
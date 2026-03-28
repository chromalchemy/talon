from talon import Module, actions

mod = Module()

CODE_PATH = "/Users/ryan/dev/tmem-roam-ext"
BB_PATH = "/usr/local/bin/bb"

@mod.action_class

class Actions:
    def roam_bb_task(call: str):
        """shell out to bb to run bb task for roam tmem extension"""
        cmd = f"cd '{CODE_PATH}' && {BB_PATH} {call} "
        print(cmd)
        actions.user.system_command_nb(cmd)


    
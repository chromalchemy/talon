from talon import Module, actions

mod = Module()

CODE_PATH = "/Users/ryan/dev/rebelle-api"
BB_PATH = "/usr/local/bin/bb"

@mod.action_class

class Actions:
    def rebelle_eval(clj: str):
        """shell out to bb to eval string of rebelle clojure code"""
        cmd = f"cd '{CODE_PATH}' && {BB_PATH} eval '{clj}' "
        print(cmd)
        actions.user.system_command_nb(cmd)

    def rebelle_fn(rebelle_fn: str):
        """execute a rebelle fn"""
        user.rebelle_eval(f"(send-rebelle-command {rebelle_fn})")

    def reb_open_settings():
        """open settings"""
        actions.key("cmd-,")

    def reb_save_layout(filename: str):
        """save layout settings"""
        actions.user.menu_select('Window|Export Layout')
        actions.sleep("500ms")
        actions.user.paste(filename)
        actions.sleep("300ms")
        actions.key("enter")

    def reb_update_layout(filename: str):
        """save layout settings"""
        actions.user.menu_select('Window|Export Layout')
        actions.sleep("500ms")
        actions.insert(filename)
        actions.sleep("300ms")
        actions.key("enter")
        actions.sleep("300ms")
        actions.key("tab")
        actions.sleep("100ms")
        actions.key("space")
    
    def reb_load_layout(filename: str):
        """load layout settings"""
        actions.user.menu_select('Window|Import Layout')
        actions.sleep("500ms")
        actions.insert(filename)
        actions.sleep("500ms")
        actions.key("enter")


    
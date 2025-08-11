from talon import Module, actions

mod = Module()

@mod.action_class
class Actions:
    def chrome_devtools_command(command: str):
        """send a command to chrome devtools"""
        actions.key("cmd-shift-p")
        # actions.sleep("100ms")
        actions.user.paste(command)
        actions.key("enter")

    # def rango_click_mark(mark: str):
    #     """click on a named rango mark"""
    #     actions.user.rango_run_action_on_reference("clickElement", mark)
    #     actions.sleep("100ms")
        

from talon import Context, Module, actions, settings

mod = Module()
ctx = Context()

mod.list("bc_cp_mark", "Named Rango marks")

@mod.action_class   
class Actions:
    def run_roam_command(text: str):
        """Run Command from command palette"""
        actions.key("cmd-p")
        actions.sleep("50ms")
        actions.user.paste(text)
        actions.sleep("50ms")
        actions.key("enter")

    def load_bookmark(text: str):
        """ search and select bookmark"""
        actions.key("cmd-l")
        actions.sleep("100ms")
        actions.insert("@bookmarks")
        actions.key("space")
        actions.sleep("100ms")
        actions.insert(text)
        actions.sleep("100ms")
        actions.key("tab enter")
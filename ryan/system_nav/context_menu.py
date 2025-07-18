from talon import Module, actions

mod = Module()

@mod.action_class   
class Actions:
    def run_ctx_menu_cmd(cmd_str: str):
        """Run Command from context menu"""
        actions.tracking.zoom_cancel()
        actions.mouse_click(1)
        actions.sleep("200ms")
        actions.insert(cmd_str)
        actions.sleep("200ms")
        actions.key("enter")
        # close the mouse grid if open
        actions.user.grid_close()
        

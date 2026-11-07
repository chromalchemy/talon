from talon import Module, actions

mod = Module()

@mod.action_class   
class Actions:
    def run_ctx_menu_cmd(cmd_str: str):
        """Run Command from context menu"""
        actions.tracking.zoom_cancel()
        actions.mouse_click(1)
        actions.sleep("300ms")
        # actions.key("down")
        actions.insert(cmd_str)
        actions.sleep("500ms")
        actions.key("enter")
        # # close the mouse grid if open
        actions.user.grid_close()

    def ctx_menu_select(title: str):
        """Right-click at the mouse, then select the context menu item with this title"""
        actions.tracking.zoom_cancel()
        actions.user.grid_close()
        actions.mouse_click(1)
        for _ in range(20):
            actions.sleep("50ms")
            if actions.user.active_menu_safe() is not None:
                break
        try:
            # declared in menu_select_ext.py
            item = actions.user.menu_item_by_title(title)
        except Exception:
            actions.key("escape")
            raise
        actions.user.menu_item_select(item)

from talon import Module, actions

mod = Module()

@mod.action_class



class Actions:
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


    
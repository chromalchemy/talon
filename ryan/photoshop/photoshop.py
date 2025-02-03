import os

from talon import Module, actions

mod = Module()

@mod.action_class
class Actions:

    def ps_command_nb(f: str):
        """execute a fn for ps repl via bb nrepl command"""
        code_path = '"/Users/ryan/dev/ps script/plugins/ps-scittle-repl"'
        ps_require_str = "(require 'playground)"
        # cljs_call =  '"' + ps_require_str + " " + f + '"'
        cljs_call =  '"' + f + '"'
        cmd = 'cd ' +  code_path + ' && bb nrepl-eval ' + cljs_call
        print(cmd)
        actions.user.system_command_nb(cmd)

    def ps_click():
        """kdjojif"""
        actions.user.zoom_close()
        actions.mouse_click(0)
        actions.user.grid_close()
        actions.user.mouse_drag_end()

    def ps_place_cursor_in_text():
        """kdjojif"""
        actions.key("t:down")
        actions.sleep("300ms")
        actions.mouse_click(0)
        actions.key("t:up")
        actions.sleep("300ms")

    def ps_select_text():
        """kdjojif"""
        actions.user.ps_place_cursor_in_text()
        actions.key("cmd-a")
        actions.sleep("500ms")

    def ps_duplicate_layer(layer_name: str):
        """kdjojif"""
        actions.user.menu_select('Layer|Duplicate Layer...')
        actions.key("right")
        actions.insert(" original")
        actions.sleep("300ms")
        actions.key("enter")
        actions.sleep("300ms")

    def ps_rasterize_layer():
        """rasterize the current layer"""
        actions.user.menu_select('Layer|Rasterize|Layer')
    
    def ps_go_layer_up():
        """kdjojif"""
        actions.key("alt-]")

    def ps_go_layer_down():
        """kdjojif"""
        actions.key("alt-[")

    def ps_move_layer_top():
        """kdjojif"""
        actions.key("cmd-shift-]")

    def ps_move_layer_bottom():
        """kdjojif"""
        actions.key("cmd-shift-[")

    def ps_move_layer_up(n: int):
        """kdjojif"""
        if n > 1:
            actions.key(f"cmd-]:{n}")
        else:
            actions.key("cmd-]")
    
    def ps_move_layer_down(n: int):
        """kdjojif"""
        actions.key("cmd-[")
        if n > 1:
            actions.core.repeat_command(n - 1)

    def ps_toggle_layer_visibility():
        """kdjojif"""
        actions.key("cmd-,")

    def ps_rename_layer(layer_name: str = ""):
        """kdjojif"""
        actions.user.menu_select('Layer|Rename Layer...')
        actions.sleep("200ms")
        if layer_name and layer_name != "":
            actions.insert(layer_name)
            actions.sleep("200ms")
            actions.key("enter")

    # bug repeat not working, try other implementation
    def ps_rotate_clone(n: int):
        """fn description"""
        multiplier = 4
        b = n * multiplier
        print(b)
        actions.print("alt-shift-.")
        actions.core.repeat_command(b)

    def ps_select_move_group_tool():
        """Activate move tool and select group mode"""
        actions.key("v")
        actions.key("shift-f19")

    def ps_select_move_layer_tool():
        """Activate move tool and select group mode"""
        actions.key("v")
        actions.key("shift-cmd-f19")

    def ps_new_layer(layer_name: str = ""):
        """Create a new layer with the specified name"""
        actions.user.menu_select('Layer|New|Layer...')
        # actions.key(shift-cmd-n)
        if layer_name and layer_name != "":
            actions.user.paste(layer_name)
            actions.sleep("200ms")
        actions.key("enter")
        
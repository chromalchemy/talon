from talon import Module, actions
import re

mod = Module()

#tag: user.roam

# mod.list("roam_tag", desc="Declared Roam tag names")

# @mod.capture(rule="{self.roam_tag}")
# def one_roam_tag(m) -> str:
#     "One Roam Tag"
#     return str(m)

# mod.list("user.ryan.roam.refs.list", desc="Declared Roam reference ids")

# @ctx.action_class("user")
# class UserActions:
@mod.action_class   
class Actions:
    def run_roam_command(text: str):
        """Run Command from command palette"""
        actions.key("cmd-p")
        actions.sleep("50ms")
        actions.user.paste(text)
        actions.sleep("50ms")
        actions.key("enter")

    def roam_lower(text: str):
        """Lowercases text"""
        return text.lower()
    
    def roam_go_block_end():
        """go to end of block"""
        actions.key("cmd-a")
        actions.sleep("100ms")
        actions.key("right")
        actions.sleep("100ms")

    def roam_new_child_block():
        """new child block"""
        actions.key("cmd-a")
        actions.sleep("100ms")
        actions.key("right")
        actions.sleep("100ms")
        actions.key("enter")
        actions.sleep("100ms")
        actions.key("tab")
        actions.sleep("100ms")

    def roam_select_block():
        """ """
        actions.key("esc")
        actions.sleep("100ms")

    def roam_select_none():
        """ """
        actions.key("esc:2")
        actions.sleep("100ms")
    
    def roam_select_block_below():
        """select block below"""
        actions.key("esc")
        actions.sleep("100ms")
        actions.key("down")
        actions.sleep("100ms")

    def roam_block_back(n: int):
        """ block back with timeout"""
        if n == 1:
            actions.key("shift-tab")
        else:
            for _ in range(n):
                actions.key("shift-tab")
                actions.sleep("100ms")

    def roam_block_forward(n: int):
        """ block back with timeout"""
        if n == 1:
            actions.key("tab")
        else:
            for _ in range(n):
                actions.key("tab")
                actions.sleep("100ms")
    
    def roam_break_block():
        "break block"
        actions.key("enter")
        actions.sleep("300ms")

    def roam_click_block():
        """click inside block and wait to settle"""
        actions.mouse_click(0)
        actions.user.mouse_drag_end()
        actions.sleep("200ms")

    def roam_select_block_text():
        """select block text"""
        actions.edit.select_all()
        actions.sleep("100ms")
    
    def roam_cut_block_text():
        """select block text"""
        actions.edit.select_all()
        actions.sleep("100ms")
        actions.edit.cut()

    def roam_go_block_start():
        """select block text"""
        actions.key("shift-home left")

    def roam_select_block_start():
        """select block text"""
        actions.key("shift-home")
            
    def roam_go_block_end():
        """select block text"""
        actions.key("shift-end right")

    def roam_select_block_end():
        """select block text"""
        actions.key("shift-end")
            
                
        


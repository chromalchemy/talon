from talon import Module, actions
import re

mod = Module()

# class UserActions:
@mod.action_class   
class Actions:
    def run_raycast_command(text: str):
        """Run Command from command palette"""
        actions.key("cmd-space")
        actions.sleep("300ms")
        actions.user.paste(text)
        actions.sleep("400ms")
        actions.key("enter")

    def raycast_select_app_menu_command(text: str):
        """select a menu command from raycast"""
        actions.key("cmd-alt-shift-ctrl-l")
        actions.sleep("100ms")
        actions.insert(text)
        actions.sleep("100ms")

    def raycast_run_app_menu_command(text: str):
        """run a menu command from raycast"""
        actions.user.raycast_select_app_menu_command(text)
        actions.key("enter")

   
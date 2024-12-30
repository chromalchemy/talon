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
        actions.sleep("200ms")
        actions.key("enter")

   
from talon import Module, actions
import re

mod = Module()

#tag: user.roam

mod.list("roam_tag", desc="Declared Roam tag names")

# @mod.capture(rule="{self.roam_tag}")
# def one_roam_tag(m) -> str:
#     "One Roam Tag"
#     return str(m)

mod.list("roam_ref", desc="Declared Roam reference ids")

# @ctx.action_class("user")
# class UserActions:
@mod.action_class
class Actions:
    def run_roam_command(text: str):
        """Run Command from command palette"""
        actions.key("cmd-p")
        actions.sleep("100ms")
        actions.user.paste(text)
        actions.sleep("100ms")
        actions.key("enter")

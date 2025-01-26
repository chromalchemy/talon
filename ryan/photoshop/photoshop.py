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
        cmd = 'cd ' +  code_path + ' ; bb nrepl-eval ' + cljs_call
        print(cmd)
        actions.user.system_command_nb(cmd)

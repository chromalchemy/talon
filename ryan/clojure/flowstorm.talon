app: vscode
-

##tag(): user.clojure_core

(launch | open) flow storm:
    user.run_rpc_command("calva.runCustomREPLCommand", "launch flow storm")
    
(trace | run) flow [top]:
    user.run_rpc_command("calva.runCustomREPLCommand", "trace flow")
    
(trace | run) flow [top] <user.cursorless_target>:
    user.cursorless_command("setSelection", cursorless_target)
    sleep(100ms)
    user.run_rpc_command("calva.runCustomREPLCommand", "trace flow")
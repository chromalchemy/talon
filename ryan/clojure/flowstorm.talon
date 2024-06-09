app: vscode
-

##tag(): user.clojure_core

(launch | open | hope and) (flow storm | flowstorm):
    user.run_repl_snippet("Launch Clojurestorm")
    
toggle (flow storm | flowstorm) recording:
    user.run_repl_snippet("toggle flowstorm recording")

(trace | run) flow [top]:
    user.run_repl_snippet("trace Flowstorm Local Flow")
    
(trace | run) flow [top] <user.cursorless_target>:
    user.cursorless_command("setSelection", cursorless_target)
    sleep(100ms)
    user.run_repl_snippet("trace Flowstorm Local Flow")
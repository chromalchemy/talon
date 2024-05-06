app: vscode
-

clear portal | portal clear:
    user.run_rpc_command("calva.runCustomREPLCommand", "pc")

portal (toggle | hide | show) shell:
    user.run_rpc_command("calva.runCustomREPLCommand", "pts") 
    # user.run_repl_snippet("Toggle Portal Shell")

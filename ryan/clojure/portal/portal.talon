app: vscode
-

clear portal | portal clear:
    user.run_repl_snippet("pc")

portal (toggle | hide | show) shell:
    user.run_repl_snippet("pts")
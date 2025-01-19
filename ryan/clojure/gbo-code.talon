app.name: Code
app.name: Cursor
app.name: Windsurf
-

# build bc templates 
[repl] (build | rebuild) (templates | theme | home [page]): 
    user.vscode("calva.loadFile")
    sleep(500ms)
    user.run_rpc_command("calva.runCustomREPLCommand", "b")
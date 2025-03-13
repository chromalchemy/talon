app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

# build bc templates 
[repl] (build | rebuild) (templates | theme | home [page]): 
    user.run_rpc_command("calva.loadFile")
    sleep(500ms)
    user.run_rpc_command("calva.runCustomREPLCommand", "b")
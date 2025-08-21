app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

split [up] (namespace | name space) [up] [[edit]]: 
    user.run_rpc_command("workbench.action.splitEditorUp")
    sleep(300ms)
    # edit.file_start()
    edit.find(":use")
    sleep(200ms)
    key(enter)
    sleep(200ms)
    key(esc)
    user.run_rpc_command("editor.action.insertLineAfter")
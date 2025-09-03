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
    sleep(300ms)
    key(esc)
    sleep(300ms)
    user.run_rpc_command("editor.action.insertLineAfter")
    sleep(300ms)
    key(tab)
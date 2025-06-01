app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next

-

tag(): user.address
tag(): user.file_manager
tag(): user.navigation

## ++++++++++++++++++++ Launch native compare view .

compare file:
    user.run_rpc_command("workbench.files.action.compareFileWith")

compare file (with | to) (clipboard | clip):
    user.run_rpc_command("workbench.files.action.compareWithClipboard")

compare file (with | to) (saved | last):
    user.run_rpc_command("workbench.files.action.compareWithSaved")


## ++++++++++++++++++++++ compare view .

[go] next [(diff | code)] change: 
    user.run_rpc_command("workbench.action.compareEditor.nextChange")

[go] last [(diff | code)] change: 
    user.run_rpc_command("workbench.action.compareEditor.previousChange")

## ___________________________________ .

(open  | go) working file : user.run_rpc_command("gitlens.openWorkingFile")

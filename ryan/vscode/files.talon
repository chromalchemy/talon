app.name: Code
app.name: Cursor
app.name: Windsurf
-

kill current file:
    user.run_rpc_command("andreas.removeFile")

(hunt |  (open | hope (and | in))) (file  | filename) [<user.text>]: 
    key(cmd-p)
    sleep(300ms)
    insert(text or "")

(hunt |  (open | hope and)) (file  | filename) [<user.text>] pop: 
    key(cmd-p)
    sleep(300ms)
    insert(text)
    sleep(200ms)
    key(enter)
    
## +++++++++++++++++++++++++++++++++ file explorer

bar (file | files): 
    user.run_rpc_command("workbench.files.action.focusFilesExplorer")

(show | reveal) file [in] [(explore | explorer)]: 
    user.run_rpc_command("workbench.files.action.showActiveFileInExplorer")

(fold | collapse) ((explore | Explorer) [folders] | [bar] files): 
    user.run_rpc_command("workbench.files.action.collapseExplorerFolders")

(fold | collapse) ((explore | Explorer) [folders] | [bar] files) [to] top [level] [folders]: 
    user.run_rpc_command("workbench.files.action.collapseExplorerFolders")
    user.run_rpc_command("workbench.files.action.collapseExplorerFolders")

(show | reveal) [file] [in] (finder | files): 
    user.run_rpc_command("revealFileInOS")

#use axkit command
# (show | reveal) file [in] finder:
#     #todo: not working
#     # key(cmd-alt-r)
#     key(cmd-shift-p)
#     sleep(100ms)
#     insert("reveal in finder")
#     sleep(100ms)
#     key(enter)

duplicate [current] file:
    user.run_rpc_command("andreas.duplicateFile")

new (text | untitled) (file | document | doc | tab):
    user.run_rpc_command("workbench.action.files.newUntitledFile")
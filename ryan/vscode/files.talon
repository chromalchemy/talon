app.name: Code
-

kill current file:
    user.vscode("andreas.removeFile")

(hunt |  open | hope and) (file  | filename) [<user.text>]: 
    key(cmd-p)
    sleep(100ms)
    insert("{text}")

(hunt |  open | hope and) (file  | filename) [<user.text>] pop: 
    key(cmd-p)
    sleep(100ms)
    insert("{text}")
    sleep(200ms)
    key(enter)

## +++++++++++++++++++++++++++++++++ file explorer

(show | reveal) file [in] [(explore | explorer)] | bar file: user.vscode("workbench.files.action.showActiveFileInExplorer")

(show | reveal) [file] [in] (finder | files): user.vscode("revealFileInOS")

(fold | collapse) (explore | Explorer) [(bar | view)] [folders]: user.vscode("workbench.files.action.collapseExplorerFolders")

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
    user.vscode("andreas.duplicateFile")

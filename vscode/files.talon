app.name: Code
-

(hunt |  open | hope and) (file  | filename) [<user.text>]: 
    key(cmd-p)
    sleep(100ms)
    insert("{text}")

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

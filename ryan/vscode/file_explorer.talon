app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

bar (file | files): 
    user.run_rpc_command("workbench.files.action.focusFilesExplorer")

(show | reveal) file [in] [(explore | explorer)]: 
    user.run_rpc_command("workbench.files.action.showActiveFileInExplorer")

(fold | collapse) ((explore | Explorer) [folders] | [bar] files): 
    user.run_rpc_command("workbench.files.action.collapseExplorerFolders")

(fold | collapse) ((explore | Explorer) [folders] | [bar] files) [to] top [level] [folders]: 
    user.run_rpc_command("workbench.files.action.collapseExplorerFolders")
    user.run_rpc_command("workbench.files.action.collapseExplorerFolders")

add folder to (workspace | work space | project):
    user.run_rpc_command("workbench.action.addRootFolder")
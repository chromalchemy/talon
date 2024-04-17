app.name: Code
-
## ++++++++++++++++ nav vscode windows .

pick (code | could) (window | winner | win) | pick [open] project: user.vscode("workbench.action.switchWindow")

(code | could) (swap | next | last) (window | winner | win):
    user.vscode("workbench.action.switchWindow")
    key(enter)
(swap | next | last) (code | could) (window | winner | win):
    user.vscode("workbench.action.switchWindow")
    key(enter)
(code | could) (window | winner | win) (swap | next | last):
    user.vscode("workbench.action.switchWindow")
    key(enter)


## ++++++++++++++++++++++++++ navigate projects.

#todo: make projects list

open project [in]  [new window]: user.vscode("projectManager.listProjectsNewWindow")

[open | go] get bit project [in]  [new window] | project get bit: 
    user.vscode("projectManager.listProjectsNewWindow")
    sleep(300ms)
    insert("gbo")
    sleep(100ms)
    key(enter)

[open | go] (Talon | talent) project [in]  [new window]  | project (Talon | talent | town): 
    user.vscode("projectManager.listProjectsNewWindow")
    sleep(300ms)
    insert("talon-user")
    sleep(100ms)
    key(enter)

[open | go] (ground | grounded | grounded sol | groundedsol | granted sol ) project [in]  [new window] | project (ground | grounded | grounded sol | groundedsol | granted sol ): 
    # user.run_rpc_command("projectManager.listProjectsNewWindow", "groundesol w biff")
    user.vscode("projectManager.listProjectsNewWindow")
    sleep(300ms)
    insert("groundesol")
    sleep(100ms)
    key(enter)

change project: user.vscode("projectManager.listProjects")

[(show | view | bar)] projects: user.vscode("projectsExplorerFavorites.focus")

app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-
## ++++++++++++++++ nav vscode windows .

pick (code | could) (window | winner | win | [open] project) | pick [open] project: user.run_rpc_command("workbench.action.switchWindow")

^(code | could) (swap | next | last) (window | winner | win)$:
    user.run_rpc_command("workbench.action.switchWindow")
    key(enter)
    
^(swap | next | last) (code | could) (window | winner | win)$:
    user.run_rpc_command("workbench.action.switchWindow")
    key(enter)
    
^(code | could) [(window | winner | win)] [(swap | next | last)]$:
    user.run_rpc_command("workbench.action.switchWindow")
    key(enter)


## ++++++++++++++++++++++++++ navigate projects.

#todo: make projects list

## +++++++++++++++++ open project

open project [in]  [new window]: 
    user.run_rpc_command("projectManager.listProjectsNewWindow")

## old vscode menu implementation to go to project
# user.run_rpc_command("projectManager.listProjectsNewWindow")
# sleep(300ms)
# insert("talon-user")
# sleep(100ms)
# key(enter)

##didnt work
# user.run_rpc_command("projectManager.listProjectsNewWindow", "talon-user") 


change project: 
    user.run_rpc_command("projectManager.listProjects")

[(show | view | bar)] projects: 
    user.run_rpc_command("projectsExplorerFavorites.focus")

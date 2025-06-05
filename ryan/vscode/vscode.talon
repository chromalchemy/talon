app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

(choose | pick) [color] theme:
    user.menu_select('Code|Settings…|Theme|Color Theme [⌘K ⌘T]')

restart ( lsp | ell es pee) [server]: 
    user.run_rpc_command("calva.clojureLsp.restart") 
    
please  (go | focus):
    key(cmd-shift-p)
    insert("view focus")

#settings
open (settings | sitting):  
    user.run_rpc_command("workbench.action.openSettings2")

open [user] (settings | sitting) (json | jay son): 
    user.run_rpc_command("workbench.action.openSettingsJson")

open workspace (settings | sitting) (json | jay son): 
    user.run_rpc_command("workbench.action.openWorkspaceSettingsFile")

browse (json | jason): 
    user.run_rpc_command("vscode-json-editor.start")

## ++++++++++++++++++++++++ which key menu
(which | witch | please) key:        
    user.run_rpc_command("whichkey.show")

## +++++++++++++++++++++++++ shortcuts .
(show | (open | hope in)) shortcuts:             
    user.run_rpc_command("workbench.action.openGlobalKeybindings")

show shortcuts json:        
    user.run_rpc_command("workbench.action.openGlobalKeybindingsFile")

## ++++++++++++++++++++++++++ snippets .

show snippets:              
    user.run_rpc_command("workbench.action.openSnippets")

## ++++++++++++++++++++++++ extensions .

check [for] extension updates | update extensions: 
    user.run_rpc_command("workbench.extensions.action.checkForUpdates")
    user.run_rpc_command("workbench.view.extensions")

(show | go) extension updates:
    user.run_rpc_command("workbench.extensions.action.extensionUpdates")

 ## ++++++++ vscode notification popups .
 
(dismiss | clear | hide | kill) (notifications |  alerts): 
    user.run_rpc_command("notifications.clearAll")

show (notifications |  alerts): 
    user.run_rpc_command("notifications.showList")

accept (notification | alert): 
    user.run_rpc_command("notification.acceptPrimaryAction")

## +++++++++++++++++++++++++ dark mode .

[toggle] [code] (dark | light) mode:
    user.run_rpc_command("workbench.action.toggleLightDarkThemes")
 

close unsaved file | close file without saving:
    user.run_rpc_command("workbench.action.closeActiveEditor")
    key(space)

open file in browser:
    user.run_rpc_command("openInDefaultBrowser.openInDefaultBrowser")

## ++++++++++ select quick open option .

# select Previous in Quick Open
(choose | pick) (previous | prev | last): 
    user.run_rpc_command("workbench.action.quickOpenSelectPrevious")
    
# Navigate Previous in Quick Open
please go (previous | prev | last): 
    user.vscode(workbench.action.quickOpenNavigatePrevious)

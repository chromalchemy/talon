app: vscode
-

(choose | pick) [color] theme:
    user.menu_select('Code|Settings…|Theme|Color Theme [⌘K ⌘T]')

restart ( lsp | ell es pee) [server]: 
    user.vscode("calva.clojureLsp.restart") 
    
please  (go | focus):
    key(cmd-shift-p)
    insert("view focus")

#settings
open (settings | sitting):  
    user.vscode("workbench.action.openSettings2")

open [user] (settings | sitting) (json | jay son): 
    user.vscode("workbench.action.openSettingsJson")

open workspace (settings | sitting) (json | jay son): 
    user.vscode("workbench.action.openWorkspaceSettingsFile")

browse (json | jason): 
    user.vscode("vscode-json-editor.start")

## ++++++++++++++++++++++++ which key menu
(which | witch | please) key:        
    user.vscode("whichkey.show")

## +++++++++++++++++++++++++ shortcuts .
(show | (open | hope in)) shortcuts:             
    user.vscode("workbench.action.openGlobalKeybindings")

show shortcuts json:        
    user.vscode("workbench.action.openGlobalKeybindingsFile")

## ++++++++++++++++++++++++++ snippets .

show snippets:              
    user.vscode("workbench.action.openSnippets")

## ++++++++++++++++++++++++ extensions .

check [for] extension updates | update extensions: 
    user.vscode("workbench.extensions.action.checkForUpdates")

(show | go) extension updates:
    user.vscode("workbench.extensions.action.extensionUpdates")

 ## ++++++++ vscode notification popups .
 
(dismiss | clear | hide | kill) (notifications |  alerts): 
    user.vscode("notifications.clearAll")

show (notifications |  alerts): 
    user.vscode("notifications.showList")

accept (notification | alert): 
    user.vscode("notification.acceptPrimaryAction")

## +++++++++++++++++++++++++ dark mode .

[toggle] [code] (dark | light) mode:
    user.vscode("workbench.action.toggleLightDarkThemes")
 

close unsaved file | close file without saving:
    user.vscode("workbench.action.closeActiveEditor")
    key(space)

open file in browser:
    user.vscode("openInDefaultBrowser.openInDefaultBrowser")

## ++++++++++ select quick open option .

# select Previous in Quick Open
(choose | pick) (previous | prev | last): 
    user.vscode("workbench.action.quickOpenSelectPrevious")
    
# Navigate Previous in Quick Open
please go (previous | prev | last): 
    user.vscode(workbench.action.quickOpenNavigatePrevious)
    
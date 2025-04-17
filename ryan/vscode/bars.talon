app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

## ++++++++++++++++++++++ activity bar .

[(toggle | show | hide | view | focus | go)] (activity | icons) bar [(toggle | show | hide | view)]: 
    user.run_rpc_command("workbench.action.toggleActivityBarVisibility")

## +++++++++++++++++++ primary sidebar .

(toggle | show | view) [left] (sidebar | bar) | [left] (bar | sidebar) (toggle | show) | bar left | left bar: 
    user.run_rpc_command("workbench.action.toggleSidebarVisibility")   

(close | hide) [left] (sidebar | bar) | bar [left] hide | left bar hide: 
    user.run_rpc_command("workbench.action.closeSidebar")

## ++++++++++ left / secondary sidebar .

right (sidebar | bar) | raper | bar right | (toggle | show) right (sidebar | bar) : 
    user.run_rpc_command("workbench.action.toggleAuxiliaryBar")
    
(close | hide) right (sidebar | bar) | bar right hide | right bar hide: 
    user.run_rpc_command("workbench.action.closeAuxiliaryBar")
 
## +++++++++++++++++++++++++++++ bottom panel .

[(toggle | show | view )] [bottom] panel [view]: 
    user.run_rpc_command("workbench.action.togglePanel")
    
panel (close | hide) | (close | hide) panel [view]: 
    user.run_rpc_command("workbench.action.closePanel")

## ++++++++++++++++++++++++++ full screen "zen" mode .

(go | toggle | enter | exit | leave) (in | then | zen | zend | full) mode | zen mode: 
    user.run_rpc_command("workbench.action.toggleZenMode")

## ++++++++++++++++++ toggle both left and right bars and panel visibility

#no such commands
# (show | open) [(both | all)] (bars | sidebars) | stuffed mode: 
#     user.run_rpc_command("workbench.action.openSidebar")
#     user.run_rpc_command("workbench.action.openAuxiliaryBar")

# (toggle | show | open) [left] (bars | sidebars) | (stuffed | thin | narrow) (view | mode): 
#     user.run_rpc_command("workbench.action.toggleSidebarVisibility")
#     user.run_rpc_command("workbench.action.toggleAuxiliaryBar")

## +++++++++++ show / toggle both bars .

(toggle | show | open) [both] (bars | sidebars) | (stuffed | thin | narrow | bar | bars ) (view | mode): 
    user.run_rpc_command("workbench.action.toggleSidebarVisibility")
    user.run_rpc_command("workbench.action.toggleAuxiliaryBar")

## ++++++++++++++++++++ hide both bars .

(hide | close) [both] (bars | sidebars) | (tab | tabs) wide | wide (view | mode): 
    user.run_rpc_command("workbench.action.closeSidebar")
    user.run_rpc_command("workbench.action.closeAuxiliaryBar")

# maximizes one group and minimizes others
group (expand | wide ) no bars | expand wide mode:
    user.run_rpc_command("workbench.action.minimizeOtherEditorsHideSidebar")

# toggles into current group shown, others hidden state
group full no bars | full wide mode: 
    user.run_rpc_command("workbench.action.maximizeEditorHideSidebar")
    

## ++++++++++++++++++ show bars and panel 

(show | open | toggle) [all] (views | bars | panels) | kit (view | mode):
    user.run_rpc_command("workbench.action.closeSidebar")
    user.run_rpc_command("workbench.action.closeAuxiliaryBar")
    user.run_rpc_command("workbench.action.closePanel") 
    sleep(200ms)
    user.run_rpc_command("workbench.action.toggleSidebarVisibility")
    user.run_rpc_command("workbench.action.toggleAuxiliaryBar")
    user.run_rpc_command("workbench.action.togglePanel")

## +++++++++++++++ hide bars and panel .

(hide | close) [all] (views | bars | panels) | (focus | show) [only] [on] (tab | tabs | editor | editors) | (focus | show) [only] on code | (focused | focus) (view | mode | win | window ): 
    user.run_rpc_command("workbench.action.closeSidebar")
    user.run_rpc_command("workbench.action.closeAuxiliaryBar")
    user.run_rpc_command("workbench.action.closePanel")    

## ++++++++++++++++++++ focus and snap .

focus [and] [snap] [(win | window)] <user.window_snap_position>:
    user.run_rpc_command("workbench.action.closeSidebar")
    user.run_rpc_command("workbench.action.closeAuxiliaryBar")
    user.run_rpc_command("workbench.action.closePanel")
    user.snap_window(window_snap_position)

## ++++++++++++ only left or right bar or panel .

only show left bar | left bar only | left mode:
    user.run_rpc_command("workbench.action.closeSidebar")
    user.run_rpc_command("workbench.action.closeAuxiliaryBar")
    user.run_rpc_command("workbench.action.closePanel")
    user.run_rpc_command("workbench.action.toggleSidebarVisibility")

only show right bar | right bar only | right mode:
    user.run_rpc_command("workbench.action.closeSidebar")
    user.run_rpc_command("workbench.action.closeAuxiliaryBar")
    user.run_rpc_command("workbench.action.closePanel")
    user.run_rpc_command("workbench.action.toggleAuxiliaryBar")

only show panel | panel only | panel mode:
    user.run_rpc_command("workbench.action.closeSidebar")
    user.run_rpc_command("workbench.action.closeAuxiliaryBar")
    user.run_rpc_command("workbench.action.closePanel")
    user.run_rpc_command("workbench.action.togglePanel")

## ++++++++++++ only left or right bar .

(left bar | bar left) and panel [only] | left panel (mode | view):
    user.run_rpc_command("workbench.action.closeSidebar")
    user.run_rpc_command("workbench.action.closeAuxiliaryBar")
    user.run_rpc_command("workbench.action.closePanel")
    user.run_rpc_command("workbench.action.toggleSidebarVisibility")
    user.run_rpc_command("workbench.action.togglePanel")

(right bar | bar right) [and] panel [only] | right panel (mode | view):
    user.run_rpc_command("workbench.action.closeSidebar")
    user.run_rpc_command("workbench.action.closeAuxiliaryBar")
    user.run_rpc_command("workbench.action.closePanel")
    user.run_rpc_command("workbench.action.toggleAuxiliaryBar")
    user.run_rpc_command("workbench.action.togglePanel")


## ++++++++++ open panels and snap max .
#just use command composition


## ++++++++++++++++++++++++ move panel .

[move] panel right: 
    user.run_rpc_command("workbench.action.positionPanelRight")

[move] panel left: 
    user.run_rpc_command("workbench.action.positionPanelLeft")

[move] panel (bottom | down | base): 
    user.run_rpc_command("workbench.action.positionPanelBottom")

## +++++++++++++++ resize  panels .

(panel | term | terminal) (max | min | regular | default): 
    user.run_rpc_command("workbench.action.toggleMaximizedPanel")

 ## +++++++++++++++++ vscode extensions .

bar (extension | extensions | plugins): 
    user.run_rpc_command("workbench.view.extensions")

move (view | widget): 
    user.run_rpc_command("workbench.action.moveView")

reset all view locations: 
    user.run_rpc_command("workbench.action.resetViewLocations")

## +++++++++++++++++++++ swap sidebars .

swap (bars | sidebars) :  
    user.run_rpc_command("workbench.action.toggleSidebarPosition")

## ++++++++++++++++++++++ output panel .

go output [panel]:  
    user.run_rpc_command("workbench.panel.output.focus")

show output channels:
    user.run_rpc_command("workbench.action.showOutputChannels")

clear output: 
    user.run_rpc_command("workbench.output.action.clearOutput")

toggle output:
    user.run_rpc_command("workbench.action.output.toggleOutput")

toggle output auto scroll:
    user.run_rpc_command("workbench.output.action.toggleAutoScroll")
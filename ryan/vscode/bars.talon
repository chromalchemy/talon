app: vscode
-

## ++++++++++++++++++++++ activity bar .

[(toggle | show | hide | view | focus | go)] (activity | icons) bar [(toggle | show | hide | view)]: 
    user.vscode("workbench.action.toggleActivityBarVisibility")

## +++++++++++++++++++ primary sidebar .

(toggle | show | view) [left] (sidebar | bar) | [left] (bar | sidebar) (toggle | show) | bar left | left bar: 
    user.vscode("workbench.action.toggleSidebarVisibility")   

(close | hide) [left] (sidebar | bar) | bar [left] hide | left bar hide: 
    user.vscode("workbench.action.closeSidebar")

## ++++++++++ left / secondary sidebar .

(right | chat) (sidebar | bar) | bar (right | chat) | (toggle | show) (right | chat) (sidebar | bar) : 
    user.vscode("workbench.action.toggleAuxiliaryBar")
    
(close | hide) right (sidebar | bar) | bar right hide | right bar hide: 
    user.vscode("workbench.action.closeAuxiliaryBar")
 
## +++++++++++++++++++++++++++++ bottom panel .

[(toggle | show | view )] [bottom] panel [view]: 
    user.vscode("workbench.action.togglePanel")
    
panel (close | hide) | (close | hide) panel [view]: 
    user.vscode("workbench.action.closePanel")

## ++++++++++++++++++++++++++ full screen "zen" mode .

(go | toggle | enter | exit | leave) (in | then | zen | zend | full) mode | zen mode: 
    user.vscode("workbench.action.toggleZenMode")

## ++++++++++++++++++ toggle both left and right bars and panel visibility

#no such commands
# (show | open) [(both | all)] (bars | sidebars) | stuffed mode: 
#     user.vscode("workbench.action.openSidebar")
#     user.vscode("workbench.action.openAuxiliaryBar")

# (toggle | show | open) [left] (bars | sidebars) | (stuffed | thin | narrow) (view | mode): 
#     user.vscode("workbench.action.toggleSidebarVisibility")
#     user.vscode("workbench.action.toggleAuxiliaryBar")


(toggle | show | open) [both] (bars | sidebars) | (stuffed | thin | narrow | bar | bars ) (view | mode): 
    user.vscode("workbench.action.toggleSidebarVisibility")
    user.vscode("workbench.action.toggleAuxiliaryBar")

(hide | close) [both] (bars | sidebars) | (tab | tabs) wide | wide (view | mode): 
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")

## ++++++++++++++++++ toggle bars and panel visibility

(show | open | toggle) [all] (views | bars | panels) | kit (view | mode):
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")
    user.vscode("workbench.action.closePanel") 
    sleep(200ms)
    user.vscode("workbench.action.toggleSidebarVisibility")
    user.vscode("workbench.action.toggleAuxiliaryBar")
    user.vscode("workbench.action.togglePanel")

(hide | close) [all] (views | bars | panels) | (focus | show) [only] [on] (tab | tabs | editor | editors) | (focus | show) [only] on code | (focused | focus) (view | mode | win | window ): 
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")
    user.vscode("workbench.action.closePanel")

## ++++++++++++++++++++ focus and snap .

focus [and] [snap] [(win | window)] <user.window_snap_position>:
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")
    user.vscode("workbench.action.closePanel")
    user.snap_window(window_snap_position)

## ++++++++++++ only left or right bar or panel .

only show left bar | left bar only | left mode:
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")
    user.vscode("workbench.action.closePanel")
    user.vscode("workbench.action.toggleSidebarVisibility")

only show right bar | right bar only | right mode:
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")
    user.vscode("workbench.action.closePanel")
    user.vscode("workbench.action.toggleAuxiliaryBar")

only show panel | panel only | panel mode:
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")
    user.vscode("workbench.action.closePanel")
    user.vscode("workbench.action.togglePanel")

## ++++++++++++ only left or right bar .

(left bar | bar left) and panel [only] | left panel (mode | view):
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")
    user.vscode("workbench.action.closePanel")
    user.vscode("workbench.action.toggleSidebarVisibility")
    user.vscode("workbench.action.togglePanel")

(right bar | bar right) [and] panel [only] | right panel (mode | view):
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")
    user.vscode("workbench.action.closePanel")
    user.vscode("workbench.action.toggleAuxiliaryBar")
    user.vscode("workbench.action.togglePanel")


## ++++++++++ open panels and snap max .
#just use command composition


## ++++++++++++++++++++++++ move panel .

[move] panel right: 
    user.vscode("workbench.action.positionPanelRight")

[move] panel left: 
    user.vscode("workbench.action.positionPanelLeft")

[move] panel (bottom | down | base): 
    user.vscode("workbench.action.positionPanelBottom")

## +++++++++++++++ resize  panels .

(panel | term | terminal) (max | min | regular | default): 
    user.vscode("workbench.action.toggleMaximizedPanel")

 ## +++++++++++++++++ vscode extensions .

bar (extension | extensions | plugins): 
    user.vscode("workbench.view.extensions")

move (view | widget): 
    user.vscode("workbench.action.moveView")

reset all view locations: 
    user.vscode("workbench.action.resetViewLocations")

## +++++++++++++++++++++ swap sidebars .

swap (bars | sidebars) :  
    user.vscode("workbench.action.toggleSidebarPosition")

## ++++++++++++++++++++++ output panel .

go output [panel]: 
    user.vscode("workbench.panel.output.focus")

show output channels:
    user.vscode("workbench.action.showOutputChannels")

clear output: 
    user.vscode("workbench.output.action.clearOutput")

toggle output:
    user.vscode("workbench.action.output.toggleOutput")

toggle output auto scroll:
    user.vscode("workbench.output.action.toggleAutoScroll")
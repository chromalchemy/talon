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

right (sidebar | bar) | bar right | (toggle | show) right (sidebar | bar) : 
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

(hide | close) [both] (bars | sidebars) | (tab | tabs) wide | wide (view | mode): 
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")

#no such commands
# (show | open) [(both | all)] (bars | sidebars) | stuffed mode: 
#     user.vscode("workbench.action.openSidebar")
#     user.vscode("workbench.action.openAuxiliaryBar")

(toggle | show | open) [both] (bars | sidebars) | (stuffed | thin | narrow) (view | mode): 
    user.vscode("workbench.action.toggleSidebarVisibility")
    user.vscode("workbench.action.toggleAuxiliaryBar")

## ++++++++++++++++++ toggle bars and panel visibility

(show | open | toggle) [all] (views | bars | panels) | kit (view | mode): 
    user.vscode("workbench.action.toggleSidebarVisibility")
    user.vscode("workbench.action.toggleAuxiliaryBar")
    user.vscode("workbench.action.togglePanel")

(hide | close) [all] (views | bars | panels) | (focus | show) [only] (tab | tabs | editor | editors) | (focused | focus) (view | mode): 
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")
    user.vscode("workbench.action.closePanel")

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
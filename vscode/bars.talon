app.name: Code
-
(bar | go) outline: user.vscode("outline.focus")

## ++++++++++++++++++++++ activity bar .

[(toggle | show | hide | view | focus | go)] (activity | icons) bar [(toggle | show | hide | view)]: 
    user.vscode("workbench.action.toggleActivityBarVisibility")

## +++++++++++++++++++ primary sidebar .

(toggle | show | view) [left] (sidebar | bar): user.vscode("workbench.action.toggleSidebarVisibility")   
[left] (bar | sidebar) (toggle | show): user.vscode("workbench.action.toggleSidebarVisibility")
[left] (sidebar | bar) hide: user.vscode("workbench.action.closeSidebar")
hide [left] (sidebar | bar): user.vscode("workbench.action.closeSidebar")

## ++++++++++ left / secondary sidebar .

(toggle | show | hide | view) right (sidebar | bar): user.vscode("workbench.action.toggleAuxiliaryBar")

right (sidebar | bar) (toggle | show | hide): user.vscode("workbench.action.toggleAuxiliaryBar")

## +++++++++++++++++++++++++++++ bottom panel .

(toggle | show | hide | view | close) [bottom] panel: user.vscode("workbench.action.togglePanel")
panel (close | toggle | show | hide | view): user.vscode("workbench.action.togglePanel")

## ++++++++++++++++++++++++++ zen mode .
## ++++++++++++++++++ toggle bars and panel visibility
    

(go | toggle | enter | exit | leave) (in | then | zen | zend | full) mode | zen mode: user.vscode("workbench.action.toggleZenMode")

(hide | close) [(both | all)] (bars | sidebars) | wide (view | mode) | (tab | tabs) wide: 
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")

(show | open | toggle) [(both | all)] (bars | sidebars) | stuffed mode: 
    user.vscode("workbench.action.toggleSidebarVisibility")
    user.vscode("workbench.action.toggleAuxiliaryBar")
    
(hide | close) [all] views | focused (view | mode) | focus (tab | tabs | file): 
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")
    user.vscode("workbench.action.closePanel")
    
(show | open | toggle) [all] views | kit mode: 
    user.vscode("workbench.action.toggleSidebarVisibility")
    user.vscode("workbench.action.toggleAuxiliaryBar")
    user.vscode("workbench.action.togglePanel")

## ++++++++++++++++++++++++ move panel .

[move] panel right: user.vscode("workbench.action.positionPanelRight")
[move] panel left: user.vscode("workbench.action.positionPanelLeft")
[move] panel (bottom | down.): user.vscode("workbench.action.positionPanelBottom")

## +++++++++++++++ resize  panels .

(panel | term | terminal) (max | min | regular | default): user.vscode("workbench.action.toggleMaximizedPanel")

 ## +++++++++++++++++ vscode extensions .

bar (extension | extensions | plugins): user.vscode("workbench.view.extensions")

move (view | widget): user.vscode("workbench.action.moveView")

reset all view locations: user.vscode("workbench.action.resetViewLocations")

## +++++++++++++++++++++ swap sidebars .

swap (bars | sidebars) :  user.vscode("workbench.action.toggleSidebarPosition")

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
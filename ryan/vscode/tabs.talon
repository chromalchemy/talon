app.name: Code
-

(tab | editor | column) (close | clothes):
    user.vscode("workbench.action.closeActiveEditor")

## +++++++++++++++++++++++ pin editors .

pin (editor | tab):
    user.vscode("workbench.action.pinEditor")

unpin (editor | tab):
    user.vscode("workbench.action.unpinEditor")

close (pinned  |  pin) (editor | tab):
    user.vscode("workbench.action.closeActivePinnedEditor")
 
(isolate | separate | join | flatten) (pinned | pin) (editors | tabs | editor tabs):
    user.vscode("workbench.action.toggleSeparatePinnedEditorTabs")


#------------ nav to recently used editors

pop back | go back used [(editor | tab)]: 
    user.vscode("workbench.action.openPreviousRecentlyUsedEditor")

pop forward | go (next | forward | for) used [(editor | tab)] : 
    user.vscode("workbench.action.openNextRecentlyUsedEditor")

(pop back | go back used [(editor | tab)]) group: 
    user.vscode("workbench.action.openPreviousRecentlyUsedEditorInGroup")

(pop forward | go (next | forward | for) used) group: 
    user.vscode("workbench.action.openNextRecentlyUsedEditorInGroup")

(open | pick [open]) [(closed | close)] (tab | editor):
    user.vscode("workbench.action.quickOpenPreviousRecentlyUsedEditor")


## +++++++++++++++++++ merge tab groups .

(join | merge) (editor | tab | tabs | editors) [(in group | inside)]: 
    user.vscode("workbench.action.joinEditorInGroup")

(join | merge) [(editor | tab)] (groups | group [with] next) : 
    user.vscode("workbench.action.joinTwoGroups")

(join | merge) [(editor | tab)] all (groups | tabs): 
    user.vscode("workbench.action.joinAllGroups")
    

## +++++++ expand and minimize editors .

increase group width | group (widen | wider | fatter): 
    user.vscode("workbench.action.increaseViewWidth")

decrease group width | group (thin | thinner | slimmer): 
    user.vscode("workbench.action.decreaseViewWidth")

(expand | widen) group | group (max | wide): 
    user.vscode("workbench.action.minimizeOtherEditors")

(expand | widen) [(editor | tab)] group [and] hide (bars | sidebars | bar | sidebar) | [(editor | tab)] group full | hide other [(editor | tab)] groups: 
    user.vscode("workbench.action.maximizeEditorHideSidebar")

(toggle | flip | reset) [(editor | tab)] (group | groups) [(size | sizes | width | widths  | with)]: 
    user.vscode("workbench.action.toggleEditorWidths")

## ++++++++++++++++++++++++ close tabs .

close (saved | safe) (tabs | editors): user.vscode("workbench.action.closeUnmodifiedEditors")

close other (tabs | editors) [in] [group] : user.vscode("workbench.action.closeOtherEditors")

(open | reopen) [last] closed (tab | editor): user.vscode("workbench.action.reopenClosedEditor")

## ++++++++++++++++++++ navigation .

## +++++++++++++++++++++++++++ vscode tab nav .
# basic tab nav in community core (tab last)

#prefer andreas panel
#user.vscode("workbench.files.action.focusOpenEditorsView")

## ++++++++++++++ andreas tab nav  .

#open editors/tabs sidebar
(bar | show | go | focus | list)  (tabs | taps | editors | [tab] groups | open files) [view]: 
    user.vscode("andreas.tabs.focus")
    
[(focus | go)] tab {self.letter} [{self.letter}]:
    user.run_rpc_command("andreas.focusTab", "{letter_1}{letter_2 or ''}")

#being overridden by keys without prefix
[(focus | go)] tab <number>:
    myNum = number - 1
    user.run_rpc_command("andreas.openEditorAtIndex", number)

## +++++++++++++++++++++++++ vscode group nav .

please (go | focus) [tab] group:
    key(cmd-shift-p)
    sleep(200ms)
    insert("view focus group")

(focus | go) (editor | tab | group): 
    user.vscode("workbench.action.focusActiveEditorGroup")

[(focus | go)] walk [(editor | tab | tap)] group: user.vscode("workbench.action.navigateEditorGroups")

(focus | go) last [(editor | tab | tap)] group:
    user.vscode("vscode-dynamic-layouts.focusPreviousGroup")
    # user.vscode("workbench.action.focusPreviousGroup")

(focus | go) next [(editor | tab | tap)] group:
    user.vscode("vscode-dynamic-layouts.focusNextGroup")
    # user.vscode("workbench.action.focusNextGroup")


## ++++++++++++++++++++++++ split tab in place.

split (editor | tab) (in group | inside):      
    user.vscode("workbench.action.toggleSplitEditorInGroup")

#generic splits

split (editor | tab) [(ortho | orthogonal | vertically | vertical | vert | tall)] | [(editor | tab)] (ortho | orthogonal | vertically | vertical | vert):         
    user.vscode("workbench.action.splitEditorOrthogonal")

split (editor | tab) (horizontally | horizontal | horizon | lateral | laterally | wide):       
    user.vscode("workbench.action.splitEditor")

## directional splits

split [(editor | tab)] up:            
    user.vscode("workbench.action.splitEditorUp")

split [(editor | tab)] down:          
    user.vscode("workbench.action.splitEditorDown")

Split [(editor | tab)] left:          
    user.vscode("workbench.action.splitEditorLeft")

split [(editor | tab)] (right | rite):         
    user.vscode("workbench.action.splitEditorRight")

 ## +++++++++++++ shuffle tabs in group .

(editor | tab) ((shuffle | shift) (right | rite) | push) [in group]: user.vscode("workbench.action.moveEditorRightInGroup")

(editor | tab) ((shuffle | shift) left | pull) [in group]: user.vscode("workbench.action.moveEditorLeftInGroup")

 ## +++++++++ move tab group .

(send | move) [(editor | tab)] group right: user.vscode("workbench.action.moveActiveEditorGroupRight")
(send | move) [(editor | tab)] group left: user.vscode("workbench.action.moveActiveEditorGroupLeft")
(send | move) [(editor | tab)] group up: user.vscode("workbench.action.moveActiveEditorGroupUp")
(send | move) [(editor | tab)] group down: user.vscode("workbench.action.moveActiveEditorGroupDown")

 ## +++++++++ move tab to another group .

move (editor | tab): 
    key(cmd-shift-p)
    insert("view move editor") 

^[(send | move)] (editor | tab) [to] (right | rite) [group]$: 
    user.vscode("workbench.action.moveEditorToRightGroup")

^[(send | move)] (editor | tab) [to] left [group]$: 
    user.vscode("workbench.action.moveEditorToLeftGroup")

^[(send | move)] (editor | tab) ([to] above | up) [group]$: 
    user.vscode("workbench.action.moveEditorToAboveGroup")

^[(send | move)] (editor | tab) ([to]  below | down) [group]$: 
    user.vscode("workbench.action.moveEditorToBelowGroup")

^[(send | move)] (editor | tab) to  first [group]$: 
    user.vscode("workbench.action.moveEditorToFirstGroup")

^[(send | move)] (editor | tab) to end [group]$: 
    user.vscode("workbench.action.moveEditorToLastGroup")

^[(send | move)] (editor | tab) to  last [group]$: 
    user.vscode("workbench.action.moveEditorToPreviousGroup")

^[(send | move)] (editor | tab) to  next [group]$: 
    user.vscode("workbench.action.moveEditorToNextGroup")

## ++++++++++++++++++++++++++++ split tab to another group

please split (editor | tab): 
    key(cmd-shift-p)
    insert("view split editor") 

split [(editor | tab)] (to | too | two) (right | rite) [group]: 
    user.vscode("workbench.action.splitEditorToRightGroup")

split [(editor | tab)] (to | too | two) left [group]: 
    user.vscode("workbench.action.splitEditorToLeftGroup")

split [(editor | tab)] (to | too | two) (above | up | top) [group]: 
    user.vscode("workbench.action.splitEditorToAboveGroup")

split [(editor | tab)] (to | too | two) (below | down | bottom) [group]: 
    user.vscode("workbench.action.splitEditorToBelowGroup")

split [(editor | tab)] (to | too | two) first [group]: 
    user.vscode("workbench.action.splitEditorToFirstGroup")

split [(editor | tab)] (to | too | two) end [group]: 
    user.vscode("workbench.action.splitEditorToLastGroup")

split [(editor | tab)] (to | too | two) last [group]: 
    user.vscode("workbench.action.splitEditorToPreviousGroup")

split [(editor | tab)] (to | too | two) next [group]: 
    user.vscode("workbench.action.splitEditorToNextGroup")

split [(editor | tab)] [to] (right | rite) [group]:
    user.vscode("workbench.action.splitEditorToNextGroup")


new [text]  (editor | draft):
    user.vscode("workbench.action.files.newUntitledFile")
    
(exit | dispose | trash | kill) [text] (editor | draft):
    user.vscode("workbench.action.closeActiveEditor")
    sleep(200ms)
    key(space)



    
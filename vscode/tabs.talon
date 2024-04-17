app.name: Code
-

## +++++++++++++++++++++++ pin editors .

pin (editor | tab):
    user.vscode("workbench.action.pinEditor")

unpin (editor | tab):
    user.vscode("workbench.action.unpinEditor")

close (pinned  |  pin) (editor | tab):
    user.vscode("workbench.action.closeActivePinnedEditor")
 
(isolate | separate | join | flatten) (pinned | pin) (editors | tabs | editor tabs):
    user.vscode("workbench.action.toggleSeparatePinnedEditorTabs")

## ++++++++++++++++++++++ focus editor .

(focus | go) (editor | tab): 
    user.vscode("workbench.action.focusActiveEditorGroup")
    
please (go | focus) (editor | tab):
    key(cmd-shift-p)
    sleep(200ms)
    insert("view focus editor")

please  (go | focus) [tab] group:
    key(cmd-shift-p)
    sleep(200ms)
    insert("view focus group")

(tab | editor | column) (close | clothes): key(cmd-w)


#------------ traverse recently used editors

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

(join | merge) [(editor | tab)] groups: 
    user.vscode("workbench.action.joinAllGroups")

(join | merge) [(editor | tab)] group with next : 
    user.vscode("workbench.action.joinTwoGroups")


## +++++++ expand and minimize editors .

expand group | group max: 
    user.vscode("workbench.action.minimizeOtherEditors")

expand [(editor | tab)] group [and] hide (bars | sidebars | bar | sidebar) | [(editor | tab)] group full | hide other [(editor | tab)] groups: 
    user.vscode("workbench.action.maximizeEditorHideSidebar")

(toggle | flip | reset) [(editor | tab)] group (size | sizes): 
    user.vscode("workbench.action.toggleEditorWidths")

## ++++++++++++++++++++++++ close tabs .

close (saved | safe) (tabs | editors): user.vscode("workbench.action.closeUnmodifiedEditors")

close other (tabs | editors) [in] [group] : user.vscode("workbench.action.closeOtherEditors")

(open | reopen) [last] closed (tab | editor): user.vscode("workbench.action.reopenClosedEditor")


#tab navigation

# select tab via sidebar

go (next | last) [(editor | tab | tap)] group: user.vscode("workbench.action.navigateEditorGroups")

#user.vscode("workbench.files.action.focusOpenEditorsView")

## ++++++++++++++ andreas tab nav commands .

#open editors/tabs sidebar
(bar | show | go | focus | list)  (tabs | taps | editors | [tab] groups | open files) [view]: 
    user.vscode("andreas.tabs.focus")
    
[(focus | go)] tab {self.letter} [{self.letter}]:
    user.run_rpc_command("andreas.focusTab", "{letter_1}{letter_2 or ''}")

[(focus | go)] tab <number>:
    myNum = number - 1
    user.run_rpc_command("andreas.openEditorAtIndex", number)

## ++++++++++++++++++++++++ split tab in place.

split [(editor | tab)] [in group]:      user.vscode("workbench.action.toggleSplitEditorInGroup")

split (editor | tab) up:            user.vscode("workbench.action.splitEditorUp")
Split [(editor | tab)] left:          user.vscode("workbench.action.splitEditorLeft")
split [(editor | tab)] right:         user.vscode("workbench.action.splitEditorRight")

split (editor | tab) [(horizontally | horizontal)]:               user.vscode("workbench.action.splitEditor")
split (editor | tab) (down  | vertically | vertical):          user.vscode("workbench.action.splitEditorDown")
split [(editor | tab)] (ortho | orthogonal | other) :         user.vscode("workbench.action.splitEditorOrthogonal")

 ## ++++++++ split tab to (another?) group .

split [(editor | tab)] to right [group]:      user.vscode("workbench.action.splitEditorToRightGroup")
split [(editor | tab)] to left [group]:      user.vscode("workbench.action.splitEditorToLeftGroup")
split [(editor | tab)] [to] next [group]:       user.vscode("workbench.action.splitEditorToNextGroup")

split [(editor | tab)] [to] first [group]:      user.vscode("workbench.action.splitEditorToFirstGroup")
split [(editor | tab)] [to] last [group]:       user.vscode("workbench.action.splitEditorToLastGroup")

split [(editor | tab)] [to] above [group]:      user.vscode("workbench.action.splitEditorToAboveGroup")
split [(editor | tab)] [to] below [group]:      user.vscode("workbench.action.splitEditorToBelowGroup")

 ## +++++++++++++ shuffle tabs in group .

[(shuffle | shift | push)] (editor | tab) (right | rite) [in group]: user.vscode("workbench.action.moveEditorRightInGroup")

[pull] [(shuffle | shift)] (editor | tab) left [in group]: user.vscode("workbench.action.moveEditorLeftInGroup")

 ## +++++++++ move tab group .

(send | move) (editor | tab) group right: user.vscode("workbench.action.moveActiveEditorGroupRight")
(send | move) (editor | tab) group left: user.vscode("workbench.action.moveActiveEditorGroupLeft")
(send | move) (editor | tab) group up: user.vscode("workbench.action.moveActiveEditorGroupUp")
(send | move) (editor | tab) group down: user.vscode("workbench.action.moveActiveEditorGroupDown")

 ## +++++++++ move tab to another group .

move (editor | tab): 
    key(cmd-shift-p)
    insert("view move editor") 

(send | move) (editor | tab) [to] right [group]: user.vscode("workbench.action.moveEditorToRightGroup")
(send | move) (editor | tab) [to] left [group]: user.vscode("workbench.action.moveEditorToLeftGroup")
(send | move) (editor | tab) ([to] above | up) [group]: user.vscode("workbench.action.moveEditorToAboveGroup")
(send | move) (editor | tab) ([to]  below | down) [group]: user.vscode("workbench.action.moveEditorToBelowGroup")
(send | move) (editor | tab) [to]  first [group]: user.vscode("workbench.action.moveEditorToFirstGroup")
(send | move) (editor | tab) [to]  last [group]: user.vscode("workbench.action.moveEditorToLastGroup")
(send | move) (editor | tab) [to]  (previous | prev) [group]: user.vscode("workbench.action.moveEditorToPreviousGroup")
(send | move) (editor | tab) [to]  next [group]: user.vscode("workbench.action.moveEditorToNextGroup")

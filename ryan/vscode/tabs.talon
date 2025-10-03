app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

# please tab: key(cmd-p)
# please tab <user.text>:
#     key(cmd-p)
#     sleep(100ms)
#     insert(text) 

## +++++++++++++++++++++++++++ vscode tab nav .
# basic tab nav in community core (tab last)

## +++++++++++++++++++++++++ open tabs .

quick open tab: 
    user.run_rpc_command("workbench.action.quickOpenPreviousRecentlyUsedEditor")
    
(pic| pick) (open [(tab | tabs | editor | editors)] | [open] (tab | tabs | editor)) [<user.text>]:
    user.run_rpc_command("opened-editors.openedEditors")
    sleep(100ms)
    insert(text)

go [open] (tab | editor) <user.text>:
    user.run_rpc_command("opened-editors.openedEditors")
    sleep(100ms)
    insert(text)
    sleep(100ms)
    key(enter)

# open last closed tab
(open | reopen) [last] (closed | close) (tab | editor): 
    user.run_rpc_command("workbench.action.reopenClosedEditor")

##### open recently used tab

# go last recently used tab
pop back | go back used [(editor | tab)]: 
    user.run_rpc_command("workbench.action.openPreviousRecentlyUsedEditor")

# go next recently used tab 
pop (forward | fore | four) | go (next | forward | for) used [(editor | tab)] : 
    user.run_rpc_command("workbench.action.openNextRecentlyUsedEditor")

##### in group

# go last recently used tab in group
(pop back | go back used [(editor | tab)]) [in] group: 
    user.run_rpc_command("workbench.action.openPreviousRecentlyUsedEditorInGroup")

# go next recently used tab in group
(pop (forward | fore | four) | go (next | forward | for) used [(editor | tab)]) [in] group: 
    user.run_rpc_command("workbench.action.openNextRecentlyUsedEditorInGroup")

######## pick to open, 

# cannot fuzzy filter quickOpen panels

# pick from recently used (open) tabs; 
(pick | choose) [open] [(used | recent)] (tab | editor):
    user.run_rpc_command("workbench.action.quickOpenPreviousRecentlyUsedEditor")

# pick from history of tabs (open or closed)
(pick | choose) ((closed | close) (tab | tabs | editor) | [from] (tab | editor) history): 
    user.run_rpc_command("workbench.action.openPreviousEditorFromHistory")

# pick from least used (open) tab in group
(pop | go) least (used | use) (tab | editor) [in] group: 
    user.run_rpc_command("workbench.action.quickOpenLeastRecentlyUsedEditorInGroup")

############## toggle btw current and last used 

pop tab:
    user.run_rpc_command("workbench.action.quickOpenPreviousRecentlyUsedEditor")
    sleep(50ms) 
    key(enter)

pop tab [in] group:
    user.run_rpc_command("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
    sleep(50ms) 
    key(enter)
    
## +++++++++++++++++++++++++ close tab(s) .

(tab | editor | column) (close | clothes):
    user.run_rpc_command("workbench.action.closeActiveEditor")

(tab | editor | column) (close | clothes) (force | without saving) | (chuck | discard) (tab | editor) :
    user.run_rpc_command("workbench.action.closeActiveEditor")
    sleep(100ms)
    key(space)

close (pinned  |  pin) (editor | tab):
    user.run_rpc_command("workbench.action.closeActivePinnedEditor")

close (saved | safe) (tabs | editors): 
    user.run_rpc_command("workbench.action.closeUnmodifiedEditors")

close other (tabs | editors) [in] [group] : 
    user.run_rpc_command("workbench.action.closeOtherEditors")

close all [group] (tabs | editors) [in] [group] : 
    user.run_rpc_command("workbench.action.closeEditorsInGroup")
     
## +++++++++++++++++++++++ pin editors .

pin (editor | tab):
    user.run_rpc_command("workbench.action.pinEditor")

unpin (editor | tab):
    user.run_rpc_command("workbench.action.unpinEditor")

(isolate | separate | join | flatten) (pinned | pin) (editors | tabs | editor tabs):
    user.run_rpc_command("workbench.action.toggleSeparatePinnedEditorTabs")

## +++++++++++++++++++++ close group .

close group | group close:
    user.run_rpc_command("workbench.action.closeEditorsAndGroup")

## ++++++++++++++++++++++++ lock group .

toggle group lock: 
    user.run_rpc_command("workbench.action.toggleEditorGroupLock")

unlock group:
    user.run_rpc_command("workbench.action.unlockEditorGroup")

lock group:
    user.run_rpc_command("workbench.action.lockEditorGroup")

## +++++++++++++++++++ merge tab groups .

(join | merge) (editor | tab | tabs | editors) [(in group | inside)]: 
    user.run_rpc_command("workbench.action.joinEditorInGroup")

(join | merge) [(editor | tab)] (groups | group [with] next) : 
    user.run_rpc_command("workbench.action.joinTwoGroups")

(join | merge) [(editor | tab)] all (groups | tabs): 
    user.run_rpc_command("workbench.action.joinAllGroups")
    

## +++++++ expand and minimize editors .

increase group width  | group width up | group (widen | wider | fatter): 
    user.run_rpc_command("workbench.action.increaseViewWidth")

decrease group width | group width down | group (thin | thinner | slimmer): 
    user.run_rpc_command("workbench.action.decreaseViewWidth")

(expand) group | group (max | wide | expand): 
    user.run_rpc_command("workbench.action.minimizeOtherEditors")

[toggle] (group full | grateful) | exit (group full | grateful): 
    user.run_rpc_command("workbench.action.toggleMaximizeEditorGroup")

(toggle | flip | reset) [(editor | tab)] (group | groups) [(size | sizes | width | widths  | with)]: 
    user.run_rpc_command("workbench.action.toggleEditorWidths")

(reset | restore | default | even) (group | groups) (size | sizes | width | widths  | with):
    user.run_rpc_command("workbench.action.evenEditorWidths")


(increase | add) (group | groups | tab | view) (size | sizes | width | widths | with) | (group | groups | tab | view) (wider | widen | more | fatter | fatten) |  (decrease | less) (sidebar | bar) (size | sizes | width | widths | with) | (sidebar | bar) (thinner | narrower | narrow | thin):
    user.run_rpc_command("workbench.action.increaseViewSize")

(decrease | less) (group | groups | tab | view) (size | sizes | width | widths | with) | (group | groups | tab | view) (thinner | narrower | narrow | thin) |  (increase | add) (sidebar | bar) (size | sizes | width | widths | with) | (sidebar | bar) (wider | widen | more | fatter | fatten):
    user.run_rpc_command("workbench.action.decreaseViewSize")


## ++++++++++++++ andreas tab nav  .

#prefer andreas panel
#user.run_rpc_command("workbench.files.action.focusOpenEditorsView")

#open editors/tabs sidebar
(bar | show | go | focus | list)  (tabs | taps | editors | [tab] groups | open files) [view]: 
    user.run_rpc_command("andreas.tabs.focus")
    
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
    user.run_rpc_command("workbench.action.focusActiveEditorGroup")

[(focus | go)] walk [(editor | tab | tap)] group: user.run_rpc_command("workbench.action.navigateEditorGroups")

(focus | go) last [(editor | tab | tap)] group:
    user.run_rpc_command("vscode-dynamic-layouts.focusPreviousGroup")
    # user.run_rpc_command("workbench.action.focusPreviousGroup")

(focus | go) next [(editor | tab | tap)] group:
    user.run_rpc_command("vscode-dynamic-layouts.focusNextGroup")
    # user.run_rpc_command("workbench.action.focusNextGroup")


## ++++++++++++++++++++++++ split tab in place.

split (editor | tab) (in group | inside):      
    user.run_rpc_command("workbench.action.toggleSplitEditorInGroup")

#generic splits

split (editor | tab) [(ortho | orthogonal | vertically | vertical | vert | tall)] | [(editor | tab)] (ortho | orthogonal | vertically | vertical | vert):         
    user.run_rpc_command("workbench.action.splitEditorOrthogonal")

split (editor | tab) (horizontally | horizontal | horizon | lateral | laterally | wide):       
    user.run_rpc_command("workbench.action.splitEditor")

## directional splits

split [(editor | tab)] up:            
    user.run_rpc_command("workbench.action.splitEditorUp")

split [(editor | tab)] down:          
    user.run_rpc_command("workbench.action.splitEditorDown")

Split [(editor | tab)] left:          
    user.run_rpc_command("workbench.action.splitEditorLeft")

split [(editor | tab)] (right | rite):         
    user.run_rpc_command("workbench.action.splitEditorRight")

 ## +++++++++++++ shuffle tabs in group .

(editor | tab) ((shuffle | shift) (right | rite) | push) [in group]: user.run_rpc_command("workbench.action.moveEditorRightInGroup")

(editor | tab) ((shuffle | shift) left | pull) [in group]: user.run_rpc_command("workbench.action.moveEditorLeftInGroup")

 ## +++++++++ move tab group .

(send | move) [(editor | tab)] group right: 
    user.run_rpc_command("workbench.action.moveActiveEditorGroupRight")

(send | move) [(editor | tab)] group left: 
    user.run_rpc_command("workbench.action.moveActiveEditorGroupLeft")

(send | move) [(editor | tab)] group up: 
    user.run_rpc_command("workbench.action.moveActiveEditorGroupUp")

(send | move) [(editor | tab)] group down: 
    user.run_rpc_command("workbench.action.moveActiveEditorGroupDown")

 ## +++++++++ move tab to another group .

move (editor | tab): 
    key(cmd-shift-p)
    insert("view move editor") 

^[(send | move)] (editor | tab) [to] (right | rite) [group]$: 
    user.run_rpc_command("workbench.action.moveEditorToRightGroup")

^[(send | move)] ((editor | tab) [to] left | tablet) [group]$: 
    user.run_rpc_command("workbench.action.moveEditorToLeftGroup")

^[(send | move)] (editor | tab) ([to] above | up) [group]$: 
    user.run_rpc_command("workbench.action.moveEditorToAboveGroup")

^[(send | move)] (editor | tab) ([to]  below | down) [group]$: 
    user.run_rpc_command("workbench.action.moveEditorToBelowGroup")

^[(send | move)] (editor | tab) to  first [group]$: 
    user.run_rpc_command("workbench.action.moveEditorToFirstGroup")

^[(send | move)] (editor | tab) to end [group]$: 
    user.run_rpc_command("workbench.action.moveEditorToLastGroup")

^[(send | move)] (editor | tab) to  last [group]$: 
    user.run_rpc_command("workbench.action.moveEditorToPreviousGroup")

^[(send | move)] (editor | tab) to  next [group]$: 
    user.run_rpc_command("workbench.action.moveEditorToNextGroup")

## ++++++++++++++++++++++++++++ split tab to another group

please split (editor | tab): 
    key(cmd-shift-p)
    insert("view split editor") 

split [(editor | tab)] (to | too | two) (right | rite) [group]: 
    user.run_rpc_command("workbench.action.splitEditorToRightGroup")

split [(editor | tab)] (to | too | two) left [group]: 
    user.run_rpc_command("workbench.action.splitEditorToLeftGroup")

split [(editor | tab)] (to | too | two) (above | up | top) [group]: 
    user.run_rpc_command("workbench.action.splitEditorToAboveGroup")

split [(editor | tab)] (to | too | two) (below | down | bottom) [group]: 
    user.run_rpc_command("workbench.action.splitEditorToBelowGroup")

split [(editor | tab)] (to | too | two) first [group]: 
    user.run_rpc_command("workbench.action.splitEditorToFirstGroup")

split [(editor | tab)] (to | too | two) end [group]: 
    user.run_rpc_command("workbench.action.splitEditorToLastGroup")

split [(editor | tab)] (to | too | two) last [group]: 
    user.run_rpc_command("workbench.action.splitEditorToPreviousGroup")

split [(editor | tab)] (to | too | two) next [group]: 
    user.run_rpc_command("workbench.action.splitEditorToNextGroup")

split [(editor | tab)] [to] (right | rite) [group]:
    user.run_rpc_command("workbench.action.splitEditorToNextGroup")

## +++++++++++++++++++++++++++++ draft .

new [text]  (editor | draft):
    user.run_rpc_command("workbench.action.files.newUntitledFile")
    
(exit | dispose | trash | kill) [text] (editor | draft):
    user.run_rpc_command("workbench.action.closeActiveEditor")
    sleep(200ms)
    key(space)

## +++++++++ hide/show tabs in groups .

show tabs | [show] (multiple | multi) tabs:
    user.run_rpc_command("workbench.action.showMultipleEditorTabs")

# bug?  does the same as hide
[show] single tab:
    user.run_rpc_command("workbench.action.showEditorTab")

(fold | hide) tabs | single tab:
    user.run_rpc_command("workbench.action.hideEditorTabs")

    
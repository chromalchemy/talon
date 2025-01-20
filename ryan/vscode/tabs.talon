app.name: Code
app.name: Cursor
app.name: Windsurf
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
    user.vscode("workbench.action.quickOpenPreviousRecentlyUsedEditor")
    
(pic| pick) open [(tab | tabs | editor | editors)] [<user.text>]:
    user.vscode("opened-editors.openedEditors")
    sleep(100ms)
    insert(text)

(pic| pick) [open] (tab | tabs | editor) [<user.text>]:
    user.vscode("opened-editors.openedEditors")
    sleep(100ms)
    insert(text)

(pic| pick) [open] (tab | editor) [<user.text>] pop:
    user.vscode("opened-editors.openedEditors")
    sleep(100ms)
    insert(text)
    sleep(100ms)
    key(enter)

# open last closed tab
(open | reopen) [last] (closed | close) (tab | editor): 
    user.vscode("workbench.action.reopenClosedEditor")

##### open recently used tab

# go last recently used tab
pop back | go back used [(editor | tab)]: 
    user.vscode("workbench.action.openPreviousRecentlyUsedEditor")

# go next recently used tab 
pop (forward | fore | four) | go (next | forward | for) used [(editor | tab)] : 
    user.vscode("workbench.action.openNextRecentlyUsedEditor")

##### in group

# go last recently used tab in group
(pop back | go back used [(editor | tab)]) [in] group: 
    user.vscode("workbench.action.openPreviousRecentlyUsedEditorInGroup")

# go next recently used tab in group
(pop (forward | fore | four) | go (next | forward | for) used [(editor | tab)]) [in] group: 
    user.vscode("workbench.action.openNextRecentlyUsedEditorInGroup")

######## pick to open, 

# cannot fuzzy filter quickOpen panels

# pick from recently used (open) tabs; 
(pick | choose) [open] [(used | recent)] (tab | editor):
    user.vscode("workbench.action.quickOpenPreviousRecentlyUsedEditor")

# pick from history of tabs (open or closed)
(pick | choose) ((closed | close) (tab | tabs | editor) | [from] (tab | editor) history): 
    user.vscode("workbench.action.openPreviousEditorFromHistory")

# pick from least used (open) tab in group
(pop | go) least (used | use) (tab | editor) [in] group: 
    user.vscode("workbench.action.quickOpenLeastRecentlyUsedEditorInGroup")

############## toggle btw current and last used 

pop tab:
    user.vscode("workbench.action.quickOpenPreviousRecentlyUsedEditor")
    sleep(50ms) 
    key(enter)

pop tab [in] group:
    user.vscode("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
    sleep(50ms) 
    key(enter)
    
## +++++++++++++++++++++++++ close tab(s) .

(tab | editor | column) (close | clothes):
    user.vscode("workbench.action.closeActiveEditor")

(tab | editor | column) (close | clothes) (force | without saving) | (chuck | discard) (tab | editor) :
    user.vscode("workbench.action.closeActiveEditor")
    sleep(100ms)
    key(space)

close (pinned  |  pin) (editor | tab):
    user.vscode("workbench.action.closeActivePinnedEditor")

close (saved | safe) (tabs | editors): 
    user.vscode("workbench.action.closeUnmodifiedEditors")

close other (tabs | editors) [in] [group] : 
    user.vscode("workbench.action.closeOtherEditors")

close all [group] (tabs | editors) [in] [group] : 
    user.vscode("workbench.action.closeEditorsInGroup")
     
## +++++++++++++++++++++++ pin editors .

pin (editor | tab):
    user.vscode("workbench.action.pinEditor")

unpin (editor | tab):
    user.vscode("workbench.action.unpinEditor")

(isolate | separate | join | flatten) (pinned | pin) (editors | tabs | editor tabs):
    user.vscode("workbench.action.toggleSeparatePinnedEditorTabs")

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

(expand | widen) group | group (max | wide | expand): 
    user.vscode("workbench.action.minimizeOtherEditors")

[toggle] (group full | grateful) | exit (group full | grateful): 
    user.vscode("workbench.action.toggleMaximizeEditorGroup")

(toggle | flip | reset) [(editor | tab)] (group | groups) [(size | sizes | width | widths  | with)]: 
    user.vscode("workbench.action.toggleEditorWidths")

(reset | restore) (group | groups) (size | sizes | width | widths  | with):
    user.vscode("workbench.action.evenEditorWidths")

## ++++++++++++++ andreas tab nav  .

#prefer andreas panel
#user.vscode("workbench.files.action.focusOpenEditorsView")

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

## +++++++++++++++++++++++++++++ draft .

new [text]  (editor | draft):
    user.vscode("workbench.action.files.newUntitledFile")
    
(exit | dispose | trash | kill) [text] (editor | draft):
    user.vscode("workbench.action.closeActiveEditor")
    sleep(200ms)
    key(space)

## +++++++++ hide/show tabs in groups .

show tabs | [show] (multiple | multi) tabs:
    user.vscode("workbench.action.showMultipleEditorTabs")

# bug?  does the same as hide
[show] single tab:
    user.vscode("workbench.action.showEditorTab")

(fold | hide) tabs | single tab:
    user.vscode("workbench.action.hideEditorTabs")

    
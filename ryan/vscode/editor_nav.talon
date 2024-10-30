app: vscode
-

## ++++++++ go to top (of nested) form .

# todo:  vscode and cursorless cops to implement this  

go (top [level] form | form top):
    user.vscode("breadcrumbs.focusAndSelect")
    sleep(100ms)
    key(enter)
    user.vscode("paredit.forwardSexp")

go top form end | post top form:
    user.vscode("breadcrumbs.focusAndSelect")
    sleep(100ms)
    key(enter)
    user.vscode("editor.action.jumpToBracket")
    key(right)
    
[go] next top form:
    user.vscode("breadcrumbs.focusAndSelect")
    sleep(100ms)
    key(down enter)
    user.vscode("paredit.forwardSexp")

## +++++++++++++++++ back/forward form .

#move form defined in calva.talon

(go [to] | pick) symbol:    user.vscode("workbench.action.gotoSymbol")

symbol last:                user.vscode("gotoNextPreviousMember.previousMember")
symbol next:                user.vscode("gotoNextPreviousMember.nextMember")


## ++++++++++++++++++ traverse recent edit location

go back (edit | at it): 
    user.vscode("workbench.action.navigateBackInEditLocations")

go (forward | next) (edit | at it): 
    user.vscode("workbench.action.navigateForwardInEditLocations")

go (prev | previous) (edit | at it): 
    user.vscode("workbench.action.navigatePreviousInEditLocations")

go [to] last (edit | at it): 
    user.vscode("workbench.action.navigateToLastEditLocation")

## ++++++++++++++ traverse recent nav location

go back: 
    user.vscode("workbench.action.navigateBack")

go (forward | ahead) : 
    user.vscode("workbench.action.navigateForward")

# what is defference here?

go back nav:  
    user.vscode("workbench.action.navigateBackInNavigationLocations")

go (forward | ahead) nav: 
    user.vscode("workbench.action.navigateForwardInNavigationLocations")

go (prev | previous) nav: 
    user.vscode("workbench.action.navigatePreviousInNavigationLocations")

go [to] last nav: 
    user.vscode("workbench.action.navigateToLastNavigationLocations")


## +++++++++++++++++ Symbol references .

## ++++++++++in left bar .

(find | show | reveal) [all] (references | refs) [in] [left] [bar]:   
    user.vscode("references-view.findReferences")

(go | bar) (references | refs) [bar]:      
    user.vscode("references-view.tree.focus")

## +++++++++++++ inline popup .

# same as below?
(go [to] inline | nav [inline]) (reference | references | refs):
    user.vscode("editor.action.goToReferences")

(peek | peak) [inline] (reference | references | refs):
    user.vscode("editor.action.referenceSearch.trigger")

hide [inline] (reference | references | refs): key(esc)

## ++++++++++ jump to Symbol reference .

(go | jump to) [first] (reference | ref): 
    key(ctrl--)

## ___________________________________ .

problem show | show problem:               
    user.vscode("workbench.panel.markers.view.focus")

[(show | go)] call (hierarchy | stack):
    key(alt-shift-h)
    # user.vscode("references-view.showCallHierarchy")


## ++++++++++++++++ jump to line .

go [to] line: user.vscode("workbench.action.gotoLine")

go [to] line <user.number_string>: 
    user.vscode("workbench.action.gotoLine")
    sleep(100ms)
    insert("{number_string}")
    key(enter)

go [to] line (paste | pace | clip): 
    user.vscode("workbench.action.gotoLine")
    sleep(100ms)
    edit.paste()
    key(enter)

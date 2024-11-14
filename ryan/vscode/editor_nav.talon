app: vscode
-

## ++++++++++++++++++ pop context menu .

[(show | go)] (context menu [(here | curse | cursor)]) | menu (curse | cursor):
    user.vscode("editor.action.showContextMenu")

[context] menu (point | here): 
    mouse_click(1)

## ++++++++ nav top level (of nested) forms .

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


## +++++++++++++++++++++++ nav tli symbols .

(go [to] | pick) symbol:    
    user.vscode("workbench.action.gotoSymbol")

symbol last:                
    user.vscode("gotoNextPreviousMember.previousMember")
    
symbol next:                
    user.vscode("gotoNextPreviousMember.nextMember")


## +++++++++++++++++ Symbol references .

## ++++++++++ symbol refs in left bar .


(find | show | reveal | list) [all] (references | refs) [in] [left] [bar]:   
    user.vscode("references-view.find")
    # user.vscode("references-view.findReferences")

bar (references | refs) | (go | focus) (references | refs) bar:      
    user.vscode("references-view.tree.focus")

#works in search and references bars

[go] next (bar | list) (referenc | ref): 
    user.vscode("references-view.next")

[go] last (bar | list) (referenc | ref): 
    user.vscode("references-view.prev")

# ++++ symbol refs call stack, in left bar

[(show | go)] [symbol] call (hierarchy | stack):
    user.vscode("references-view.showCallHierarchy")
    # key(alt-shift-h)

## +++++++++++++  symbol refs nav, and inline  popup .

## jumps  to first ref of current symbol if there is only one same file, otherwise pops inline peek refs view
(go | jump) [to] (reference | ref) | (go | nav) [to] [inline] (references | refs):
    user.vscode("editor.action.goToReferences")

(go | jump) [to] first (reference | ref):
    user.vscode("editor.action.goToReferences")
    sleep(50ms)
    key(down enter)

(peek | peak) [inline] (reference | references | refs):
    user.vscode("editor.action.referenceSearch.trigger")

[go] next (reference | ref): 
    user.vscode("goToNextReference")

[go] last (reference | ref): 
    user.vscode("goToPreviousReference")

(hide | close) [inline] (reference | references | refs): key(esc)

## +++++++++++++++++ symbol definition .

(go | jump to) (def | deaf | definition | depth) :
    user.vscode("editor.action.revealDefinition")

(def | deaf | definition | depth) (peek | peak) | (peek | peak) (def | deaf | definition | depth) :
    user.vscode("editor.action.peekDefinition")

[(show | reveal)] (def | deaf | definition | depth) [(to | in)] (new | side | other) [(editor | tab | group)]:
    user.vscode("editor.action.revealDefinitionAside")

## ___________________________________ problems .

problem show | show problem:               
    user.vscode("workbench.panel.markers.view.focus")

next problem :
    user.vscode("editor.action.marker.nextInFiles")

last problem:
    user.vscode("editor.action.marker.prevInFiles")

fix problem:
    user.vscode("problems.action.showQuickFixes")

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

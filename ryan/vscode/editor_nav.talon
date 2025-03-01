app.name: Code
app.name: Cursor
app.name: Windsurf
-

## ++++++++++++++++++ pop context menu .

[(show | go)] (context menu [(here | curse | cursor)]) | menu (curse | cursor):
    user.run_rpc_command("editor.action.showContextMenu")

[context] menu (point | here): 
    mouse_click(1)

## ++++++++ nav top level (of nested) forms .

# todo:  vscode and cursorless cops to implement this  

go (top [level] form | form top):
    user.run_rpc_command("breadcrumbs.focusAndSelect")
    sleep(100ms)
    key(enter)
    user.run_rpc_command("paredit.forwardSexp")

go top form end | post top form:
    user.run_rpc_command("breadcrumbs.focusAndSelect")
    sleep(100ms)
    key(enter)
    user.run_rpc_command("editor.action.jumpToBracket")
    key(right)
    
[go] next top form:
    user.run_rpc_command("breadcrumbs.focusAndSelect")
    sleep(100ms)
    key(down enter)
    user.run_rpc_command("paredit.forwardSexp")

## ++++++++++++++++++ traverse recent edit location

go back (edit | at it): 
    user.run_rpc_command("workbench.action.navigateBackInEditLocations")

go (forward | next) (edit | at it): 
    user.run_rpc_command("workbench.action.navigateForwardInEditLocations")

go (prev | previous) (edit | at it): 
    user.run_rpc_command("workbench.action.navigatePreviousInEditLocations")

go [to] last (edit | at it): 
    user.run_rpc_command("workbench.action.navigateToLastEditLocation")

## ++++++++++++++ traverse recent nav location

go back: 
    user.run_rpc_command("workbench.action.navigateBack")

go (forward | ahead) : 
    user.run_rpc_command("workbench.action.navigateForward")

# what is defference here?

go back nav:  
    user.run_rpc_command("workbench.action.navigateBackInNavigationLocations")

go (forward | ahead) nav: 
    user.run_rpc_command("workbench.action.navigateForwardInNavigationLocations")

go (prev | previous) nav: 
    user.run_rpc_command("workbench.action.navigatePreviousInNavigationLocations")

go [to] last nav: 
    user.run_rpc_command("workbench.action.navigateToLastNavigationLocations")


## +++++++++++++++++++++++ nav tli symbols .

(go [to] | pick) symbol:    
    user.run_rpc_command("workbench.action.gotoSymbol")

symbol last:                
    user.run_rpc_command("gotoNextPreviousMember.previousMember")
    
symbol next:                
    user.run_rpc_command("gotoNextPreviousMember.nextMember")


## +++++++++++++++++ Symbol references .

## ++++++++++ symbol refs in left bar .


(find | show | reveal | list) [all] (references | refs) [in] [left] [bar]:   
    user.run_rpc_command("references-view.find")
    # user.run_rpc_command("references-view.findReferences")

bar (references | refs) | (go | focus) (references | refs) bar:      
    user.run_rpc_command("references-view.tree.focus")

#works in search and references bars

[go] next (bar | list) (referenc | ref): 
    user.run_rpc_command("references-view.next")

[go] last (bar | list) (referenc | ref): 
    user.run_rpc_command("references-view.prev")

# ++++ symbol refs call stack, in left bar

[(show | go)] [symbol] call (hierarchy | stack):
    user.run_rpc_command("references-view.showCallHierarchy")
    # key(alt-shift-h)

## +++++++++++++  symbol refs nav, and inline  popup .

## jumps  to first ref of current symbol if there is only one same file, otherwise pops inline peek refs view
(go | jump) [to] (reference | ref) | (go | nav) [to] [inline] (references | refs):
    user.run_rpc_command("editor.action.goToReferences")

(go | jump) [to] first (reference | ref):
    user.run_rpc_command("editor.action.goToReferences")
    sleep(50ms)
    key(down enter)

(peek | peak) [inline] (reference | references | refs):
    user.run_rpc_command("editor.action.referenceSearch.trigger")

[go] next (reference | ref): 
    user.run_rpc_command("goToNextReference")

[go] last (reference | ref): 
    user.run_rpc_command("goToPreviousReference")

(hide | close) [inline] (reference | references | refs): key(esc)

## +++++++++++++++++ symbol definition .

(def | deaf | definition | depth) (peek | peak) | (peek | peak) (def | deaf | definition | depth) :
    user.run_rpc_command("editor.action.peekDefinition")

(go [to] | jump to) (def | deaf | definition | depth) :
    user.run_rpc_command("editor.action.revealDefinition")

[(show | reveal)] (def | deaf | definition | depth) [(to | in)] (new | side | other) [(editor | tab | group)]:
    user.run_rpc_command("editor.action.revealDefinitionAside")

## ___________________________________ problems .

problem show | show problem:               
    user.run_rpc_command("workbench.panel.markers.view.focus")

next problem :
    user.run_rpc_command("editor.action.marker.nextInFiles")

last problem:
    user.run_rpc_command("editor.action.marker.prevInFiles")

fix problem:
    user.run_rpc_command("problems.action.showQuickFixes")

## ++++++++++++++++ jump to line .

go [to] line: user.run_rpc_command("workbench.action.gotoLine")

go [to] line <user.number_string>: 
    user.run_rpc_command("workbench.action.gotoLine")
    sleep(100ms)
    insert("{number_string}")
    key(enter)

go [to] line (paste | pace | clip): 
    user.run_rpc_command("workbench.action.gotoLine")
    sleep(100ms)
    edit.paste()
    key(enter)

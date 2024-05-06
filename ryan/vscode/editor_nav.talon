app.name: Code
-

## +++++++++++++++++ back/forward form .

# [go] (last |  previous | prev) form: key(alt-up)
# [go] next form: key(alt-down)

#move form defined in calva.talon

(go [to] | pick) symbol:    user.vscode("workbench.action.gotoSymbol")

symbol last:                user.vscode("gotoNextPreviousMember.previousMember")
symbol next:                user.vscode("gotoNextPreviousMember.nextMember")


## ++++++++++++++++++ traverse recent edit location

go back (edit | at it): 
    user.vscode("workbench.action.navigateBackInEditLocations")

go (forward | for | next) (edit | at it): 
    user.vscode("workbench.action.navigateForwardInEditLocations")

go (prev | previous) (edit | at it): 
    user.vscode("workbench.action.navigatePreviousInEditLocations")

go [to] last (edit | at it): 
    user.vscode("workbench.action.navigateToLastEditLocation")

## ++++++++++++++ traverse recent nav location

go back: 
    user.vscode("workbench.action.navigateBack")

go (forward | for | ahead) : 
    user.vscode("workbench.action.navigateForward")

# what is defference here?

go back nav:  
    user.vscode("workbench.action.navigateBackInNavigationLocations")

go (forward | for | ahead) nav: 
    user.vscode("workbench.action.navigateForwardInNavigationLocations")

go (prev | previous) nav: 
    user.vscode("workbench.action.navigatePreviousInNavigationLocations")

go [to] last nav: 
    user.vscode("workbench.action.navigateToLastNavigationLocations")


## +++++++++++++++++ Symbol references .

(find | show) [all] references:   user.vscode("references-view.findReferences")

(go | bar) references:      user.vscode("references-view.tree.focus")

go to references:      user.vscode("editor.action.goToReferences")

(peek | peak) (reference | reference): user.vscode("editor.action.referenceSearch.trigger")

problem show:               user.vscode("workbench.panel.markers.view.focus")


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

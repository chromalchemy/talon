app: vscode
-
show inspector: 
    user.vscode("calva.revealInspector")

go inspector: 
    user.vscode("calva.inspector.focus")

toggle inspector:
    user.vscode("calva.inspector.toggleVisibility")

add [that] to inspectore:
    user.vscode("calva.addToInspector")

clear inspector:
    user.vscode("calva.clearInspector")

copy inspector item:
    user.vscode("calva.copyInspectorItem")

inspect item:
    user.vscode("calva.inspectItem")

(clear | kill | remove) inspector item: 
    user.vscode("calva.clearInspectorItem")
    
paste inspector item:
    user.vscode("calva.pasteAsInspectorItem")

inspector fold all:
    user.vscode("workbench.actions.treeView.calva.inspector.collapseAll")
app: vscode
-

## +++++++++++++++++++++++++++++ panel .

(show | bar) inspector: 
    # user.vscode("calva.revealInspector")
    user.run_rpc_command("calva.revealInspector", 5)

(go | focus) inspector: 
    user.vscode("calva.inspector.focus")

# remove inspector:
#     user.vscode("calva.inspector.removeView")

(toggle | show | hide) inspector:
    user.vscode("calva.inspector.toggleVisibility")


## +++++++++++++++++++++++++++++++ all .

clear inspector:
    user.vscode("calva.clearInspector")

inspector fold all:
    user.vscode("workbench.actions.treeView.calva.inspector.collapseAll")

## ++++++++++++++++++++ inspector item .

(add | send | run) [that] (to | in) inspector [here]:
    user.vscode("calva.addToInspector")

inspect (item | this):
    user.vscode("calva.inspectItem")
    

(copy | cannot the) inspector item:
    user.vscode("calva.copyInspectorItem")

paste [as] inspector item:
    user.vscode("calva.pasteAsInspectorItem")

(clear | kill | remove) inspector item: 
    user.vscode("calva.clearInspectorItem")
    

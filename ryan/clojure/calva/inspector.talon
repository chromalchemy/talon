app: vscode
-

## +++++++++++++++++++++++++++++ panel .

(show | bar) (inspector | inspect): 
    # user.vscode("calva.revealInspector")
    user.run_rpc_command("calva.revealInspector", 5)

(go | focus) (inspector | inspect): 
    user.vscode("calva.inspector.focus")

# remove inspector:
#     user.vscode("calva.inspector.removeView")

(toggle | show | hide) inspector:
    user.vscode("calva.inspector.toggleVisibility")


## +++++++++++++++++++++++++++++++ folding

fold: key(left)
unfold: key(right)

(inspect | inspector | inspections) fold all | fold all (inspect | inspector | inspections):
    user.vscode("workbench.actions.treeView.calva.inspector.collapseAll")


## +++++++++++++++++++++++++ eval, add item to list

# same effect as eval?
(add | send | run) [that] (to | in) inspector [here]:
    user.vscode("calva.addToInspector")

## ++++++++++++++++++++ inspector item .

inspect (it | here):
    user.vscode("calva.inspectItem")    

## +++++++++ copy / paste

(copy | cannot the) inspector item:
    user.vscode("calva.copyInspectorItem")

paste [as] inspector item:
    user.vscode("calva.pasteAsInspectorItem")

## ++++++++++++++++++++++++++++ remove .

(clear | kill | remove) inspector item: 
    user.vscode("calva.clearInspectorItem")

clear (inspect | inspector | inspections):
    user.vscode("calva.clearInspector")
    
    

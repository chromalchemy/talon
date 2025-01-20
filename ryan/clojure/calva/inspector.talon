app.name: Code
app.name: Cursor
app.name: Windsurf
-

## +++++++++++++++++++++++++++++ panel .

(show | bar) (inspector | inspect): 
    # user.run_rpc_command("calva.revealInspector")
    user.run_rpc_command("calva.revealInspector", 5)

(go | focus) (inspector | inspect): 
    user.run_rpc_command("calva.inspector.focus")

# remove inspector:
#     user.run_rpc_command("calva.inspector.removeView")

(toggle | show | hide) inspector:
    user.run_rpc_command("calva.inspector.toggleVisibility")


## +++++++++++++++++++++++++++++++ folding

fold: key(left)
unfold: key(right)

(inspect | inspector | inspections) fold all | fold all (inspect | inspector | inspections):
    user.run_rpc_command("workbench.actions.treeView.calva.inspector.collapseAll")


## +++++++++++++++++++++++++ eval, add item to list

# same effect as eval?
(add | send | run) [that] (to | in) inspector [here]:
    user.run_rpc_command("calva.addToInspector")

## ++++++++++++++++++++ inspector item .

inspect (it | here):
    user.run_rpc_command("calva.inspectItem")    

## +++++++++ copy / paste

(copy | cannot the) inspector item:
    user.run_rpc_command("calva.copyInspectorItem")

paste [as] inspector item:
    user.run_rpc_command("calva.pasteAsInspectorItem")

## ++++++++++++++++++++++++++++ remove .

(clear | kill | remove) inspector item: 
    user.run_rpc_command("calva.clearInspectorItem")

clear (inspect | inspector | inspections):
    user.run_rpc_command("calva.clearInspector")
    
    

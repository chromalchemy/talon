app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

#---------- layouts

[i] please layout:
    key(cmd-shift-p)
    insert("layout")

(toggle | flip | next | rotate | vertical | vertico | stacked | horizontal | column) (layout | lea): user.run_rpc_command("workbench.action.toggleEditorGroupLayout")

centered [column] layout: user.run_rpc_command("workbench.action.toggleCenteredLayout")
single [column] layout: user.run_rpc_command("workbench.action.editorLayoutSingle")
(to | two) (column | columns) layout: user.run_rpc_command("workbench.action.editorLayoutSingle")
(to | two) (row | rows) layout: user.run_rpc_command("workbench.action.editorLayoutTwoRows")

customize layout: usBeer.vscode("workbench.action.customizeLayout") 

# saved layouts extension
# bar (layout | layouts | lout): user.run_rpc_command("workbench.view.extension.editor-layouts")
# go (layout | layouts | lout) : user.run_rpc_command("layouts_list.focus")

# [i] please (save | saved) (layout | layouts | lout):
#     key(cmd-shift-p)
#     insert("saved layout")
    
## +++++++++ restore editors extension .

(bar | go) [restore] (layout | layouts | lout) [restore]: 
    user.run_rpc_command("restoreEditors.views.layouts.focus")

[i] please restore (layout | layouts | lout):
    key(cmd-shift-p)
    insert("restore editor")

#not working
(remove | delete) tab from layout:
    user.run_rpc_command("restoreEditors.views.layouts.tab.delete")

restore (layout | layouts | lout): 
    user.run_rpc_command("restoreEditors.restore")

rename (layout | layouts | lout):
    user.run_rpc_command("restoreEditors.rename")

# not doing anything i can see
# (update | replace) current layout:
#     user.run_rpc_command("restoreEditors.views.layouts.layout.replace")

(update | replace) layout:
    user.run_rpc_command("restoreEditors.replace")

save tabs [to] layout:
    user.run_rpc_command("restoreEditors.save")

save [tabs] [to] layout [<user.text>]:
    user.run_rpc_command("restoreEditors.save")
    sleep(100ms)
    insert(text)
    sleep(200ms)
    key(enter)

pick (layout | layouts | lout) <user.text>: 
    user.run_rpc_command("restoreEditors.views.layouts.focus")
    sleep(100ms)
    insert(text)

(go | open) (layout | layouts | lout) <user.text>: 
    user.run_rpc_command("restoreEditors.views.layouts.focus")
    sleep(100ms)
    insert(text)
    key(enter)
    user.run_rpc_command("workbench.action.keepEditor")

layouts preview:
    user.run_rpc_command("restoreEditors.views.layouts.tab.preview")

# dynamic layouts    

[i] please dynamic (layout | layouts | lout):
    key(cmd-shift-p)
    insert("dynamic layout")

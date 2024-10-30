app: vscode
-

#---------- layouts

[i] please layout:
    key(cmd-shift-p)
    insert("layout")

(toggle | flip | next | rotate | vertical | vertico | stacked | horizontal | column) (layout | lea): user.vscode("workbench.action.toggleEditorGroupLayout")

centered [column] layout: user.vscode("workbench.action.toggleCenteredLayout")
single [column] layout: user.vscode("workbench.action.editorLayoutSingle")
(to | two) (column | columns) layout: user.vscode("workbench.action.editorLayoutSingle")
(to | two) (row | rows) layout: user.vscode("workbench.action.editorLayoutTwoRows")

customize layout: usBeer.vscode("workbench.action.customizeLayout") 

# saved layouts extension
# bar (layout | layouts | lout): user.vscode("workbench.view.extension.editor-layouts")
# go (layout | layouts | lout) : user.vscode("layouts_list.focus")

# [i] please (save | saved) (layout | layouts | lout):
#     key(cmd-shift-p)
#     insert("saved layout")
    
## +++++++++ restore editors extension .

(bar | go) [restore] (layout | layouts | lout) [restore]: 
    user.vscode("restoreEditors.views.layouts.focus")

[i] please restore (layout | layouts | lout):
    key(cmd-shift-p)
    insert("restore editor")

#not working
(remove | delete) tab from layout:
    user.vscode("restoreEditors.views.layouts.tab.delete")

restore (layout | layouts | lout): 
    user.vscode("restoreEditors.restore")

rename (layout | layouts | lout):
    user.vscode("restoreEditors.rename")

# not doing anything i can see
# (update | replace) current layout:
#     user.vscode("restoreEditors.views.layouts.layout.replace")

(update | replace) layout:
    user.vscode("restoreEditors.replace")

save tabs [to] layout:
    user.vscode("restoreEditors.save")

save [tabs] [to] layout [<user.text>]:
    user.vscode("restoreEditors.save")
    sleep(100ms)
    insert(text)
    sleep(200ms)
    key(enter)

pick (layout | layouts | lout) <user.text>: 
    user.vscode("restoreEditors.views.layouts.focus")
    sleep(100ms)
    insert(text)

(go | open) (layout | layouts | lout) <user.text>: 
    user.vscode("restoreEditors.views.layouts.focus")
    sleep(100ms)
    insert(text)
    key(enter)
    user.vscode("workbench.action.keepEditor")

layouts preview:
    user.vscode("restoreEditors.views.layouts.tab.preview")

# dynamic layouts    

[i] please dynamic (layout | layouts | lout):
    key(cmd-shift-p)
    insert("dynamic layout")

app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

## Dataspex Commands
load dataspex:
    user.run_rpc_command("cpt.dataspex.loadDataspexDependency")

inspect top level:
    user.run_rpc_command("cpt.dataspex.inspectTopLevelForm")

inspect current form:
    user.run_rpc_command("cpt.dataspex.inspectCurrentForm")

open inspector editor:
    user.run_rpc_command("cpt.dataspex.openInspectorInEditorView")

open inspector panel:
    user.run_rpc_command("cpt.dataspex.openInspectorPanelView")

connect remote inspector:
    user.run_rpc_command("cpt.dataspex.connectRemoteInspector")

inspect remote:
    user.run_rpc_command("cpt.dataspex.inspectRemote")

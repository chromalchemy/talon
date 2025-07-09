app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

## Clay Commands
make clay file:
    user.run_rpc_command("cpt.clay.makeFile")

make clay quarto file:
    user.run_rpc_command("cpt.clay.makeFileQuarto")

make clay reveal js:
    user.run_rpc_command("cpt.clay.makeFileRevealJs")

make clay current form:
    user.run_rpc_command("cpt.clay.makeCurrentForm")

make clay current quarto:
    user.run_rpc_command("cpt.clay.makeCurrentFormQuarto")

make clay top level:
    user.run_rpc_command("cpt.clay.makeTopLevelForm")

make clay top level quarto:
    user.run_rpc_command("cpt.clay.makeTopLevelFormQuarto")

clay browse:
    user.run_rpc_command("cpt.clay.browse")

clay watch:
    user.run_rpc_command("cpt.clay.watch")

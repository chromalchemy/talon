app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-


^please (deps | depths)$: 
    user.command_search("tools-deps")

## Deps Commands
load dependencies:
    user.run_rpc_command("cpt.deps.loadDependencies")

load selected dependencies:
    user.run_rpc_command("cpt.deps.loadSelectedDependencies")

sync deps:
    user.run_rpc_command("cpt.deps.syncDeps")

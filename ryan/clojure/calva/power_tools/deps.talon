app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-


^please (dependency | dep | dependencies | deps | depths)$: 
    user.command_search("tools-deps")

# Will prompt for and load dependencies.
load (dependency | dep | dependencies | deps | depths):
    user.run_rpc_command("cpt.deps.loadDependencies")

# Add one or more deps.edn dependencies coordinate that you have selected in the editor. E.g. if you have added it to your deps.edn file and want to load the dependency without restarting your REPL (or you may have some comment in the code with the dependency coordinates): Select the key-value pair(s) for the dependencies and then run this command.
load (selected | these) (dependency | dep | dependencies | deps | depths):
    user.run_rpc_command("cpt.deps.loadSelectedDependencies")

# Sync (load any missing) dependencies in deps.edn. Prompts for aliases.
(sync | sink) (dependency | dep | dependencies | deps | depths):
    user.run_rpc_command("cpt.deps.syncDeps")

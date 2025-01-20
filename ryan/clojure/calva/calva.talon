app.name: Code
app.name: Cursor
app.name: Windsurf
-
# todo: limit to clj files
# code.language: clojure

#tag(): user.clojure_core
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.snippets
# tag(): user.splits
tag(): user.tabs


# ++++++++++++++++ calva  settings

[open] calva settings: 
    user.run_rpc_command("workbench.action.openSettings2")
    insert("calva")

open calva (documentation | docs):
    user.run_rpc_command("calva.openCalvaDocs")

new [empty] (clojure | closure) file | you close your file: 
    user.run_rpc_command("workbench.action.files.newUntitledFile")
    sleep(100ms)
    user.run_rpc_command("workbench.action.editor.changeLanguageMode")
    sleep(100ms)
    insert("clojure")
    sleep(100ms)
    key(enter)

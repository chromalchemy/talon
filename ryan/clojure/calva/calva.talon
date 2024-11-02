app: vscode
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
    user.vscode("workbench.action.openSettings2")
    insert("calva")

open calva (documentation | docs):
    user.vscode("calva.openCalvaDocs")

new [empty] (clojure | closure) file | you close your file: 
    user.vscode("workbench.action.files.newUntitledFile")
    sleep(100ms)
    user.vscode("workbench.action.editor.changeLanguageMode")
    sleep(100ms)
    insert("clojure")
    sleep(100ms)
    key(enter)

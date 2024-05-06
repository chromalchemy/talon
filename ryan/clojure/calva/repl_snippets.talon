app: vscode
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-
# todo: limit to clj files
# code.language: clojure

#tag(): user.clojure_core

#### repl snippets config

(open | show) (my | workspace) [calva] repl snippets: 
    user.cursorless_wrap_with_snippet()
    user.vscode("calva.customREPLCommandSnippets")

(open | go) [(user | global)] [calva] (repl snippets | calva config) [eden]: 
    user.vscode("calva.openUserConfigEdn")

(open | go) workspace repl snippets:
    user.vscode("workbench.action.openWorkspaceSettingsFile")
    key(cmd-f)
    insert("calva.customREPLCommandSnippets")

(refresh | reload) [(user | global)] (repl snippets | calva config) [eden]: 
    user.vscode("calva.rereadUserConfigEdn")

## +++++++++++++++ choose repl snippet from dropdown

# todo: need enumerated versions of this?
(pick | choose | show | please) [custom] repl (command | commands  | function | functions | funs | snippet | snippets) [<user.text>]:
    user.vscode("calva.runCustomREPLCommand")
    # sleep(100ms)
    insert(text or "")

## ++++++++++++++++++++++++++++++ test .

^test named repl snippet$:
    user.run_repl_snippet("demo")

#works!!
#still need way to pass a ns or test if it can, w above
^test inline repl snippet$:
    user.run_repl_snippet('$top-level-form')


# run cursorless target in repl
^test (cursorless | curse) repl snippet [on] <user.cursorless_target>$:
    # user.cursorless_command("setSelection", cursorless_target)
    t= user.cursorless_get_text(cursorless_target)
    user.run_repl_snippet("(identity {t})")

    # user.cursorless_ide_command_extra("calva.runCustomREPLCommand", "flow storm", cursorless_target)
    
#use this to pass a ns?
^test  python repl snippet$: 
    insert("ran repl test")
    user.run_repl_command("(println \\\"hello-world\\\")", "clj")

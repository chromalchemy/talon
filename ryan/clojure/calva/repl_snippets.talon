app.name: Code
app.name: Cursor
app.name: Windsurf
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-
# todo: limit to clj files
# code.language: clojure

#tag(): user.clojure_core

#### repl snippets config

(open | go | show) [(user | global)] [calva] (repl snippets | calva config) [eden]: 
    user.run_rpc_command("calva.openUserConfigEdn")

(open | go | show) workspace repl snippets:
    user.run_rpc_command("workbench.action.openWorkspaceSettingsFile")
    key(cmd-f)
    insert("calva.customREPLCommandSnippets")

(refresh | reload) [(user | global)] (repl snippets | calva config) [eden]: 
    user.run_rpc_command("calva.rereadUserConfigEdn")

## +++++++++++++++ choose repl snippet from dropdown

# todo: need enumerated versions of this?
(pick | choose | show | please) [custom] repl (command | commands  | function | functions | funs | fun | snippet | snippets) [<user.text>]:
    user.run_rpc_command("calva.runCustomREPLCommand")
    # sleep(100ms)
    insert(text or "")

(pick | choose | show | please) [custom] repl (command | commands  | function | functions | funs | fun | snippet | snippets) pop [<user.text>]:
    user.run_rpc_command("calva.runCustomREPLCommand")
    # sleep(100ms)
    insert(text or "")
    sleep(100ms)
    key(enter)

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

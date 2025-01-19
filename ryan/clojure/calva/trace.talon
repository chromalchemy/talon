app.name: Code
app.name: Cursor
app.name: Windsurf
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

# (require-resolve 'gbo.playback-preload)
             
launch (portal playback | playback portal): 
    user.run_repl_snippet("launch playback")

## ++++++++++++++ eval code w playback tracing

## +++++++++++++++++++++++++ trace top .
# trace output + replay function

[playback] trace [top]:
    user.run_repl_snippet("pt")

[playback] trace [top] <user.cursorless_target>:
    user.cursorless_command("setSelection", cursorless_target)
    # t= user.cursorless_get_text(cursorless_target)
    sleep(100ms)
    user.run_repl_snippet("pt")

## +++++++++++++++++++++++++ trace more top .
# trace output and input/bindings/steps (depending on the form) + replay function

[playback] trace more [top]:
    user.run_repl_snippet("ptm")

[playback] trace more [top] <user.cursorless_target>:
    user.cursorless_command("setSelection", cursorless_target)
    # t= user.cursorless_get_text(cursorless_target)
    sleep(100ms)
    user.run_repl_snippet("ptm")

## +++++++++++++++++++++++++++++ debux .

debug (it | top):
    user.run_repl_snippet("dbgc")

debug [top] <user.cursorless_target>:
    user.cursorless_command("setSelection", cursorless_target)
    sleep(100ms)
    user.run_repl_snippet("dbgc")
        

#nested version

debug (nested | nest) (top):
    user.run_repl_snippet("dbgnc")

debug (nested | nest) [top] <user.cursorless_target>:
    user.cursorless_command("setSelection", cursorless_target)
    sleep(100ms)
    user.run_repl_snippet("dbgnc")


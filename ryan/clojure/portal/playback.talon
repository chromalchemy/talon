app: vscode
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

# (require-resolve 'gbo.playback-preload)
             
launch (portal playback | playback portal): 
    user.run_rpc_command("calva.runCustomREPLCommand", "launch playback")

## ++++++++++++++ eval code w playback tracing

## +++++++++++++++++++++++++ trace top .
# trace output + replay function

[playback] trace [top]:
    user.run_rpc_command("calva.runCustomREPLCommand", "pt")

[playback] trace [top] <user.cursorless_target>:
    user.cursorless_command("setSelection", cursorless_target)
    # t= user.cursorless_get_text(cursorless_target)
    sleep(100ms)
    user.run_rpc_command("calva.runCustomREPLCommand", "pt")

## +++++++++++++++++++++++++ trace more top .
# trace output and input/bindings/steps (depending on the form) + replay function

[playback] trace more [top]:
    user.run_rpc_command("calva.runCustomREPLCommand", "ptm")

[playback] trace more [top] <user.cursorless_target>:
    user.cursorless_command("setSelection", cursorless_target)
    # t= user.cursorless_get_text(cursorless_target)
    sleep(100ms)
    user.run_rpc_command("calva.runCustomREPLCommand", "ptm")

app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

# inline-def on steroids


# Load Snitch Dependency
load snitch:
    user.run_rpc_command("cpt.snitch.loadSnitchDependency")

# Instrument Top Level defn/let/fn
snitch top [level] [form]:
    user.run_rpc_command("cpt.snitch.instrumentTopLevelForm")

# todo: bind to cmd-enter
# Instrument Current Form defn/let/fn
snitch (current | that) [form]:
    user.run_rpc_command("cpt.snitch.instrumentCurrentForm")

# Get Snitched defn Results, like foo<
get (snitched | snitch) [(results | result)]:
    user.run_rpc_command("cpt.snitch.getSnitchedDefnResults")

# Reconstruct Last defn Call to Clipboard, with recorded params: like foo>
(reconstruct | copy) last (function | fun) call:
    user.run_rpc_command("cpt.snitch.reconstructLastDefnCallToClipboard")

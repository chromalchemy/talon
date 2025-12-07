app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

#tag(): user.clojure_core

(show | bar) joyride: 
    user.run_rpc_command("workbench.view.extension.joyride")

## ++++++++++++++++++++++++++++++ eval .

(joyride | joy) (rep | repl | ripple | evaluate | eval | compute | comp | run | runt) (selection | that): 
    user.run_rpc_command("joyride.evaluateSelection")

(joyride | joy) (rep | repl | ripple | evaluate | eval | compute | comp | run | runt)  <user.cursorless_target>:
    user.cursorless_ide_command("joyride.evaluateSelection", cursorless_target)

(joyride | joy) run (new | clojure) (script | code):
    user.run_rpc_command("joyride.runCode")
    
## ++++++++++++++++++++++++++ run saved code .

(joyride | joy) run [user] (script | code):
    user.run_rpc_command("joyride.runUserScript")

(joyride | joy) run (workspace | work space | project) (script | code):
    user.run_rpc_command("joyride.runWorkspaceScript")


## ++++++++++ open joyride cljs scrips .

(joyride | joy) (Open | go) [user] (script | code) | (Open | go) (joyride | joy) [user] (script | code): 
    user.run_rpc_command("joyride.openUserScript")

(joyride | joy) (Open | go) (workspace | work space | project) (script | code) | (Open | go) (joyride | joy) (workspace | work space | project) (script | code): 
    user.run_rpc_command("joyride.openWorkspaceScript")

## ++++++++++++ create joyride scripts .

(joyride | joy) (create | make | new) [user] (script | code):
    user.run_rpc_command("joyride.createUserScript")

(joyride | joy) (create | make | new) [user] (source | file):
    user.run_rpc_command("joyride.createUserSourceFile")


## ++++++++++++++++++++++ joyride repl .

start (joyride | joy) [(nrepl | repl)]:
    user.run_rpc_command("joyride.startNReplServer")

connect (joyride | joy) [repl]:
    user.run_rpc_command("calva.startJoyrideReplAndConnect")


## ++++++++++++++++++++++++ html flare .

(Open | go) (joyride | joy) (flare | html) (sidebar | panel | bar) | bar flare:
    user.run_rpc_command("joyride.flare.sidebar-1.focus")


## ++++++++++++++++++++++ output panel .

[(go | reveal | show)] (joyride | joy) output [(panel | bar)]:
    user.run_rpc_command("joyride.revealOutputTerminal")

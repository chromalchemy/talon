app: vscode
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

#tag(): user.clojure_core

## ++++++++++++++++++++++++++++++ eval .

(joyride | joy) (rep | repl | ripple | evaluate | eval | compute | comp | run | runt) (selection | that): 
    user.vscode("joyride.evaluateSelection")

(joyride | joy) (rep | repl | ripple | evaluate | eval | compute | comp | run | runt)  <user.cursorless_target>:
    user.cursorless_ide_command("joyride.evaluateSelection", cursorless_target)

(joyride | joy) run (new | clojure) (script | code):
    user.vscode("joyride.runCode")
    
## ++++++++++++++++++++++++++ run saved code .

(joyride | joy) run [user] (script | code):
    user.vscode("joyride.runUserScript")

(joyride | joy) run (workspace | work space | project) (script | code):
    user.vscode("joyride.runWorkspaceScript")

 
## ++++++++++ open joyride cljs scrips .

(joyride | joy) (Open | go) [user] (script | code): user.vscode("joyride.openUserScript")

(joyride | joy) (Open | go) (workspace | work space | project) (script | code): user.vscode("joyride.openWorkspaceScript")

## ++++++++++++++++++++++ joyride repl .

start (joyride | joy) repl:
    user.vscode("joyride.startNReplServer")

connect (joyride | joy) repl:
    user.vscode("calva.startJoyrideReplAndConnect")
    

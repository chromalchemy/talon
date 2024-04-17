app: vscode
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-




#tag(): user.clojure_core

(joyride | joy) (evaluate | eval | run ) (selection | this): 
    user.vscode("joyride.evaluateSelection")

(joyride | joy) (rep | repl | ripple | evaluate | eval | compute | comp | run | runt)  <user.cursorless_target>:
    user.cursorless_ide_command("joyride.evaluateSelection", cursorless_target)



Open joyride [user] script: user.vscode("joyride.openUserScript")

Open joyride (workspace | work space | project) script: user.vscode("joyride.openWorkspaceScript")

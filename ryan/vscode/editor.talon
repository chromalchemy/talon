app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-
#  editor display options
# not actually editing code

## +++++++++++++++++++++++++ copy path .

copy [(tab | current | active)] (filename | file name) [of] [(tab | current | active)]:
    user.run_rpc_command("andreas.copyFilename")

copy [(tab | current | active)] [file] path [of] [(tab | current | active)] [file] :
     user.run_rpc_command("copyFilePath")
 
copy [(tab | current | active)] [file] relative path [of] [(tab | current | active)] [file]:
    user.run_rpc_command("copyRelativeFilePath")

## ++++++++++++++++++++++++++++++ wrap lines .

wrap (words | lines) | toggle (word | line) wrap: user.run_rpc_command("editor.action.toggleWordWrap")

## +++++++++++++++++  zoom level .

reset [(code | app)] zoom:  
    user.run_rpc_command("workbench.action.zoomReset")

## ++++++++++++++++++++++++++ mini map 

(toggle | show | hide ) mini map: 
    user.run_rpc_command("editor.action.toggleMinimap")


## ++++++++++++++++++ editor font zoom .
# breaks cursorless hats

Zoom out font | font zoom out:              
    user.run_rpc_command("editor.action.fontZoomOut")

Zoom in font | font zoom in:               
    user.run_rpc_command("editor.action.fontZoomIn")

(reset | default) font (zoom | size) | font zoom (reset | default): 
    user.run_rpc_command("editor.action.fontZoomReset")


## ++++++++++++++++++++++ font sizes .

(change | switch | tab | editor) (font | text) size: 
    user.run_rpc_command("extension.switchFontSize")

[(change | switch | tab | editor)] (font | text) [size] <number>: 
    user.run_rpc_command("extension.switchFontSize")
    sleep(100ms)
    insert(number)
    sleep(100ms)
    key(enter)

## ++++++++++++++++++++++ Line numbers .

(toggle | show | hide) line numbers: user.run_rpc_command("lntoggle.toggle")

copy line number: user.run_rpc_command("copy-current-line-number.helloWorld")


#-------------- scopes

(show | hide | view | visualize) [context] (tokens | scopes | scope): user.run_rpc_command("editor.action.inspectTMScopes")

(bar | go) (scope | scopes): 
    user.run_rpc_command("cursorless.scopes.focus")
    
# todo: bug, working from command menu, but not talon command (context issue?)
show (scope | scopes) (visualizer | viz): 
    user.run_rpc_command("cursorless.showScopeVisualizer")
hide (scope | scopes) (visualizer | viz): 
    user.run_rpc_command("cursorless.hideScopeVisualizer")

#--------------

(toggle | show | hide ) [cursorless] (hats | decorations): user.run_rpc_command("cursorless.toggleDecorations")
(hats | decorations) (on | off): user.run_rpc_command("cursorless.toggleDecorations")

change [code] [editor | tab] language [mode]:
    user.run_rpc_command("workbench.action.editor.changeLanguageMode") 

(toggle | show | hide ) (whitespace | white space):
    user.run_rpc_command("editor.action.toggleRenderWhitespace")

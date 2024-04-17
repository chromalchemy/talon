app.name: Code
-

## +++++++++++++++++++++++++ copy path .

copy [(tab | current | active)] (filename | file name) [of] [(tab | current | active)]:
    user.vscode("andreas.copyFilename")

copy [(tab | current | active)] [file] path [of] [(tab | current | active)] [file] :
     user.vscode("copyFilePath")
 
copy [(tab | current | active)] [file] relative path [of] [(tab | current | active)] [file]:
    user.vscode("copyRelativeFilePath")

## ++++++++++++++++++++++++++++++ wrap lines .

wrap (words | lines) | toggle (word | line) wrap: user.vscode("editor.action.toggleWordWrap")

## +++++++++++++++++  zoom level .

reset [(code | app)] zoom:  
    user.vscode("workbench.action.zoomReset")

Zoom out font | font zoom out:              
    user.vscode("editor.action.fontZoomOut")

Zoom in font | font zoom in:               
    user.vscode("editor.action.fontZoomIn")

(reset | default) font (zoom | size) | font zoom (reset | default): user.vscode("editor.action.fontZoomReset")

(toggle | show | hide ) mini map: user.vscode("editor.action.toggleMinimap")


## ++++++++++++++++++++++ font sizes .

(change | switch | tab | editor) (font | text) size: user.vscode("extension.switchFontSize")
[(change | switch | tab | editor)] (font | text) [size] <number>: 
    user.vscode("extension.switchFontSize")
    sleep(100ms)
    insert(number)
    sleep(100ms)
    key(enter)

## ++++++++++++++++++++++ Line numbers .

(toggle | show | hide) line numbers: user.vscode("lntoggle.toggle")

copy line number: user.vscode("copy-current-line-number.helloWorld")


#-------------- scopes

(show | hide | view | visualize) [context] (tokens | scopes | scope): user.vscode("editor.action.inspectTMScopes")

(bar | go) (scope | scopes): 
    user.vscode("cursorless.scopes.focus")
    
# todo: bug, working from command menu, but not talon command (context issue?)
show (scope | scopes) (visualizer | viz): 
    user.vscode("cursorless.showScopeVisualizer")
hide (scope | scopes) (visualizer | viz): 
    user.vscode("cursorless.hideScopeVisualizer")

#--------------

(toggle | show | hide ) [cursorless] (hats | decorations): user.vscode("cursorless.toggleDecorations")
(hats | decorations) (on | off): user.vscode("cursorless.toggleDecorations")

change [code] [editor | tab] language [mode]:
    user.vscode("workbench.action.editor.changeLanguageMode") 

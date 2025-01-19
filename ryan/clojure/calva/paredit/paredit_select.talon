app.name: Code
app.name: Cursor
app.name: Windsurf
-
# todo: limit to clj files
# code.language: clojure

#tag(): user.clojure_core

#only works if nothing selected
# (so no point in cursorless?)

take (form | here): 
    user.vscode("calva.selectCurrentForm")

take (form | at) point: 
    mouse_click(0)
    user.vscode("calva.selectCurrentForm")
    

take top level: 
    user.vscode("paredit.rangeForDefun")

## ++++++++++++++++++++++++++++++ back .
    
take back: 
    user.vscode("paredit.selectBackwardSexp")

take back (down | inside): 
    user.vscode("paredit.selectBackwardDownSexp")

take [back] up:
    user.vscode("paredit.selectBackwardUpSexp")

take back (or up | out): 
    user.vscode("paredit.selectBackwardSexpOrUp")
    
take [back] [to] [form] start: 
        user.vscode("paredit.selectOpenList")

## +++++++++++++++++++++++++++ forward .

take (forward | fore | four | ahead): 
    user.vscode("paredit.selectForwardSexp")

take (forward | fore | four | ahead) (down | inside): 
    user.vscode("paredit.selectForwardDownSexp")

take (forward | fore | four | ahead) up: 
    user.vscode("paredit.selectForwardUpSexp")

take [(forward | fore | four | ahead)] [(to | two)] end: 
    user.vscode("paredit.selectCloseList")

take (forward | fore | four | ahead) (or up | out): 
    user.vscode("paredit.selectForwardSexpOrUp")

## +++++++++++++++++++++++++++++ right .

take right: 
    user.vscode("paredit.selectRight")

## +++++++++++++++++++++ shrink/expand .

expand selection | take more | take expand: 
    user.vscode("paredit.sexpRangeExpansion")

shrink selection | take less: 
    user.vscode("paredit.sexpRangeContraction")






 
 
app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-
# todo: limit to clj files
# code.language: clojure

#tag(): user.clojure_core

#only works if nothing selected
# (so no point in cursorless?)

take (form | here): 
    user.run_rpc_command("calva.selectCurrentForm")

take (form | at) point: 
    mouse_click(0)
    user.run_rpc_command("calva.selectCurrentForm")
    

take top level: 
    user.run_rpc_command("paredit.rangeForDefun")

## ++++++++++++++++++++++++++++++ back .
    
take back: 
    user.run_rpc_command("paredit.selectBackwardSexp")

take back (down | inside): 
    user.run_rpc_command("paredit.selectBackwardDownSexp")

take [back] up:
    user.run_rpc_command("paredit.selectBackwardUpSexp")

take back (or up | out): 
    user.run_rpc_command("paredit.selectBackwardSexpOrUp")
    
take [back] [to] [form] start: 
        user.run_rpc_command("paredit.selectOpenList")

## +++++++++++++++++++++++++++ forward .

take (forward | fore | four | ahead): 
    user.run_rpc_command("paredit.selectForwardSexp")

take (forward | fore | four | ahead) (down | inside): 
    user.run_rpc_command("paredit.selectForwardDownSexp")

take (forward | fore | four | ahead) up: 
    user.run_rpc_command("paredit.selectForwardUpSexp")

take [(forward | fore | four | ahead)] [(to | two)] end: 
    user.run_rpc_command("paredit.selectCloseList")

take (forward | fore | four | ahead) (or up | out): 
    user.run_rpc_command("paredit.selectForwardSexpOrUp")

## +++++++++++++++++++++++++++++ right .

take right: 
    user.run_rpc_command("paredit.selectRight")

## +++++++++++++++++++++ shrink/expand .

take more | (expand | grow) (take | selection): 
    user.run_rpc_command("paredit.sexpRangeExpansion")


take less | shrink [selection]: 
    user.run_rpc_command("paredit.sexpRangeContraction")




 
 
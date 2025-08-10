app.name: Rebelle 8
app.name: Rebelle 8
mode: command
-

set default brush:
    fn = """
    (send-rebelle-command
        (set-brush!
            {{:size 50
            :opacity 75
            :color {{:r 255 :g 0 :b 0}} 
            :tool "WATERCOLOR"
            :preset "Gouache/Gouache Flat"}}
    ))
    """
    user.rebelle_eval(fn)

reset brush:
    key(cmd-shift-h)

brush paint [mode]:
    key(1)
    
brush paint [and] mix [mode]:
    key(2)

brush paint [and] blend [mode]:
    key(3)

brush blend [mode]:
    key(4)

brush erase [mode]:
    key(5)
    



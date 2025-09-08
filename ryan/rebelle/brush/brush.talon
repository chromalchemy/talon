app.name: Rebelle 8
app.name: Rebelle 8
mode: command
-

## +++++++++++++++++++ set to defaults .

# this is too raw Todo clean up
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

## ++++++ brush paint application mode .

(brush | rush) [(mode | modi | word)]  paint [(mode | modi | word)] :
    key(1)
    
(brush | rush) [(mode | modi | word)]  [paint] [and] mix [(mode | modi | word)] :
    key(2)

(brush | rush) [(mode | modni | word)]  (paint [and] blend  | blendy | smeary ) [(mode | modi | word)] :
    key(3)

(brush | rush) [(mode | modi | word)]   (blend | blender | (smear | near))  [(mode | modi | word)] :
    key(4)

(brush | rush) [(mode | modi | word)]  (erase | eraser | race ) [(mode | modi | word)] | brushy race:
    key(5)
    



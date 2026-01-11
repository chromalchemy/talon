app.name: Rebelle 8
app.name: Rebelle 8
mode: command
-

## +++++++++++++++++++ set to defaults .

# this is too raw Todo clean up
set default brush:
    fn = """
    (set-brush!
        {{:size 50
        :opacity 75
        :color {{:r 255 :g 0 :b 0}} 
        :tool "WATERCOLOR"
        :preset "Gouache/Gouache Flat"}})
    """
    user.rebelle_fn(fn)

    
reset brush:
    key(cmd-shift-h)

## ++++++ brush paint application mode .

#paint
(brush | rush) [(mode | modi | word)]  paint [(mode | modi | word)] :
    key(1)

#mix 
(brush | rush) [(mode | modi | word)]  [paint] [and] mix [(mode | modi | word)]:
    key(2)

# paint and blend (dirty)
(brush | rush) [(mode | modni | word)]  (paint [and] blend | blendy | dirty | smeary) [(mode | modi | word)] :
    key(3)

#blend
(brush | rush) [(mode | modi | word)] (blend | blender | (smear | near))  [(mode | modi | word)] :
    key(4)

#erase
(brush | rush) [(mode | modi | word)]  (erase | eraser | race ) [(mode | modi | word)] | brushy race:
    key(5)
    



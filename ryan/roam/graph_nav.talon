app.name: Roam Research 
mode: command
-

## +++++++++++++++++++++++ nav history .

go back:  
    key(cmd-[)

go (forward | fore | ahead):  
    key(cmd-])

## ++++++++++++++++++++++++ zoom block .

#zoom into next block at current level
(go | jump) next [top] [level] block: 
    key(ctrl-c)
    key(ctrl-m)

#zoom in on block
(zoom | focus) (block  | down): 
    key(cmd-.)

#same as above? todo: Or disambiguate
# key(ctrl-o)

#zoom out to parent
(zoom | focus) (parent |  up) [block]: 
    key(cmd-shift-ctrl-alt-u)
    
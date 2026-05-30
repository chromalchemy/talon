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
(jump [to] | zoom) (next | below) [top] [level] block | zoom block below: 
    key(ctrl-c)
    key(ctrl-m)

#zoom into prev block at current level
(jump [to] | zoom) (previous | prev | last | above) [top] [level] block | zoom block above: 
    key(ctrl-c)
    key(ctrl-n)

#zoom in on block
(zoom | focus) [in] [on] (block  | down): 
    key(cmd-.)

#same as above? todo: Or disambiguate
# key(ctrl-o)

#zoom out to parent
(zoom | focus) (parent | (up | out) [to] [parent]) [block]: 
    key(cmd-,)
    
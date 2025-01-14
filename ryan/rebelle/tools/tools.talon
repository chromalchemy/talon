app.name: Rebelle 7
mode: command
-

## +++++++++++++++++++++++++++++ tools .

transform tool:
    key(t) 

(select | selection | marquee) tool:
    key(m)

canvas size | crop canvas:
    key(cmd-alt-c)

## +++++++++++++++ sponge tool

(sponge | dry) tool: 
    key(y)

temp (sponge | dry) [tool]: 
    key(y:down)

release (sponge | dry) | (sponge | dry) over:
    key(y:up)

## ++++++++++++++++++++++++ water tool .

(water | wet) tool | water [tool] $: 
    key(w)

temp (water | wet) [tool]: 
    key(w:down)

release (water | wet) | (water | wet) over:
    key(w:up)

## ++++++++++++++++++++++++ blend tool .

blend tool: 
    key(n)

temp blend [tool]: 
    key(n:down)

release blend | blend over:
    key(n:up)

## ++++++++++++++++++++++++ smudge tool .

smudge tool: 
    key(s)

temp smudge [tool]: 
    key(s:down)

release smudge | smudge over:
    key(s:up)

## ++++++++++++++++++++++++ eraser tool .

(eraser | erase) tool: 
    key(e)

temp (eraser | erase) [tool]: 
    key(e:down)

release (eraser | erase) | (eraser | erase) over:
    key(e:up)


## +++++++++++++++++++++++++++++ clone .

clone tool | clone stamp [tool]:
    key(shift-c)

## ++++++++++++++++++++++++++++ fill tool

fill tool |  paint bucket: 
    key(l)


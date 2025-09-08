app.name: Rebelle 8
mode: command
-

## ++++++++++++++++++++++ regular color picker .

(color picker | eyedropper | dropper) tool:
    key(i)

temp (color picker | eyedropper | dropper) [tool]: 
    key(i:down)

release (color picker | eyedropper | dropper) | (color picker | eyedropper | dropper) over:
    key(i:up)

(take | sample) color: 
    key(i:down)
    mouse_click(0)
    key(i:up)

## +++++++ dirty, blended mixing color .

(mix | dirty) (picker | eyedropper | dropper) tool | [toggle] (dirty | partial) color [(sampler | mode)]:
    key(x)

temp (mix | dirty) (picker | eyedropper | dropper) [tool]: 
    key(x:down)

release (mix | dirty) (picker | eyedropper | dropper) | (mix | dirty) (picker | eyedropper | dropper) over:
    key(x:up)

(take | sample) (dirty | mixed | mix) color [<number>]: 
    n = number or 0
    key(x:down)
    mouse_click(0)
    repeat(n)
    key(x:up)

app.name: Adobe Photoshop (Beta)
app.name: Adobe Photoshop 2024
-

## +++++++++++++++ open and save files .

new (file | pane): key(cmd-n)
open file: key(cmd-o)
close file: key(cmd-w)
open folder: key(cmd-shift-o)
save as: key(cmd-shift-s)

 ## +++++++++++++++++++++++++ undeform

undeform: user.menu_select('File|Scripts|[M] Undeform 1.1')

 ## ++++++++++++++++++++++ screen modes .

standard screen mode: user.menu_select('View|Screen Mode|Standard Screen Mode')

 ## +++++++++++++++++++++++++++ zooming .

zoom fit [on screen]: key(cmd-0)
zoom fit artboard [on screen]: user.menu_select('View|Fit Artboard on Screen')
zoom fit layer [on screen]: user.menu_select('View|Fit Layer(s) on Screen')
zoom (base | 100): key(cmd-1)
zoom (2 x | 200): user.menu_select('View|200%')
zoom actual [size]: user.menu_select('View|Actual Size')

## +++++++++++++++++++++ toggle visual stuff .

(toggle | hide | show) panels:  key(tab)

(toggle | hide | show) extras:  key(cmd-h)
(toggle | hide | show) layer edges:  user.menu_select('View|Show|Layer Edges')
(toggle | hide | show) artboard names:  user.menu_select('View|Show|Artboard Names')
(toggle | hide | show) guides: user.menu_select('View|Show|Guides')
(toggle | hide | show)  artboard guides: user.menu_select('View|Show|Artboard Guides')
(toggle | hide | show)  smart guides: user.menu_select('View|Show|Smart Guides')
(toggle | hide | show) grid: user.menu_select('View|Show|Grid')

## +++++++++++ keyboard shortcuts

keyboard shortcuts: key(alt-shift-cmd-k)

 ## +++++++++++++++++++++++++ selecting .

deselect: key(cmd-d)

 ## ++++++++++++++++ history navigation .

# step backwards [<user.n20>]: key("cmd-alt-z:{n20 or 1}")
# step forwards [<user.n20>]: key("cmd-shift-z:{n20 or 1}")

 ## ++++++ brush  manipulation .

 ## ++++++++++++++++++++++++ brush size .

brush [size] down [<user.number_string>]: key("[:{number_string or 1}")
brush [size] up [<user.number_string>]: key("]:{number_string or 1}")

## ++++++++++++++++++++ Brush hardness .

[brush] (hardness | hard) up [<user.number_string>]: 
    key("shift-]:{number_string or 1}")

[brush] (hardness | hard) down [<user.number_string>]: 
    key("shift-[:{number_string or 1}")

 ## ++++++++++++++++++++++++++++++ flow .

flow <user.number_string>: key("ctrl-shift-{number_string}")
    
flow double <user.number_string> <user.number_string> : 
    key(ctrl-shift:down)
    key("ctrl-shift-{number_string_1}")
    key("ctrl-shift-{number_string_2}")

flow single <digits>: 
    key(ctrl-shift:down)
    key(ctrl-shift-0)
    key("ctrl-shift-{digits}")

new layer: key(shift-cmd-n)

copy layer style:  key(cmd-ctrl-c)
paste layer style: key(cmd-ctrl-v)



## ++++++++++++++++++++++++ Move tool .

move [tool]: key(v)

move group [tool]: 
    key(v)
    key(shift-f19)

move layer [tool]: 
    key(v)
    key(shift-cmd-f19)

move (next | last | prev) [tool] :key(shift-v)

## +++++++++++++++++++++++++ text tool .

Text [tool]: key(t)

 ## ++++++++++++++++++ layer visibility .

(show | hide) layer:  key(cmd-,)
layer (show | hide):  key(cmd-,)
toggle layer [visibility]: key(cmd-,)

 ## ++++++++++++ layer stack navigation .

layer (send | move) [to] (back | bottom):  key(cmd-shift-[)
layer (send | move) [to] (front | top):  key(cmd-shift-])
layer (send | move) (up | for | forward) [<digits>]:  
    key(cmd-])
    repeat(digits - 1)
layer (send | move) (down | back | backwards | backward) [<digits>]:
    key(cmd-[)
    repeat(digits - 1)

 ## ++++++++++++++++++ gradient overlay .

gradient overlay: 
    key(cmd-alt-shift-ctrl-l)
    sleep(100ms)
    insert("gradient overlay")
    sleep(100ms)
    key(enter)

 ## +++++++++++++++++++++++ menu search .

search menu <user.text>:
    key(cmd-alt-shift-ctrl-l)
    sleep(500ms)
    insert(text)

hit menu <user.text>:
    key(cmd-alt-shift-ctrl-l)
    sleep(100ms)
    insert(text)
    sleep(100ms)
    key(enter)

 ## ++++++++++++++++++++++ layer styles .

outer glow: 
    key(cmd-alt-shift-ctrl-l)
    sleep(300ms)
    insert("outer glow")
    sleep(300ms)
    key(enter)

 ## +++++++++++++++++++++++ lock layers .

layer (lock | unlock):  key(cmd-/)

 ## +++++++++++++++++++++ smart objects .

(make | convert to) smart object: key(ctrl-f11)

 ## +++++++++++++++++++++++++ transform .

transform: key(cmd-t)

 ## +++++++++++++++++++++++++++ filters .

camera (raw | module): key(shift-cmd-a)


## +++++++++++++++++++++++++++++ transform draggging .

centered [scale] drag:
    user.mouse_drag(0)
    # user.grid_close()
    sleep(2000ms)
    key("alt:down")
    
clone drag:
    key("alt:down")
    user.mouse_drag(0)
    # close the mouse grid
    user.grid_close()

set [transform] (anchor | origin) [point]:
    key(alt:down)
    mouse_click(0)

 ## +++++++++++++++++ font manipulation .


 ## ++++++++++++++++++++++++++ tracking .

#  # mimic("point tracking")
go tracking: 
    mouse_move(914.6171875, 186.5703125)
    sleep(3300ms)
    mouse_click(0)

# # mimic("point tracking")
[set] tracking [<user.number_string>]: 
    mouse_move(914.6171875, 186.5703125)
    sleep(2500ms)
    mouse_click(0)
    insert(number_string)
    sleep(50ms)
    key(enter)

[set] tracking (negative | neg) [<user.number_string>]: 
    mynum = "-" + number_string
    mouse_move(914.6171875, 186.5703125)
    sleep(2500ms)
    mouse_click(0)
    insert(mynum)
    key(enter)

## +++++++++++++++++++++++++++++ drags .

#doesnt work for dragging transform

drag copy:
    key(alt:down)
    user.mouse_drag(0)
    # # close the mouse grid
    user.grid_close()
    
drag [current] layer:
    key(cmd:down)
    user.mouse_drag(0)
    # # close the mouse grid
    user.grid_close()
    
 ## +++++++++++++++++++++++ pick colors .

(modal | mode) color picker:
    key(cmd:down alt:down ctrl:down)
    # user.mouse_drag(0)

pick color: key(n)

#todo: not working right, mouse doesnt click
(choose | take ) color:
    # mouse.click(0)
    # sleep(100ms)
    key(enter)

default colors: key(d)

(swap | flip) (colors | color | brush): key(x)

## ++++++++++++++++++ Masking commands .

 paint (inside | outside): key(x)

fill [with] foreground color: key(alt-delete)
fill [with] background color: key(cmd-delete)

invert layer: key(cmd-i)

(swap | flip) masking [brush] [polarity]: key(x)


color black | paint mask | (mask | erase) (pixels | layer): 
    key(d)
    sleep(100ms)
    key(x)

color white | erase mask | (unmask | paint) (pixels | layer): 
    key(d)
    





 ## +++++++++++++++++++++++++++ confirm .

^okay$: key(enter)

## +++++++++++++++++++++++ layer masks .

(select | go)  layer mask: key(cmd-\)

 ## ++++++++++++++++++++++++ quick mask .

(toggle | show | hide) quick mask: key(q)

 ## +++++++++++++++++++++++++++++ tools .

eraser [tool]: key(e)
zoom [tool]: key(z)
brush [tool]: key(b)

(hand | pan) [tool]: key(h)
hold (hand | pan): key(space:down)
(release | exit) hand: key(space:up)

rotate (tool | canvas): key(r)
(other | next) brush [tool]: key(shift-b)
brush (next | last | prev): key(shift-b)

rotate [tool]: key(r)


 ## +++++++++++++++++++++++++ edit text .

edit text [(here | point)]: 
    key(t:down)
    mouse_click(0)
    key(t:up)

take text [(here | point)]:
    key(t:down)
    sleep(300ms)
    mouse_click(0)
    # sleep(300ms)
    key(t:up)
    sleep(300ms)
    key(cmd-a)
    # edit.select_all()




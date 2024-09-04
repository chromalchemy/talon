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

[brush] flow <user.number_string> <user.number_string> : 
    key("shift-{number_string_1}")
    key("shift-{number_string_2}")

[brush] flow single <digits> : 
    key(shift:down)
    key(shift-0)
    key("shift-{digits}")

[brush] flow level <user.number_string>: 
    key("shift-{number_string}")

## +++++++++++++++++++++++++++ opacity .

[brush] (opacity | transparency | trans | opaque) <user.number_string> <user.number_string> : 
    key("{number_string_1}")
    key("{number_string_2}")

[brush] (opacity | transparency | trans | opaque) level <user.number_string>: 
    key("{number_string}")


[brush] full (opacity | transparency | trans | opaque)  | brush fully opaque: 
    key(0)    


# ---------------

new layer: key(shift-cmd-n)

copy layer style:  key(cmd-ctrl-c)
paste layer style: key(cmd-ctrl-v)



## ++++++++++++++++++++++++ Move tool .

move [tool]: key(v)
(next | last | prev) move tool :key(shift-v)


move group [tool]: 
    key(v)
    key(shift-f19)

move layer [tool]: 
    key(v)
    key(shift-cmd-f19)


## +++++++++++++++++++++++++ text tool .

(Text | type) tool: key(t:down)

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
# go tracking: 
#     mouse_move(914.6171875, 186.5703125)
#     sleep(3300ms)
#     mouse_click(0)

# # mimic("point tracking")
# [set] tracking [<user.number_string>]: 
#     mouse_move(914.6171875, 186.5703125)
#     sleep(2500ms)
#     mouse_click(0)
#     insert(number_string)
#     sleep(50ms)Bottom
#     key(enter)

# [set] tracking (negative | neg) [<user.number_string>]: 
#     mynum = "-" + number_string
#     mouse_move(914.6171875, 186.5703125)
#     sleep(2500ms)
#     mouse_click(0)
#     insert(mynum)
#     key(enter)

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

(default | reset) colors: key(d)

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

eraser [(tool | to)]: key(e)
zoom [(tool | to)]: key(z)
brush [(tool | to)]: key(b)

(hand | pan) [(tool | to)]: key(h)
hold (hand | pan) | pan mode: key(space:down)
(release | exit) (hand | pan): key(space:up)

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

# todo: make past raw
(paste | pace) text [(here | point)]:
    key(t:down)
    sleep(300ms)
    mouse_click(0)
    # sleep(300ms)
    key(t:up)
    sleep(300ms)
    key(cmd-a)
    sleep(100ms)
    key(cmd-v)
    # edit.select_all()

(paste | pace) (no |  without) (formatting | format): 
    user.menu_select('Edit|Paste Special|Paste without Formatting')

(paste | pace) [text] raw [(here | point)]:
    key(t:down)
    sleep(300ms)
    mouse_click(0)
    # sleep(300ms)
    key(t:up)
    sleep(300ms)
    key(cmd-a)
    sleep(500ms)
    user.menu_select('Edit|Paste Special|Paste without Formatting')
    # edit.select_all()

## +++++++++++++++++++++++++++++ inbox .

Center layer  [on (page | artboard )]:
    key(cmd-a)
    sleep(100ms)
    user.menu_select('Layer|Align Layers to Selection|Horizontal Centers')
    sleep(200ms)
    key(cmd-d)


## ++++++ Clone and rasterize gradient .

Clone [and] (raster | rasterize) (layer | gradient):
    user.menu_select('Layer|Duplicate Layer...')
    sleep(300ms)
    key(enter)
    sleep(300ms)
    key(cmd-,)
    sleep(300ms)
    key(alt-[)
    user.menu_select('Layer|Rasterize|Layer')

## +++++++++++++++++++++ paste helpers .

[photo] paste color: 
    user.zoom_close()
    mouse_click(0)
    user.grid_close()
    user.mouse_drag_end() 
    key(cmd-v enter)

[photo] copy color:
    user.zoom_close()
    mouse_click(0)
    user.grid_close()
    user.mouse_drag_end() 
    key(cmd-c esc)


[set] font size <user.number_string>:
    user.ps_command_nb("(set-font-size! {number_string})")

[set] [font] tracking <user.number_string>:
    user.ps_command_nb("(set-font-tracking! {number_string})")

(increase [font] tracking  | [font] tracking up) <user.number_string>:
    user.ps_command_nb("(update-font-tracking! {number_string})")

(decrease [font] tracking  | [font] tracking down) <user.number_string>:
    user.ps_command_nb("(update-font-tracking! -{number_string})")

rotate clone [<number>]:
    n = number or 1
    b = n * 4
    key("alt-shift-.:{b}")

photo new layer:
    user.system_command_nb("open \"/Users/ryan/dev/ps script/scripts/create_layer.psjs\"")

^jpeg <number_small>: 
    insert(".jpg{number_small}")

^jpeg <number_small> [(file name | filename)] <user.text> :
    insert("{text}.jpg{number_small}")

^jpeg <number_small> [(file name | filename)] (pace | paste):
    t = clip.text()
    insert("{t}.jpg{number_small}")
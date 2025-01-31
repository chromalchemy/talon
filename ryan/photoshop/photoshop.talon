app.name: Adobe Photoshop (Beta)
app.name: Adobe Photoshop 2025
-
generate images:
    user.menu_select('File|Automate|Generator Plugins|Image Assets')


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

(toggle | hide | show) layer edges:  
    user.menu_select('View|Show|Layer Edges')

(toggle | hide | show) artboard names:  
    user.menu_select('View|Show|Artboard Names')

(toggle | hide | show) guides: 
    user.menu_select('View|Show|Guides')

(toggle | hide | show) artboard guides: 
    user.menu_select('View|Show|Artboard Guides')

(toggle | hide | show)  smart guides: 
    user.menu_select('View|Show|Smart Guides')

(toggle | hide | show) grid: 
    user.menu_select('View|Show|Grid')

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

## +++++++++++++++++++++++ layer style .

copy layer style:  
    key(cmd-ctrl-c)

paste layer style: 
    key(cmd-ctrl-v)

## +++++++++++++++++++++++++ artboards .

(Ungroup | release) (artboards | artboard):
    user.menu_select('Layer|Ungroup Artboards')

## ++++++++++++++++++++++++ Move tool .

move group [tool]: 
    user.ps_select_move_group_tool()

move layer [tool]:
    user.ps_select_move_layer_tool()
    
 ## ++++++++++++++++++ layer visibility .

(show | hide) layer: 
    user.ps_toggle_layer_visibility()

layer (show | hide): 
    user.ps_toggle_layer_visibility()

toggle layer [visibility]:
    user.ps_toggle_layer_visibility()

 ## ++++++++++++ layer stack navigation .

layer (send | move) [to] (back | bottom) | layer center back:
   user.ps_move_layer_bottom()

layer (send | move) [to] (front | top):
   user.ps_move_layer_top()

layer (send | move) (up | for | forward) [<digits>]:  
   user.ps_move_layer_up(digits or 1)

layer (send | move) (down | back | backwards | backward) [<digits>]:
   user.ps_move_layer_down(digits or 1)

 ## ++++++++++++++++++ gradient overlay .

gradient overlay: 
    key(cmd-alt-shift-ctrl-l)
    sleep(100ms)
    insert("gradient overlay")
    sleep(100ms)
    key(enter)


 ## ++++++++++++++++++++++ layer styles .

outer glow: 
    user.menu_select('Layer|Layer Style|Color Overlay...')

 ## +++++++++++++++++++++++ lock layers .

layer (lock | unlock):  
    key(cmd-/)

 ## +++++++++++++++++++++ smart objects .

(make | convert to) smart object: 
    key(ctrl-f11)

 ## +++++++++++++++++++++++++ transform .

transform: 
    key(cmd-t)

 ## +++++++++++++++++++++++++++ filters .

camera (raw | module): 
    key(shift-cmd-a)


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

## ++++++++++ primary /secondary color .

(default | reset) colors: key(d)

(swap | flip) (colors | color | brush): key(x)

color black | paint mask | (mask | erase) (pixels | layer): 
    key(d)
    sleep(100ms)
    key(x)

color white | erase mask | (unmask | paint) (pixels | layer): 
    key(d)


## ++++++++++++++++++ Masking commands .

paint (inside | outside) | (swap | flip) masking [brush] [polarity]: 
    key(x)

## ++++++++++++++++++++++++ quick mask .

(toggle | show | hide) quick mask:
    key(q)

## ++++++++++++++++++++++++++++ 

invert (layer | mask): key(cmd-i)
    
go mask:
    key(cmd-shift-\)

go layer:
    key(cmd-shift-2)

## +++++++++++++++++++++++++++++++ fil .

fill [with] foreground color: 
    key(alt-delete)

fill [with] background color: 
    key(cmd-delete)

 ## +++++++++++++++++++++++++++ confirm .

^okay$: key(enter)

## +++++++++++++++++++++++ layer masks .

(select | go)  layer mask: key(cmd-\)

 ## +++++++++++++++++++++++++ edit text .

edit text [(here | point)]:
    user.ps_place_cursor_in_text() 

take text [(here | point)]:
    user.ps_select_text()

(paste | pace) text [(here | point)]:
    user.ps_select_text()
    key(cmd-v)

(paste | pace) (no |  without) (formatting | format): 
    user.menu_select('Edit|Paste Special|Paste without Formatting')

(paste | pace) [text] raw [(here | point)]:
    user.ps_select_text()
    user.menu_select('Edit|Paste Special|Paste without Formatting')

## +++++++++++++++++++++++++++++ inbox .

Center layer  [on (page | artboard )]:
    key(cmd-a)
    sleep(100ms)
    user.menu_select('Layer|Align Layers to Selection|Horizontal Centers')
    sleep(200ms)
    key(cmd-d)


## ++++++ Clone and rasterize gradient .

Clone [and] (raster | rasterize) (layer | gradient) [<user.text>]:
    user.ps_duplicate_layer(text or "cloned layer")
    user.ps_toggle_layer_visibility()
    sleep(300ms)
    user.ps_go_layer_down()
    sleep(300ms)
    user.ps_rasterize_layer()

## +++++++++++++++++++++ paste helpers .

[photo] paste color:
    user.ps_click() 
    key(cmd-v enter)

[photo] copy color:
    user.ps_click() 
    key(cmd-c esc)

photo test trace:
    user.ps_command_nb("(test-trace)")

[set] font size <user.number_string>:
    user.ps_command_nb("(set-font-size! {number_string})")

[set] [font] tracking <user.number_string>:
    user.ps_command_nb("(set-font-tracking! {number_string})")

(increase [font] tracking  | [font] tracking up) <user.number_string>:
    user.ps_command_nb("(update-font-tracking! {number_string})")

(decrease [font] tracking  | [font] tracking down) <user.number_string>:
    user.ps_command_nb("(update-font-tracking! -{number_string})")

rotate clone [<number>]:
    user.ps_rotate_clone(number or 1)

#test invoke squint js script
photo new layer:
    user.system_command_nb("open \"/Users/ryan/dev/ps script/scripts/create_layer.psjs\"")

^jpeg <number_small>: 
    insert(".jpg{number_small}")

^jpeg <number_small> [(file name | filename)] <user.text> :
    insert("{text}.jpg{number_small}")

^jpeg <number_small> [(file name | filename)] (pace | paste):
    t = clip.text()
    insert("{t}.jpg{number_small}")


## ++++++++++++++++++++++ rename layer .

[custom] rename layer [<user.text>]:
    user.ps_rename_layer(text or "")


 ## +++++++++++++++++++++++++++++ tools .

{user.ryan.photoshop.tool_key.list} [(tool | to)]:
    key(user.ryan.photoshop.tool_key.list)

hold {user.ryan.photoshop.tool_key.list} |  {user.ryan.photoshop.tool_key.list} (mode | hold):
    key("{user.ryan.photoshop.tool_key.list}:down")

(release | exit) {user.ryan.photoshop.tool_key.list} |  {user.ryan.photoshop.tool_key.list} (release | exit):
    key("{user.ryan.photoshop.tool_key.list}:up")

(other | next | last | prev) {user.ryan.photoshop.tool_key.list} [(tool | to) | {user.ryan.photoshop.tool_key.list} (next | last | prev)]:
    key("shift-{user.ryan.photoshop.tool_key.list}")


## ++++++++++++++++++ background color .

# this .talon list reference points to this relative path: ryan/photoshop/backdrop_color.talon-list 
[canvas] backdrop [color] {user.ryan.photoshop.backdrop_color.list}:
    mouse_click(1)
    sleep(400ms)
    insert(user.ryan.photoshop.backdrop_color.list)
    sleep(400ms)
    key(enter)


    
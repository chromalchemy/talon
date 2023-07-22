app.name: Adobe Photoshop (Beta)
app.name: Adobe Photoshop
-

new (file | pane): key(cmd-n)
open file: key(cmd-o)
close file: key(cmd-w)
open folder: key(cmd-shift-o)
save as: key(cmd-shift-s)


undeform: user.menu_select('File|Scripts|[M] Undeform 1.1')

standard screen mode: user.menu_select('View|Screen Mode|Standard Screen Mode')

zoom fit [on screen]: key(cmd-0)
zoom fit artboard [on screen]: user.menu_select('View|Fit Artboard on Screen')
zoom fit layer [on screen]: user.menu_select('View|Fit Layer(s) on Screen')
zoom (base | 100): key(cmd-1)
zoom (2 x | 200): user.menu_select('View|200%')
zoom actual [size]: user.menu_select('View|Actual Size')

(toggle | hide | show) panels:  key(tab)


(toggle | hide | show) extras:  key(cmd-h)
(toggle | hide | show) layer edges:  user.menu_select('View|Show|Layer Edges')
(toggle | hide | show) artboard names:  user.menu_select('View|Show|Artboard Names')
(toggle | hide | show) guides: user.menu_select('View|Show|Guides')
(toggle | hide | show)  artboard guides: user.menu_select('View|Show|Artboard Guides')
(toggle | hide | show)  smart guides: user.menu_select('View|Show|Smart Guides')
(toggle | hide | show) grid: user.menu_select('View|Show|Grid')


keyboard shortcuts: key(alt-shift-cmd-k)

deselect: key(cmd-d)

# step backwards [<user.n20>]: key("cmd-alt-z:{n20 or 1}")
# step forwards [<user.n20>]: key("cmd-shift-z:{n20 or 1}")

(brush | brushy) [(s | size)] down [<user.number_string>]: key("[:{number_string or 1}")
(brush | brushy) [(s | size)] up [<user.number_string>]: key("]:{number_string or 1}")
brush [tool]: key(b)
[other | next] brush [tool]: key(shift-b)

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

move group [tool]: key(shift-f19)
move layer [tool]: key(shift-cmd-f19)
move [tool]: key(v)
Text [tool]: key(t)

(show | hide) layer:  key(cmd-,)
layer (show | hide):  key(cmd-,)
toggle layer [visibility]: key(cmd-,)

layer (send | move) [to] (back | bottom):  key(cmd-shift-[)
layer (send | move) [to] (front | top):  key(cmd-shift-])
layer (send | move) (up | for | forward) [<digits>]:  
    key(cmd-])
    repeat(digits - 1)
layer (send | move) (down | back | backwards | backward) [<digits>]:
    key(cmd-[)
    repeat(digits - 1)

gradient overlay: 
    key(cmd-alt-shift-ctrl-l)
    sleep(100ms)
    insert("gradient overlay")
    sleep(100ms)
    key(enter)


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

outer glow: 
    key(cmd-alt-shift-ctrl-l)
    sleep(300ms)
    insert("outer glow")
    sleep(300ms)
    key(enter)

layer (lock | unlock):  key(cmd-/)
(make | convert to) smart object: key(ctrl-f11)

transform: key(cmd-t)

camera (raw | module): key(shift-cmd-a)


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
    key("alt:down")
    mouse_click(0)

[set] tracking [<user.number_string>]: 
    # mimic("point tracking")
    mouse_move(914.6171875, 186.5703125)
    sleep(3300ms)
    mouse_click(0)
    mouse_click(0)
    key(cmd-a)
    insert(number_string)
    key(enter)

[set] tracking (negative | negg) [<user.number_string>]: 
    mouse_move(914.6171875, 186.5703125)
    sleep(3300ms)
    mouse_click(0)
    mouse_click(0)
    key(cmd-a)
    mynum = "-" + number_string
    insert(mynum)
    key(enter)
    

    
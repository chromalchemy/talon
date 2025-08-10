app.name: Rebelle 8
mode: command
-

tablet (mode | moon):
    key(tab)


## ++++++++++++++++++++++ brush panels .

bar tools:
    key(f3)
    
bar brushes:
    key(f8)

bar (properties | props):
    key(f4)

bar (visual | viz) [settings]:
    key(f12)

bar (volume presets):
    key(shift-j)

bar brush (creator | editor):
    key(f5)

bar mixing [palette]: 
    key(cmd-shift-m)

## ++++++++++++++++++++++ other panels .

bar preview: 
    key(cmd-shift-w)

bar reference: 
    key(cmd-shift-r)

bar rulers:
    key(shift-r)

bar (color [(sliders)] | colors | palette | swatches):
    key(f6)

[bar] structures:
    key(shift-s)

bar tilt:
    key(cmd-l)

bar (navigator | nav):
    key(cmd-k)

bar layers:
    key(f7)
    
bar (path | paths):
    key(shift-p)

bar (stencil | stencil):
    key(f10)

## +++++++++++++++++++++++++++ layouts .

(lock | unlock) panels:
    user.menu_select('Window|Lock Panels')

export (layout | panels):
    user.menu_select('Window|Export Layout')

(export | save) (layout | panels) <user.text>:
    user.reb_save_layout(text)

load (layout | panels):  
    user.menu_select('Window|Import Layout')

load (layout | panels) <user.text>:
    user.reb_load_layout(text)

## ++++++++++++ save/restore active working layout state

save working (layout | panels):
    user.reb_update_layout("working")

restore working (layout | panels):
    user.reb_load_layout("working")
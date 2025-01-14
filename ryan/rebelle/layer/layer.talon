app.name: Rebelle 7
mode: command
-

## +++++++++++++++++++++++++ new layer .

new layer: 
    key(shift-cmd-n)

(duplicate | clone) layer: 
    key(shift-cmd-d)

## ++++++++++++++++ consolidate layers .

merge layers: 
    key(shift-cmd-e)

## ++++++++++++++++++++++ remove layer .

(chuck | delete  | remove) layer:
    key(alt-shift-d)

clear layer:
    key(del)

## ++++++++++++++++++ layer visibility .
    
(show | hide) layer:
    key(cmd-.)
    
## +++++++++++++++++++++ select layers .

select all layers:
    key(alt-cmd-a)

## ++++++++++++++++++++++ layer groups .

new group:
    key(alt-cmd-g)

group layers:
    key(cmd-g)

ungroup layers:
    key(shift-cmd-g)

## +++++++++++++++++ send to photoshop .

export to photo:
    user.menu_select('Layer|Export to Photoshop')

## +++++++++++++++++++++ masking fluid layer

no masking fluid layer | (chuck | no) (mask | masking) [layer]:
    user.menu_select('Layer|Masking Fluid Layer|No Mask') 

opaque masking fluid layer | [opaque] (mask | masking) [layer]: 
    user.menu_select('Layer|Masking Fluid Layer|Mask Opaque')

transparent masking fluid layer | trans (mask | masking) [layer]: 
    user.menu_select('Layer|Masking Fluid Layer|Mask Transparent')


## +++++++++++++++++++++ tracing layer .

tracing layer [(on  | off)]:
    key(alt-shift-t)


## +++++++++++++++++++++++++++ locking .

(lock | unlock) layer: 
    key(cmd-/)

(lock | unlock) [layer] (transparency | trans) [layer]:
    key(/)

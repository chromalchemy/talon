app.name: Roam Research 
mode: command
-

## +++++++++++++++++++++ #move blocks .


## ++++++++++++++++++++++++ move block on page 

(block | move) up: key(cmd-shift-up)
(block | move) down: key(cmd-shift-down)
(block | move) (in | (right | write) | forward | fore | four): key(tab)
(block | move) (out | left | back): key(shift-tab)

## ++++++++++++++++ move block to DNP date (str)

#make versions that leave reference

move [(block | blocks)] to tomorrow: 
    key(cmd-d)
    sleep(100ms)
    key(tab enter)
    sleep(100ms)
    key(tab:2 enter)

#todo: why inserting at bottom
move [(block | blocks)] to today: 
    key(cmd-d)
    sleep(100ms)
    edit.select_all()
    sleep(100ms)
    key(delete)
    user.paste("Today")
    sleep(100ms)
    key(tab enter)
    sleep(100ms)
    key(tab:2 enter)

## ++++++++++++++++++++++ Move block to page .

# make version that leaves reference

move [(block | blocks)] to [top] [of] [page] (paste | pace | clip): 
    key(cmd-alt-m)
    sleep(1500ms)
    key(right)
    sleep(100ms)        
    edit.paste()
    sleep(200ms)        
    key(enter tab:2 enter)

move [(block | blocks)] to [top] [of] {user.roam_tag}: 
    key(cmd-alt-m)
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{roam_tag}")        
    sleep(200ms)        
    key(enter tab:2 enter)

[move] <user.letters> [move] (to | two) [top] [of] {user.roam_tag}:
    insert(letters)
    sleep(300ms) 
    key(cmd-alt-m)
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{roam_tag}")        
    sleep(200ms)        
    key(enter tab:2 enter)


move [(block | blocks)] to [top] [of] {user.roam_tag} (sidebar | bar):
    key(cmd-p)
    sleep(100ms)
    user.paste("mbts")
    sleep(100ms)
    key(enter) 
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{roam_tag}")        
    sleep(200ms)        
    key(enter tab:2 enter)

move [(block | blocks)] to [top] [of] {user.roam_tag} [leave] (ref | reference | rough):
    key(cmd-p)
    sleep(100ms)
    user.paste("mbtr")
    sleep(100ms)
    key(enter) 
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{roam_tag}")        
    sleep(200ms)        
    key(enter tab:2 enter)

move [(block | blocks)] to [top] [of] {user.roam_tag} [and] (zoom | go [there] | focus):
    key(cmd-p)
    sleep(100ms)
    user.paste("mbtz")
    sleep(100ms)
    key(enter) 
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{roam_tag}")        
    sleep(200ms)        
    key(enter tab:2 enter)

## +++++++++++ move block to reference .

move [(block | blocks)] to (ref | reference | rough) (paste | pace | clip): 
    key(cmd-alt-m)
    sleep(1500ms)
    key(tab right)
    edit.paste()
    sleep(300ms)        
    key(enter)
    sleep(100ms)
    key(tab enter)

# ------------- reference versions

move [(block | blocks)] (to | too | two) {user.roam_ref}: 
    key(cmd-alt-m)
    sleep(1500ms)
    key(tab right)
    user.paste("{roam_ref}")
    sleep(200ms)        
    key(enter)
    sleep(100ms)        
    key(tab enter)

(send | move) [(block | blocks)] (ref | reference | link) (to | too | two) {user.roam_ref}: 
    key(cmd-alt-ctrl-m)
    sleep(1500ms)
    key(tab right)
    user.paste("{roam_ref}")       
    sleep(200ms)
    key(enter)
    sleep(100ms)       
    key(tab enter)

## +++++++++++++++++++ move to sidebar .

move [(block | blocks)] to (paste | pace) (sidebar | bar): 
    key(cmd-p)
    sleep(200ms)
    user.paste("mbts")
    sleep(100ms)
    key(enter)
    sleep(1500ms)
    key(right)
    edit.paste()
    sleep(200ms)
    key(enter)
    sleep(100ms)       
    key(tab enter)

## +++++++++++++++++++++++++++++ inbox .

#move to #tag #inbox combo reference
move [(block | blocks)] to {user.roam_tag} inbox: 
    key(cmd-alt-m)
    sleep(1500ms)
    key(tab right)
    insert("#{roam_tag} #inbox")
    sleep(200ms)        
    key(enter)
    sleep(100ms)
    key(tab enter)
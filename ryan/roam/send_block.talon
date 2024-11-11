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


teleport [(todo | block)]:
    key(cmd-alt-shift-t)

teleport [(todo | to do)] [and] [leave] (ref | reference):
    user.run_roam_command("teleport todos and leave blockref behind")


#make versions that leave reference

move [(block | blocks)] to tomorrow: 
    key(cmd-d)
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

move [(block | blocks)] to [top] [of] {user.ryan.roam.tags.list}: 
    key(cmd-alt-m)
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{user.ryan.roam.tags.list}")        
    sleep(200ms)        
    key(enter tab:2 enter)

[move] <user.letters> [move] (to | two) [top] [of] {user.ryan.roam.tags.list}:
    insert(letters)
    sleep(300ms) 
    key(cmd-alt-m)
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{user.ryan.roam.tags.list}")        
    sleep(200ms)        
    key(enter tab:2 enter)


move [(block | blocks)] to [top] [of] {user.ryan.roam.tags.list} (sidebar | bar):
    user.run_roam_command("mbts")
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{user.ryan.roam.tags.list}")        
    sleep(200ms)        
    key(enter tab:2 enter)

move [(block | blocks)] to [top] [of] {user.ryan.roam.tags.list} [leave] (ref | reference | rough):
    user.run_roam_command("mbts")
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{user.ryan.roam.tags.list}")        
    sleep(200ms)        
    key(enter tab:2 enter)

move [(block | blocks)] to [top] [of] {user.ryan.roam.tags.list} [and] (zoom | go [there] | focus):
    user.run_roam_command("mbts")
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{user.ryan.roam.tags.list}")        
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

move [(block | blocks)] (to | too | two) {user.ryan.roam.refs.list}: 
    key(cmd-alt-m)
    sleep(1500ms)
    key(tab right)
    user.paste("{user.ryan.roam.refs.list}")
    sleep(200ms)        
    key(enter)
    sleep(100ms)        
    key(tab enter)

(send | move) [(block | blocks)] (ref | reference | link) (to | too | two) {user.ryan.roam.refs.list}: 
    key(cmd-alt-ctrl-m)
    sleep(1500ms)
    key(tab right)
    user.paste("{user.ryan.roam.refs.list}")       
    sleep(200ms)
    key(enter)
    sleep(100ms)       
    key(tab enter)

## +++++++++++++++++++ move to sidebar .

move [(block | blocks)] to (paste | pace) (sidebar | bar): 
    user.run_roam_command("mbts")
    sleep(1500ms)
    key(right)
    edit.paste()
    sleep(200ms)
    key(enter)
    sleep(100ms)       
    key(tab enter)

## +++++++++++++++++++++++++++++ inbox .

#move to #tag #inbox combo reference
move [(block | blocks)] to {user.ryan.roam.tags.list} inbox: 
    key(cmd-alt-m)
    sleep(1500ms)
    key(tab right)
    insert("#{user.ryan.roam.tags.list} #inbox")
    sleep(200ms)        
    key(enter)
    sleep(100ms)
    key(tab enter)
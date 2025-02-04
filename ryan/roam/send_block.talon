app.name: Roam Research 
mode: command
-


## ++++++++++++++++ move block to date (str)


#make versions that leave reference

#todo: why inserting at bottom

move [(block | blocks)] [to] yesterday:
    user.roam_send_block_to_date_text("Yesterday")

move [(block | blocks)] [to] today:
    user.roam_send_block_to_date_text("Today") 

move [(block | blocks)] [to] tomorrow: 
    user.roam_send_block_to_date_text("Tomorrow")

    
## ++++++++++++++++++++++++++ teleport to date (with calendar popup)

teleport [(todo | block)] [to (date | cal | calendar)] [and] [leave] (ref | reference):
    user.roam_send_block_to_date_by_calendar()

teleport [(todo | to do)] [and] leave (ref | reference):
    user.run_roam_command("teleport todos and leave blockref behind")


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
    user.roam_break_block()
    key(tab enter)

# ------------- leave reference versions

(move | send) [(block | blocks)] (to | too | two) {user.ryan.roam.refs.list}: 
    user.roam_send_block_to_reference_top("{user.ryan.roam.refs.list}")

(send | move) [(block | blocks)] (sticky | stick) (to | too | two) {user.ryan.roam.refs.list}: 
    user.roam_send_block_to_reference_top_leave_reference(user.ryan.roam.refs.list)

## +++++++++++++++++++ move to sidebar .

move [(block | blocks)] to (paste | pace) [and] (sidebar | bar): 
    user.run_roam_command("mbts")
    sleep(1500ms)
    key(right)
    edit.paste()
    sleep(200ms)
    user.roam_break_block()       
    key(tab enter)

## +++++++++++++++++++++++++++++ inbox .

#move to #tag #inbox combo reference
move [(block | blocks)] to {user.ryan.roam.tags.list} inbox: 
    key(cmd-alt-m)
    sleep(1500ms)
    key(tab right)
    insert("#{user.ryan.roam.tags.list} #inbox")
    sleep(200ms)        
    user.roam_break_block()
    key(tab enter)
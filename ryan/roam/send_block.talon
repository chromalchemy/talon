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



## +++++++++++ move to location plugin .

#########################################
## +++++++++++++ move + sidebar 
#########################################

move [(block | blocks)] to [top] [of] {user.ryan.roam.tags.list} (sidebar | side | bar):
    user.roam_send_block_to_page_top_and_sidebar("{user.ryan.roam.tags.list or ''}")


move [(block | blocks)] to  (paste | pace | clip) page [and] (sidebar | side | bar):
    page_name = clip.text()
    user.roam_send_block_to_page_top_and_sidebar(page_name)

###############################################
## +++++++++++++++ move + zoom .
###############################################

move [(block | blocks)] to [top] [of] {user.ryan.roam.tags.list} [and] (zoom | go [there] | focus):
    user.roam_send_block_to_page_top_and_zoom("{user.ryan.roam.tags.list or ''}")

###############################################
## +++++++++++++++ move + leave ref .
###############################################


## +++++++++ move to page + ref

(sticky | stick | ticky | tick | pin [block] [and]) (send | move) [(block | blocks)] to [top] [of] {user.ryan.roam.tags.list} | (send | move) [(block | blocks)] to {user.ryan.roam.tags.list} [and] [leave] [(ref | reference | rough)]:
    user.roam_send_block_to_page_top_and_leave_reference("{user.ryan.roam.tags.list or ''}")
    # print("moved block to page and left reference")

## +++++++++ move to ref + ref

(sticky | stick | ticky | tick | pin [block] [and]) (send | move) [(block | blocks)] (to | too | two) {user.ryan.roam.refs.list} | (send | move) [(block | blocks)] to {user.ryan.roam.refs.list} [and] [leave] [(ref | reference | rough)]:
    user.roam_send_block_to_reference_top_and_leave_reference("{user.ryan.roam.refs.list}")



############################################### 
############################ move 
###############################################

## ++++++++++++++++++++++ Move block to page .

(move | send) [(block | blocks)] to [top] [of] [page] (paste | pace | clip):
    page_name = clip.text()
    user.roam_send_block_to_page_top(page_name)

move [(block | blocks)] to [top] [of] {user.ryan.roam.tags.list}:
    user.roam_send_block_to_page_top("{user.ryan.roam.tags.list or ''}") 

[move] <user.letters> [move] (to | two) [top] [of] {user.ryan.roam.tags.list}:
    user.roam_select_block_hat(letters)
    user.roam_send_block_to_page_top("{user.ryan.roam.tags.list or ''}")


[move] <user.number_string> [move] (to | two) [top] [of] {user.ryan.roam.tags.list}:
    user.roam_select_block_hat(number_string)
    user.roam_send_block_to_page_top("{user.ryan.roam.tags.list or ''}")

## +++++++++++ move to reference .

move [(block | blocks)] to (ref | reference | rough) (paste | pace | clip):
    reference_string = clip.text()
    user.roam_send_block_to_reference_top(reference_string) 

(move | send) [(block | blocks)] (to | too | two) {user.ryan.roam.refs.list}: 
    user.roam_send_block_to_reference_top("{user.ryan.roam.refs.list}")


## ++++++++ move to inbox refs

#move to #tag #inbox combo reference
move [(block | blocks)] to {user.ryan.roam.tags.list} inbox: 
    user.roam_send_block_to_reference_top("#{user.ryan.roam.tags.list} #inbox")

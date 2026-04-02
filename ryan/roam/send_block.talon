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

move [(block | blocks)] to [top] [of] {user.roam_tag} (sidebar | side | bar):
    user.roam_send_block_to_page_top_and_sidebar("{user.roam_tag or ''}")


move [(block | blocks)] to  (paste | pace | clip) page [and] (sidebar | side | bar):
    page_name = clip.text()
    user.roam_send_block_to_page_top_and_sidebar(page_name)

###############################################
## +++++++++++++++ move + zoom .
###############################################

move [(block | blocks)] to [top] [of] {user.roam_tag} [and] (zoom | go [there] | focus):
    user.roam_send_block_to_page_top_and_zoom("{user.roam_tag or ''}")

###############################################
## +++++++++++++++ move + leave ref .
###############################################


## +++++++++ move to page + ref

(sticky | stick | ticky | tick | pin [block] [and]) (send | move) [(block | blocks)] to [top] [of] {user.roam_tag} | (send | move) [(block | blocks)] to {user.roam_tag} [and] [leave] [(ref | reference | rough)]:
    user.roam_send_block_to_page_top_and_leave_reference("{user.roam_tag or ''}")
    # print("moved block to page and left reference")

## +++++++++ move to ref + ref

(sticky | stick | ticky | tick | pin [block] [and]) (send | move) [(block | blocks)] (to | too | two) {user.roam_ref} | (send | move) [(block | blocks)] to {user.roam_ref} [and] [leave] [(ref | reference | rough)]:
    user.roam_send_block_to_reference_top_and_leave_reference("{user.roam_ref}")



############################################### 
############################ move 
###############################################

## ++++++++++++++++++++++ Move block to page .

(move | send) [(block | blocks)] to [top] [of] [page] (paste | pace | clip):
    page_name = clip.text()
    user.roam_send_block_to_page_top(page_name)

move [(block | blocks)] to [top] [of] {user.roam_tag}:
    user.roam_send_block_to_page_top("{user.roam_tag or ''}") 

[move] <user.letters> [move] (to | two) [top] [of] {user.roam_tag}:
    user.roam_select_block_hat(letters)
    user.roam_send_block_to_page_top("{user.roam_tag or ''}")


[move] <user.number_string> [move] (to | two) [top] [of] {user.roam_tag}:
    user.roam_select_block_hat(number_string)
    user.roam_send_block_to_page_top("{user.roam_tag or ''}")

## +++++++++++ move to reference .

move [(block | blocks)] to (ref | reference | rough) (paste | pace | clip):
    reference_string = clip.text()
    user.roam_send_block_to_reference_top(reference_string) 

(move | send) [(block | blocks)] (to | too | two) {user.roam_ref}: 
    user.roam_send_block_to_reference_top("{user.roam_ref}")


## ++++++++ move to inbox refs

#move to #tag #inbox combo reference
move [(block | blocks)] to {user.roam_tag} inbox: 
    user.roam_send_block_to_reference_top("#{user.roam_tag} #inbox")

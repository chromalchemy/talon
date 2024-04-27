
## ++++++ open pasted (path) via raycast .

(go | open | run) (paste | pace | copied | carved | clipped | clipboard | clip) [(path | (code | line) link)] [in (code | finder | raycast)] | (raycast | cast | run) (paste | pace | copied | carved | clipped | clipboard | clip) [in raycast] :
    key(cmd-space)
    sleep(100ms)
    edit.paste()
    sleep(100ms)
    key(enter)

 ## ++++++ run selected (path) in raycast .

(go | open | run) (that | selected) [(path | (code | line) link)] [in (code | finder | raycast)] | (raycast | cast | run) (paste | pace | copied | carved | clipped | clipboard | clip) [in raycast]:
    # selectedText = edit.selected_text() 
    key(cmd-space)
    # insert(selectedText)
    # sleep(100ms)
    # key(enter) 


## ++++++++++++++++++ open saved finder path folder w raycast



#spawns new window : todo make reuse open tab
open <user.system_path> [folder]:
    key(cmd-space)
    insert(system_path)
    sleep(100ms)
    key(enter)
    sleep(200ms)
    key(cmd-o) 

#open folder and osx File chooser  popup

(modal | dialog) search [<user.text>]: 
    key(cmd-f)
    sleep(200ms)
    insert(text)

(modal | dialog) (browse | search) [(file |folder)] path:
    key(cmd-shift-g) 

(modal | dialog) open <user.system_path> [folder]:
    key(cmd-shift-g) 
    sleep(300ms)
    insert(system_path)
    sleep(100ms)
    key(enter) 


# demo open file: user.file_manager_open_file("~/Documents/ticket reciept.pdf")
# user.file_maDemo actionnager_open_directory(system_path)
# file = user.file_manager_get_file_by_index(number_small - 1)
# insert(file)

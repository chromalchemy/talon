# not mode: sleep
# -

# tag: user.file_manager

# tag: terminal

#keys 
(for | fore) (delete | dell): key(delete)

copy it: key(cmd-c)  
paste it: key(cmd-v)

show (clip | clipboard | image | screengrab) [in] preview:
    key(cmd-space)
    insert("preview")
    sleep(100ms)
    key(enter)
    sleep(100ms)
    key(cmd-w)
    sleep(100ms)
    key(shift-f12)
    sleep(700ms)
    key(d)
    sleep(100ms)
    key(a)
    sleep(600ms)
    key(cmd-n)

#raycast 

(raycast | ray cast | ray) [<user.text>]: 
    key(cmd-space)
    insert(text)

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


## ++++++++++++++++++++++++++++ wooshy .


^((who | will) she | wooshy | wish he) [(hunt | point | search)] [<user.text>] : 
    key(cmd-shift-space)
    sleep(300ms) 
    insert("{text or ''}")

^((who | will) she | wooshy | wish he be) click [<user.text>] : 
    key(cmd-shift-space)
    sleep(300ms) 
    insert("{text or ''}")
    sleep(300ms)
    key(enter)


## ++++++++++++++++++++ # search menus .

(search | hunt) ray (menu | menus) [<user.text>]: 
    key(cmd-alt-shift-ctrl-l)
    sleep(200ms)
    insert("{text or ''}")

# finder

(take screen shot | screen grab): key(ctrl-shift-cmd-4)

(show | hide | toggle) desk: key(f11)

open display panel: 
    key(cmd-space)
    sleep(300ms)
    insert("displays")
    key(enter)

open sound panel: 
    key(cmd-space)
    sleep(300ms)
    insert("sound")
    sleep(200ms)
    key(enter)

## ++++++++++++++++++++++ pick open window

pick (win | window) [spotlight]: key(ctrl-up)
pick (win | window) grid: key(cmd-alt-shift-ctrl-down)
pick (win | window) (ray | list): 
    key(cmd-space)
    insert("switch windows")
    sleep(100ms)
    key(enter)

[pick] app (win | windows) [finder] : key(ctrl-down)   

# global app commands
save file: key(cmd-s)
quit app: key(cmd-q)
exit: key(escape)

# already built in
# open talon repl: 
#     key(cmd-space) 
#     sleep(100ms)
#     insert("search files")
#     sleep(100ms)
#     key(enter)
#     insert("/Users/ryan/.talon/.venv/bin/repl")
#     sleep(100ms)
#     key(cmd-1)
    

#global editor commands
(override line | over ride line):
    mimic("clone line")
    sleep(300ms)
    # comment line
    key(up cmd-/) 
    #navigate to place in new line
    key(down left:2) 
    # mimic("go to line start")
    # insert("#")

#right/context click
((right | r | are | part) click | (context | see | sea) (click | touch | that | menu | options)):
    mouse_click(1)
    # close the mouse grid if open
    user.grid_close()

 
#--------------- new 

(unindent | un indent) [that]: key(shift-tab)

dell it | deli it | dell that: key(delete)

# todo:why is this not working in application over rides
(go | show | open) (browser | browse):
    user.switcher_focus("Chrome")    


(cursorless | cursor less) (reference | live (cheatsheet | cheat sheet)): 
    user.switcher_focus("Chrome")
    browser.go("https://www.cursorless.org/cheatsheet")

select (all | or): key(cmd-a)

paste there: key(cmd-v)

(toggle | enter | leave | exit) [system] dark mode:
    key(cmd-space)
    sleep(100ms)
    insert("toggle system appearance")
    sleep(100ms)
    key(enter)



#todo: get this working in finder

option drag:
    user.mouse_drag(0)
    sleep(300ms)
    key(alt:down)
    user.grid_close()
    
hold option: key(alt:down)

shift drag:
    key(shift:down)
    user.mouse_drag(0)
    user.grid_close()

command drag:
    key(cmd:down)
    user.mouse_drag(0)
    user.grid_close()
    
# repeat command key    
key(cmd-ctrl-alt-shift-q) : core.repeat_command(1)

# talon sleep
key(cmd-ctrl-alt-shift-x): speech.disable()

Open linear mouse [panel]: 
    key(cmd-space)
    # sleep(100ms)
    insert("linearmouse")
    sleep(100ms)
    key(enter)


#break cursorless commands, to say n in same
then: skip()

#no op prefix commant to prime dictation to recieve next text without Clipping first  syllable
^now: skip()



## ++++++++++++++++++++++ roam raycast extension

(notes | note | no to | not to | don't | roam | rome) capture: 
    key(cmd-ctrl-alt-shift-;)

#input focus fails randomly

#send copied text to roam
(notes | note | no to | not to | don't | roam | rome) capture (paste | pace | clip) | (send) (clip | paste) [to] notes:
    key(cmd-ctrl-alt-shift-;)
    sleep(200ms)
    edit.paste()

# Send selected text to roam
(notes | note | no to | not to | don't | roam | rome) capture that | send that [to] notes:
    # edit.copy()
    key(cmd-c)
    sleep(200ms)
    key(cmd-ctrl-alt-shift-;)
    sleep(200ms)
    edit.paste()
    sleep(100ms)
    key(cmd-enter)
    sleep(100ms)
    key(escape)

# Send selected text with point touch to roam
(notes | note | no to | not to | don't | roam | rome) capture point | send point [to] notes:
    key(shift:down)
    mouse_click(1)
    edit.copy()
    key(cmd-ctrl-alt-shift-;)
    sleep(200ms)
    edit.paste()
    sleep(100ms)
    key(cmd-enter)
    sleep(100ms)
    key(escape)

(ok | confirm | send) note:
    key(cmd-enter)
    sleep(100ms)
    key(escape)

 ## +++++++++++++++++++++ basic editing .

dedent: key(shift-tab)

#------------------ no click edits
#Is this implemented anywhere else?

#todo: Implement option clicks

take (Pointer | point):
    key(shift:down)
    mouse_click(0)
    
(chuck | crop | clear) (Pointer | point):
    key(shift:down)
    mouse_click(0)
    edit.delete()
(chuck | crop | clear) (Pointer | point) force:
    key(shift:down)
    mouse_click(0)
    edit.delete()
    key(escape)    

(copy) (Pointer | point):
    key(shift:down)
    mouse_click(0)
    edit.copy()
(copy) (Pointer | point) force:
    key(shift:down)
    mouse_click(0)
    edit.copy()
    key(escape)
    # cursor go back action

(cut | carve) (Pointer | point):
    key(shift:down)
    mouse_click(0)
    edit.cut()

# Make version that leaves the pasted text selected    
(paste) (Pointer | point):
    key(shift:down)
    mouse_click(0)
    edit.paste()

# demo open file: user.file_manager_open_file("~/Documents/ticket reciept.pdf")
# user.file_maDemo actionnager_open_directory(system_path)
# file = user.file_manager_get_file_by_index(number_small - 1)
# insert(file)

## ++++++++++++ Navigate osx file menu .

go menu: 
    key(fn-ctrl-f2)

go menu <user.letter>: 
    key(fn-ctrl-f2)
    insert(letter)
    key(down)

go menu <user.letters> : 
    key(fn-ctrl-f2)
    insert(letters)
    key(down)

go menu <user.text>: 
    key(fn-ctrl-f2)
    insert(text)
    key(down)

menu pick <user.text>: 
    insert(text)
    
menu (touch | punch | hit | press | select) <user.text>: 
    insert(text)
    key(enter)

# paste date template
date [string] <user.number_string> [plus] <user.number_string>: 
    insert("{number_string_1}/{number_string_2}")
    sleep(200ms)
    key(escape)

## ++++++++++++++++ adjust night shift .

[make | set] ((display | screen) (temperature | temp) | (nightshift | night shift)) <user.number_string>:
    user.system_command_nb("nightlight temp {number_string}")

toggle (nightshift | night shift | night light | [(display | screen)] (temperature | temp)):
    user.system_command_nb("nightlight toggle") 

## +++++++++++++++++ adjust brightness .

[(screen | display)] (brightness | brightens | brighten) up | brighten [up] (screen | display):
    key(f15)

[(screen | display)] (brightness | brighten | brightens | Brighton) down | dim [down] (screen | display):
    key(f14)

[(screen | display)] (brightness | brighten | brightens | Brighton) single <user.number_string>:
    user.system_command_nb("brightness 0.0{number_string}")

[(screen | display)] (brightness | brighten | brightens | Brighton) <user.number_string>:
    user.system_command_nb("brightness 0.{number_string}")
    
photo new layer:
    user.system_command_nb("open \"/Users/ryan/dev/ps script/scripts/create_layer.psjs\"")


(screen | display) (brightness | brighten | brightens | Brighton) full:
    user.system_command_nb("brightness 1")
        
round (string | rap | wrap | text) <user.prose>:
    insert("({prose})")

## ++++++++++ go to open tab In chrome .

go (browse | page | tab) <user.text>:
    user.switcher_focus("Chrome") 
    key(cmd-shift-a)
    sleep(200ms) 
    insert("{text}")
    sleep(100ms)
    key(enter)

(show | view) (hot keys | hotkeys): 
    key(cmd:down)
    sleep(1000ms)

## ++++ open terminal and run commands .

term brew (upgrade | update): 
    user.switcher_focus("Warp")
    key(cmd-t)
    sleep(200ms)
    user.menu_select('Tab|Rename the Current Tab')
    insert("Brew")
    key(enter)
    insert("brew update")
    sleep(1000ms)
    key(enter)

(warp | term) [new] (babashka | b b | be be | bb ) [repl]: 
    user.switcher_focus("Warp")
    key(cmd-t)
    sleep(300ms)
    user.menu_select('Tab|Rename the Current Tab')
    insert("BB")
    key(enter)
    sleep(1000ms)
    insert("bb")
    key(enter)

(warp | term) [new] (node (bb | b b) | n b b | nbb | en be be ) [repl]: 
    user.switcher_focus("Warp")
    key(cmd-t)
    sleep(300ms)
    user.menu_select('Tab|Rename the Current Tab')
    insert("NBB")
    key(enter) 
    sleep(1000ms)
    insert("nbb")
    key(enter)

term (quit | exit) [( repl | command)]: 
    key(ctrl-c)
    # insert(":repl/quit")
    # key(enter)




    
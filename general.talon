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

raycast | ray cast | ray: key(cmd-space)

 ## ++++++ run selected text in raycast .

run [that] in raycast:
    selectedText = edit.selected_text() 
    key(cmd-space)
    insert(selectedText)
    sleep(100ms)
    key(enter) 

open that (path | in finder):
    selectedText = edit.selected_text() 
    key(cmd-space)
    insert(selectedText)
    sleep(100ms)
    key(enter) 

## +++++++++++++++ run pasted commands .

run (copied | clipboard) in raycast:
    key(cmd-space)
    edit.paste()
    sleep(100ms)
    key(enter) 

open paste path [in] [finder]:
    key(cmd-space)
    edit.paste()
    sleep(100ms)
    key(enter) 

#spawns new window : todom make reuse open tab
open <user.system_path> [folder]:
    key(cmd-space)
    insert(system_path)
    sleep(100ms)
    key(enter) 

(raycast | cast) that | run (that | clip | paste | pace) in raycast:
    key(cmd-space)
    sleep(100ms)
    edit.paste()
    key(enter)

(go | open) [that] (code | line) link [in code] [(paste | pace | clip)]:
    key(cmd-space)
    sleep(100ms)
    edit.paste()
    sleep(100ms)
    key(enter)

# search menus
search (menu | menus): key(cmd-alt-shift-ctrl-l)

# finder
show hidden folders: key(ctrl-shift-period)
open file: key(cmd-o)
view: key(space)
close: key(space)
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
    key(enter)

#window Management
(win | window) right: key(cmd-alt-shift-ctrl-right)
(win | window) left: key(cmd-alt-shift-ctrl-left)
(win | window) (max | maximize): key(cmd-alt-shift-ctrl-up)

pick (win | window) [spotlight]: key(ctrl-up)
pick (win | window) grid: key(cmd-alt-shift-ctrl-down)
pick (win | window) (ray | list): 
    key(cmd-space)
    insert("switch windows")
    sleep(100ms)
    key(enter)

[pick] app (win | windows) [finder] : key(ctrl-down)


# How to invoke more directly come and not have a flash of chooser
(win | window) (next | last | swap | prev):  
    key(shift-ctrl-f6)
(next | last | swap) (app | win | window): 
    key(shift-ctrl-f6)
   

# global app commands
save file: key(cmd-s)
quit app: key(cmd-q)
exit: key(escape)

[(toggle | enter | exit | leave)] (fullscreen | full screen): key(cmd-alt-shift-ctrl-a) 



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



# (go | show | open) (photoshop | ps | pee ess | photo ):
#     key(cmd-space)
#     insert("photoshop beta")
#     key(enter)

# (go | show | open) (roam | notes | note | rome):
#     key(cmd-space)
#     insert("roam research")
#     key(enter)
    
(go | show | open) (chrome | browse | browser):
    user.switcher_focus("Chrome")
    
# (go | show | open) (finder | file manager):
#     key(cmd-space)
#     insert("finder")
#     key(enter)
    
# (go | show | open) (ide | code | editor | vscode | vs code):
#     key(cmd-space)
#     insert("visual studio code")
#     key(enter)
    

#cursorless

#bc bookmarks


open (cats | categories):   user.open_url("https://store-7hstasnrjg.mybigcommerce.com/manage/products/categories")


#other bookmarks
# open (cursorless | cursor less) (docs | documentation): user.open_url("https://www.cursorless.org/docs/")

select (all | or): key(cmd-a)

# [open] (cursorless | cursor less) (reference | cheat sheet | cheatsheet | wacky): user.open_url("file:///Users/ryan/.cursorless/cheatsheet.html")

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



#roam raycast 
(note | roam | rome) capture: 
    key(cmd-ctrl-alt-shift-;)
    # key(cmd-space)
    # insert("roam quick capture")
    # sleep(100ms)
    # key(enter)


#input focus fails randomly
(note | no to | not to | don't | roam | rome) capture (that | it | then): 
    edit.copy()
    sleep(100ms)
    key(cmd-ctrl-alt-shift-;)
    sleep(200ms)
    edit.paste()

(ok | confirm) note:
    key(cmd-enter)
    sleep(100ms)
    key(escape:2)

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

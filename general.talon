
# tag: terminal

#keys 
(for | fore) (delete | dell): key(delete)

# #homerow
target: key(shift-f12)
search target: key(cmd-shift-f12)

copy it: key(cmd-c)
paste it: key(cmd-v)

#shortcat
retarget: key(alt-shift-cmd-ctrl-f12)

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
(raycast | ray cast): key(cmd-space)
search (menu | menus): key(cmd-alt-shift-ctrl-l)

# finder
show hidden folders: key(ctr-shift-period)
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
pick (win | window) grid]: key(cmd-alt-shift-ctrl-down)
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

[toggle] fullscreen: key(cmd-alt-shift-ctrl-a) 

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

#talon stuff
# talon log [window]:

#right/context click
((right | r | are | part) click | (context | see | sea) (click | touch | that | menu | options)):
    mouse_click(1)
    # close the mouse grid if open
    user.grid_close()

 
#--------------- new 

(unindent | un indent) [that]: key(shift-tab)

(dell it | deli it | dell that): key(delete)

(raycast that | run that in raycast):
    key(cmd-space)
    key(cmd-v)
    key(enter)
open [that] [(code | line)] [as] link [in code]:
    key(cmd-space)
    key(cmd-v)
    key(enter)


(go | show | open) (photoshop | ps | pee ess | photo ):
    key(cmd-space)
    insert("photoshop beta")
    key(enter)

(go | show | open) (roam | notes | note | rome):
    key(cmd-space)
    insert("roam research")
    key(enter)
    
(go | show | open) (chrome | browse | browser):
    key(cmd-space)
    insert("google chrome")
    key(enter)
    
(go | show | open) (finder | file manager):
    key(cmd-space)
    insert("finder")
    key(enter)
    
(go | show | open) (ide | code | editor | vscode | vs code):
    key(cmd-space)
    insert("visual studio code")
    key(enter)
    

#cursorless

#bc bookmarks

open (cats | categories):   user.open_url("https://store-7hstasnrjg.mybigcommerce.com/manage/products/categories")


#other bookmarks
# open (cursorless | cursor less) (docs | documentation): user.open_url("https://www.cursorless.org/docs/")

select or: key(cmd-a)

# [open] (cursorless | cursor less) (reference | cheat sheet | cheatsheet | wacky): user.open_url("file:///Users/ryan/.cursorless/cheatsheet.html")

 
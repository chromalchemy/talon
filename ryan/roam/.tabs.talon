app.name: Roam Research 
mode: command
-

#tabs extension

pick page: key(cmd-ctrl-alt-shift-t)

go page <number_small>:
    spacesDown=number_small - 1  
    key(cmd-ctrl-alt-shift-t)
    sleep(300ms)
    key(cmd-a delete)
    sleep(100ms)
    key("down:{spacesDown} enter")

(choose | pick) page <number_small>:
    spacesDown=number_small - 1  
    key("down:{spacesDown} enter")

go page <user.text>:
    key(cmd-ctrl-alt-shift-t)
    sleep(300ms)
    key(cmd-a delete)
    sleep(100ms)
    insert(text)
    sleep(200ms)
    key(enter)

# not canonical bc search is fuzz and filters char in middle of word    
pick page <user.letter>:
    key(cmd-ctrl-alt-shift-t)
    sleep(300ms)
    key(cmd-a delete)
    sleep(100ms)
    insert(letter)
    
open page in tab: 
    key(ctrl:down)
    mouse_click(0)
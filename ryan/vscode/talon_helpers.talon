app: vscode
-

## +++++++++++++++++ py talon edit fns .

actions class:
    insert("actions.")

###################### talon edit fns

sleep action <user.number_string>:
    a = "sleep(" + number_string
    b = a + "ms)"
    insert(b)

[(add | new)] key action:
    insert("key()")
    key(left)

[(add | new)] action:
    insert("insert(\"\")")
    key(left:2)

[(add | new)] sleep action:
    insert("sleep(ms)")
    key(left:3)

[(add | new)] insert action:
    insert("insert(\"\")")
    key(left:2)

[(add | new)] code action:
    insert("user.vscode(\"\")")
    key(left:2)

paste code action:
    # mimic("take tail")
    # sleep(500ms)
    mimic("new code action")
    sleep(500ms)
    edit.past()

[insert] (hyper | meta) key [token]:   
    insert("cmd-ctrl-alt-shift-")


copy action id:
    mouse_click(1)
    sleep(500ms)
    key(down:2 enter)

copy action name:
    mouse_click(1)
    sleep(100ms)
    key(down)
    # sleep(300ms)
    # key(down)
    # sleep(300ms)
    # key(down)
    # sleep(300ms)
    # key(enter)

key(cmd-4):                 mimic("copy action id")

key(cmd-3):                 mimic("copy action name")

# key(cmd-2):
#     mimic("copy action id")
#     sleep(300ms)
#     mimic("copy action name")
#     sleep(500ms)
#     mimic("clippy")
#     # mimic("paste one")

(pace | paste) (talon | tellin | talin | command | tall and):
    edit.paste()
    sleep(150ms)
    edit.undo()

(extra word) <user.text>:
    user.paste(" | {text}")

((add | head | pad) word | Edward) <user.text>:
    t = edit.selected_text()
    user.paste("({t} | {text})")
    sleep(200ms)
    key(left)

#from search input 
(filter | filtered) [dot] (talon | tellin | talin | command | tall and) files:
    key(cmd-down)
    sleep(100ms)
    insert(".talon")
    sleep(100ms)
    key(cmd-up)

copy command id: 
    user.copy_command_id()




app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
code.language: talon
- 

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
    (left:2)

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
    insert("user.vscode(\"\")")
    key(left:2)
    sleep(500ms)
    edit.past()

[insert] (hyper | meta) key [token]:
    insert("cmd-ctrl-alt-shift-")

(pace | paste) (talon | tellin | talin | command | tall and):
    edit.paste()
    sleep(150ms)
    edit.undo()

(extra word) <user.text>:
    user.paste(" | {text}")

((add | head) word | Edward) <user.text>:
    t = edit.selected_text()
    user.paste("({t} | {text})")
    sleep(200ms)
    key(left)

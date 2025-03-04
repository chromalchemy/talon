app.name: Code
app.name: Cursor
app.name: Windsurf
- 

#title: /"Keyboard Shortcuts"/


copy command [id] point:
    mouse_click(1)
    sleep(300ms)
    insert("Copy Command ID")
    sleep(500ms)
    key(cmd-enter)

copy command name point:
    mouse_click(1)
    sleep(300ms)
    insert("Copy Command Title")
    sleep(500ms)
    key(cmd-enter)

key(cmd-4):
    mimic("copy command id point")

key(cmd-3):
    mimic("copy command name point")

app.name: Code
app.name: Cursor
app.name: Windsurf
- 

## +++++++++++++++++++++ command panel .

copy command id: 
    user.copy_command_id()

 ## ++++++++++++++++++++++ search input .

(filter | filtered) [dot] (talon | tellin | talin | command | tall and) files:
    key(cmd-down)
    sleep(100ms)
    insert(".talon")
    sleep(100ms)
    key(cmd-up)

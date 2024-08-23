app.name: Roam Research 
mode: command
-

## ++++++++++++++++++++++ insert dates .

insert today: 
    insert("/today")
    sleep(300ms)
    key(enter)
    sleep(100ms)
    key(space)

insert tomorrow: 
    insert("/tomorrow")
    sleep(300ms)
    key(enter)
    sleep(100ms)
    key(space)

(add) date [link]:
    insert("/date picker")
    sleep(300ms)
    key(enter)

## ++++++++++++++++++++ edit block date .

change date point: 
    key(alt:down)
    mouse_click(0)

(teleport | change) [(todo | to do)] date:
    key(alt-shift-t)

## +++++++++++++++++++ go to date page .

## +++++ to to absolute date .

(pick | go to) date: 
    key(alt-shift-j)

go [to] today:  key(ctrl-shift-d)

(open | go) [to] today [in] (sidebar | bar):
    user.run_roam_command("go to today (sidebar)")

## +++++++++++++++++++++ relative date .

go tomorrow:
    key(ctrl-shift-d)
    sleep(500ms)
    key(ctrl-alt-n)
    
go yesterday:
    key(ctrl-shift-d)
    sleep(500ms)
    key(ctrl-alt-p)

go (next day | day next): 
    key(ctrl-alt-n)

# tomorrow not always accurate
(open | go [to]) (next day | day next | tomorrow) [in] (sidebar | bar):
    user.run_roam_command("go to next day (sidebar)")
# yesterday not always accurate
go ((prev | previous | last) day | day (prev | previous | last)):  
    key(ctrl-alt-p)

# yesterday not always accurate
(open | go) [to] ((prev | previous | last) day | day (prev | previous | last) | yesterday)  [in] (sidebar | bar):
    user.run_roam_command("go to previous day (sidebar)")

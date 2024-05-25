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

(add | pick) date:
    insert("/date picker")
    sleep(300ms)
    key(enter)



go [to] today:  key(ctrl-shift-d)

go tomorrow:
    key(ctrl-shift-d)
    sleep(500ms)
    key(ctrl-alt-n)
    
go yesterday:
    key(ctrl-shift-d)
    sleep(500ms)
    key(ctrl-alt-p)

(open | go) [to] today [in] (sidebar | bar):
    key(cmd-p)
    sleep(100ms)
    user.paste("go to today (sidebar)")
    sleep(100ms)
    key(enter)

go (next day | day next): 
    key(ctrl-alt-n)

(open | go) [to] (next day | day next) [in] (sidebar | bar):
    key(cmd-p)
    sleep(100ms)
    user.paste("go to next day (sidebar)")
    sleep(100ms)
    key(enter)

go ((prev | previous | last) day | day (prev | previous | last)):  
    key(ctrl-alt-p)

(open | go) [to] ((prev | previous | last) day | day (prev | previous | last))  [in] (sidebar | bar):
    key(cmd-p)
    sleep(100ms)
    user.paste("go to previous day (sidebar)")
    sleep(100ms)
    key(enter)

app.name: Roam Research 
mode: command
-
settings():
    user.snippet_raw_text_paste = true

## ++++++++++++++++++++++ insert dates .

insert today: 
    user.roam_run_slash_command("today")
    key(space)

insert tomorrow: 
    user.roam_run_slash_command("tomorrow")
    key(space)

(add) date [link]:
    user.roam_run_slash_command("date picker")

## ++++++++++++++++++++ edit block date .

#pops up inline calendar model over date stamp
change date point: 
    key(alt:down)
    mouse_click(0)


(teleport | change) [(todo | to do)] date:
    user.roam_teleport_todo_date_tag()

## +++++++++++++++++++ go to date page .

## +++++ to to absolute date .

#teleport extension
(pick | go [to]) date: 
    user.roam_teleport_todo_block()


## ___________________________________ . deprecated by extension cmds

# go [to] today:  
#     key(ctrl-shift-d)

# (open | go) [to] today [in] (sidebar | bar):
#     user.run_roam_command("go to today (sidebar)")

## +++++++++++++++++++++ go relative date .

# go tomorrow:
#     key(ctrl-shift-d)
#     sleep(500ms)
#     key(ctrl-alt-n)
    
# go yesterday:
#     key(ctrl-shift-d)
#     sleep(500ms)
#     key(ctrl-alt-p)

# go (next day | day next): 
#     key(ctrl-alt-n)

# tomorrow not always accurate
# (open | go [to]) (next day | day next | tomorrow) [in] (sidebar | bar):
#     user.run_roam_command("go to next day (sidebar)")

# yesterday not always accurate
# go ((prev | previous | last) day | day (prev | previous | last)):  
#     key(ctrl-alt-p)

# yesterday not always accurate
# (open | go) [to] ((prev | previous | last) day | day (prev | previous | last) | yesterday)  [in] (sidebar | bar):
#     user.run_roam_command("go to previous day (sidebar)")


## ++++++++++++++++++++++ add date to block 


add date [stamp] [to block]: 
    user.roam_insert_snippet("templateVar", "date")
    key(esc)
   
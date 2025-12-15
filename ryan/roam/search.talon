app.name: Roam Research 
mode: command
-

# todo: currently disabled, extension not loaded?

page blocks [panel]: 
    key(cmd-shift-p)

page (refs | references) [panel]: 
    key(cmd-shift-p)
    sleep(500ms)
    insert("@")


## +++++++ pop up (cross graph) search .

((globe | global) hunt | hunt (graph | graphs | (globe | global))) [<user.text>]:
    key(cmd-shift-u)
    sleep(200ms)
    user.paste(text or "")

open result: 
    key(shift-enter)

open result pop: 
    key(enter)

open all results: 
    key(alt-enter)

## ++++++++++++++ top bar quick search .

(hunt | search) [<user.text>]:
    key(cmd-u)
    sleep(300ms)
    user.paste(text or "")

(hunt | search) (paste | pace):
    key(cmd-u)
    sleep(200ms)
    edit.paste()
    

open (search [result] | result) [in] (sidebar | bar) | (sidebar | bar) (search | result):
    key(shift-enter)
    
#traditional page search
(hunt | search) page [<user.text>]: 
    key(cmd-f)
    sleep(400ms)
    insert(text or "")

exit [page] (hunt | search): 
    key(cmd-enter)

#search+
(hunt | search) advanced: 
    key(ctrl-shift-p)


# -------------- native "advanced" block ref search

(hunt | search) block (refs | ref): 
    key(ctrl-shift-9)

search (up | parent): 
    key(shift-tab)

search (down | child | children)
    key(tab)

#---------- find and replace extension search page or workspace
search workspace: 
    key(ctrl-s)

search (whole | entire) graph: 
    user.run_roam_command("wgs")

#search pages block
^new search block$:
    user.roam_insert_tag("search")
    sleep(100ms)
    key(escape)


#roam portal search
(go | open | search | toggle | show | hide) portal: 
    key(cmd-ctrl-alt-shift-p)

#search roam graph visualization
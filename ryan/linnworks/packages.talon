app: chrome
title: /PackagingGroups/
-
;; for linnworks packaging groups config web ui 

(pace | paste) [to] cell: 
    mouse_click(0)
    mouse_click(0)
    edit.select_all()
    edit.paste()

<user.number_string> by <user.number_string>:
    insert("{user.number_string_1} x {user.number_string_2}")


edit [(field | cell | so)]:
    mouse_click(0)
    mouse_click(0)

(the | d | de  | dee ) [(num | numb)] <user.number_string>: 
    print(user.number_string)
    mouse_click(0)
    mouse_click(0)
    sleep(300ms) 
    insert(user.number_string)
    sleep(300ms)
    key(enter)

(the | d | de  | dee ) zero: 
    mouse_click(0)
    mouse_click(0)
    sleep(300ms) 
    insert("0")
    sleep(300ms)
    key(enter)

<user.number_string> (inch | inches):
    insert("{user.number_string}\"")

new type | (add | dead | dad) new:
    user.rango_run_action_on_reference("clickElement", "new")
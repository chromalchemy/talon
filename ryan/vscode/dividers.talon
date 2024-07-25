app.name: Code
-

(insert | add | make | new) divider line: 
    user.vscode("comment-divider.insertSolidLine")

(insert | add | make | new) [divider] header [<user.text>]: 
    insert("{text or ''}")
    sleep(100ms)
    user.vscode("comment-divider.makeSubHeader")

(talon | talent) (subhead | subheader) pretext: 
    insert("## ++++++++++++++++++")

next (stop | placeholder | place [holder]): 
    key(tab)

last (stop | placeholder | place [holder]):
    key(shift-tab)

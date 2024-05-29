app.name: Roam Research 
mode: command
-

###sidebar


(toggle | hide | show | close | open | reveal) ((sidebar | bar) | side bar) :
    key(cmd-/)

swap ((sidebar | bar) | main) [with ((sidebar | bar) | main)]:
    key(cmd-p)
    sleep(100ms)
    user.paste("wb sidebars - swap with main window (swap)")
    sleep(100ms)
    key(enter)  

(expand | collapse | fold) [all] ((sidebar | bar) | side bar):
    key(cmd-p)
    sleep(100ms)
    user.paste("toggle expand sidebar")
    sleep(100ms)
    key(enter)  

#switch+ sidebar
# (sidebar |  side bar) panel: 
#     key(cmd-shift-p)
#     sleep(500ms)
#     insert("r:")

open [(ref | reference | link)] in (sidebar | bar): 
    key(ctrl-shift-o)

open [this] page [in] sidebar: 
    key(cmd-p)
    sleep(100ms)
    user.paste("wb open page in sidebar")
    sleep(100ms)
    key(enter)

(clear | kill) (sidebar | bar): key(ctrl-l)


open {user.roam_tag} [in] sidebar | bar {user.roam_tag}:
    key(cmd-u)
    # sleep(100ms)
    insert("{roam_tag}")
    sleep(500ms)
    key(shift-enter)
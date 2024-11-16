app.name: Roam Research 
mode: command
-

## +++++++++++++++++++++++ hide / show .

(toggle | hide | show | close | open | reveal) ((sidebar | bar) | side bar) | bar (show | hide) | (barca | bar read | bared) :
    key(cmd-/)

(clear | kill) (sidebar | bar): key(ctrl-l)

(close | kill | chuck) (pinned sidebar | sidebar force) :
    mouse_click(0)
    sleep(100ms)
    key(enter)

## ++++++++++++++++++++++++++++++ swap .

swap ((sidebar | bar) | main) [with ((sidebar | bar) | main)]:
    user.run_roam_command("wb sidebars - swap with main window (swap)")

#switch+ sidebar
# (sidebar |  side bar) panel: 
#     key(cmd-shift-p)
#     sleep(500ms)
#     insert("r:")

## +++++++++++++++++++++++++++ folding .

(expand | collapse | fold) [all] ((sidebar | bar) | side bar):
    user.run_roam_command("toggle")

## +++++++++++++++++++ open in sidebar .

#shift click to open link in sidebar
[open] [(ref | reference | link | tag)] [in] (sidebar | bar) point: 
    key(shift:down)
    mouse_click(0)

#works when cursor is in or adjacent to reference id text
open [(ref | reference | link)] in (sidebar | bar): 
    key(ctrl-shift-o)

# open current page
open [this] page [in] sidebar: 
    user.run_roam_command("wb open page in sidebar")

open {user.ryan.roam.tags.list} [in] (sidebar | bar ) | bar {user.ryan.roam.tags.list}:
    key(cmd-u)
    # sleep(100ms)
    insert("{user.ryan.roam.tags.list}")
    sleep(500ms)
    key(shift-enter)

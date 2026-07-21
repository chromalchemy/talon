app.name: Roam Research 
mode: command
-

(toggle | hide | show | close | open | reveal) left ((sidebar | bar) | side bar) | bar (show | hide) | (barca | bar read | bared) | left (barca | bar read | bared |  bar) :
    key(cmd-\)

## +++++++++++++++++++++++ hide / show .

(toggle | hide | show | close | open | reveal) ((sidebar | bar) | side bar) | bar (show | hide) | (barca | bar read | bared) | right (barca | bar read | bared |  bar) :
    key(cmd-/)

(clear | kill) [all] ((side bar |sidebar | sidebars)  | (bar | bars) ): 
    key(ctrl-l)

(close | kill | chuck) (pinned sidebar | sidebar force) [(here | point)] :
    mouse_click(0)
    sleep(100ms)
    key(enter)

## ++++++++++++++++++++++++++++++ swap .

swap ((sidebar | bar) | main) [(with | and) ((sidebar | bar) | main)]:
    user.run_roam_command("wb sidebars - swap with main window (swap)")

#switch+ sidebar
# (sidebar |  side bar) panel: 
#     key(cmd-shift-p)
#     sleep(500ms)
#     insert("r:")

## +++++++++++++++++++++++++++ fold sidebars (not nodes in sidebar) .

(expand | collapse | fold | unfold) [all] ((side bar |sidebar | sidebars)  | (bar | bars) ) :
    user.run_roam_command("Clear Sidebar: Toggle Collapse All")

## +++++++++++++++++++ open in sidebar .

#shift click to open link in sidebar
[open] [(ref | reference | link | tag)] [in] (sidebar | bar) point | bar (ref | reference) point: 
    key(shift:down)
    mouse_click(0)

#works when cursor is in or adjacent to reference id text
# cant find command (extension based?)
# open [(ref | reference | link | block)] in (sidebar | bar) | (sidebar | bar) block: 
#     key(ctrl-shift-o)

# open current page
open [this] page [in] sidebar | bar page: 
    user.run_roam_command("wb open page in sidebar")

# deprecated, using roam api
# open {user.roam_tag} [in] (sidebar | bar ) | bar {user.roam_tag}:
#     key(cmd-u)
#     # sleep(100ms)
#     insert("{user.roam_tag}")
#     sleep(500ms)
#     key(shift-enter)

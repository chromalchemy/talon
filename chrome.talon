app: chrome
-
tag(): browser

(toggle | hide | show | open) (devtools | dev tools | console): key(cmd-alt-i)

go (bookmarks | marks): browser.bookmarks()

(toggle | hide | show) bookmarks: browser.bookmarks_bar()

#Doesn't work in search bar
(choose | pick | hello) <user.number>: 
    # key(down:{number})
    insert("hello")

search (bookmarks | bookmark | marks) [<user.text>]:
    key(cmd-l)
    sleep(100ms)
    insert("@bookmarks")
    key(space)
    sleep(100ms)
    insert(text)


copy [link] (address | url) (link | point | here)$:
    mouse_click(1)
    sleep(100ms)
    insert("copy link address")
    # sleep(100ms)
    key(enter)  

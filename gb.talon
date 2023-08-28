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


### gb

(search | open) (products | prods): user.open_url("https://store-7hstasnrjg.mybigcommerce.com/manage/products")

[open] edit product [page]:
    key(cmd-l)
    sleep(100ms)
    insert("@bookmarks")
    key(space)
    sleep(100ms)
    insert("edit prod+")
    sleep(100ms)
    key(tab enter)

[(open |  go)] (local | localhost) (view | page):
    key(cmd-l)
    sleep(100ms)
    insert("@bookmarks")
    key(space)
    sleep(100ms)
    insert("->Local - j")
    sleep(100ms)
    key(tab enter)

[( open |  go)] (live | remote) (view | page):
    key(cmd-l)
    sleep(100ms)
    insert("@bookmarks")
    key(space)
    sleep(100ms)
    insert("->Live - j")
    sleep(100ms)
    key(tab enter)


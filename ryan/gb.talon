app: chrome
-
tag(): browser
    
#open js bookmarklet links (parses page for input data)

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

# constant contact editor
email (add block | adblock | insert | paste) link: 
    mouse_click(0)
    sleep(100ms)
    key(down)
    key(enter)
    sleep(100ms)
    edit.select_all()
    edit.paste()
    sleep(30ms)
    key(enter)
    
(paste | pace | insert) get bit address: 
    insert("https://getbitoutdoors.com")
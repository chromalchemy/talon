app: chrome
-
tag(): browser
    
#open js bookmarklet links (parses page for input data)

[open] {user.ryan.gb.browser.bookmarks.list} [page]:
    user.load_bookmark("{user.ryan.gb.browser.bookmarks.list}")

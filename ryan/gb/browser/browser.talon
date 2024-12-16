app: chrome
-
tag(): browser
    
#open js bookmarklet links (parses page for input data)

[open] mark {user.ryan.gb.browser.bookmarks.list}:
    user.load_bookmark("{user.ryan.gb.browser.bookmarks.list}")

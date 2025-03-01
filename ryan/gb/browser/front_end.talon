app: chrome
browser.host: getbitoutdoors.com
-
tag(): browser

## +++++++ toggle local and live views .

[(open |  go)] (local | localhost) (view | page):
    user.load_bookmark("->Local - j")

[( open |  go)] (live | remote) (view | page):
    user.load_bookmark("->Live - j")

## ++++++++++++++++++++++ edit product .

edit product:
    user.load_bookmark("edit prod+")



    
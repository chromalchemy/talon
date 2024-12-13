app: chrome
-
tag(): browser

## +++++++ toggle local and live views .

[(open |  go)] (local | localhost) (view | page):
    user.load_bookmark("->Local - j")

[( open |  go)] (live | remote) (view | page):
    user.load_bookmark("->Live - j")
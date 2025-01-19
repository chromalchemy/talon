app.name: Code
app.name: Cursor
app.name: Windsurf
-

please (paredit | pare edit | pear edit):
    key(cmd-shift-p)
    insert("calva paredit ")

open [(paredit | pare edit | pear edit)] list: user.vscode("paredit.openList")

toggle (paredit | pare edit | pear edit) [mode]:
    user.vscode("paredit.togglemode")

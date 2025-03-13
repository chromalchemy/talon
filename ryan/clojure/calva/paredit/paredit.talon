app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

please (paredit | pare edit | pear edit):
    key(cmd-shift-p)
    insert("calva paredit ")

open [(paredit | pare edit | pear edit)] list: user.run_rpc_command("paredit.openList")

toggle (paredit | pare edit | pear edit) [mode]:
    user.run_rpc_command("paredit.togglemode")

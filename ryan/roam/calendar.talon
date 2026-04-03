app.name: Roam Research
mode: command
-

calendar reminder | set reminder:
    key(cmd-p)
    sleep(150ms)
    insert("Full Calendar: Set Reminder")
    sleep(150ms)
    key(enter)

calendar (show | hide | toggle) [main]:
    key(cmd-p)
    sleep(150ms)
    insert("Full Calendar: Display/Hide in main window")
    sleep(150ms)
    key(enter)

calendar (show | hide | toggle) (bar | sidebar):
    key(cmd-p)
    sleep(150ms)
    insert("Full Calendar: Display/Hide in Sidebar")
    sleep(150ms)
    key(enter)

calendar sync [google]:
    key(cmd-p)
    sleep(150ms)
    insert("Full Calendar: Sync to default Google calendar")
    sleep(150ms)
    key(enter)

calendar settings:
    key(cmd-p)
    sleep(150ms)
    insert("Roam Depot Extension Settings: Full Calendar")
    sleep(150ms)
    key(enter)

app.name: Roam Research
mode: command
-

calendar reminder | set reminder:
    user.run_roam_command("Full Calendar: Set Reminder")

calendar (show | hide | toggle) [main] | (show | hide | toggle) [main] calendar:
    user.run_roam_command("Full Calendar: Display/Hide in main window")

bar calendar:
    user.run_roam_command("Full Calendar: Display/Hide in Sidebar")

sync calendar [to] [google] [calendar] | sync google calendar:
    user.run_roam_command("Full Calendar: Sync to default Google calendar")

[go] calendar (settings | options | config):
    user.run_roam_command("Roam Depot Extension Settings: Full Calendar")

app.name: Roam Research 
mode: command
-
depot (market | marketplace | store):
    user.run_roam_command("Roam Depot Marketplace")

depot (market | marketplace | store) <user.text>:
    user.run_roam_command("Roam Depot Marketplace")
    insert(text)

depot settings:
    user.run_roam_command("Roam Depot Settings")

please (depot | extension) settings:
    user.roam_find_command("Roam Depot Extension Settings ")

[please] (depot | [individual] extension) settings <user.text>:
    user.roam_find_command("Roam Depot Extension Settings ")
    insert(text)
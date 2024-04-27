open display panel: 
    key(cmd-space)
    sleep(300ms)
    insert("displays")
    key(enter)


(toggle | enter | leave | exit) [system] dark mode:
    key(cmd-space)
    sleep(100ms)
    insert("toggle system appearance")
    sleep(100ms)
    key(enter)

## ++++++++++++++++ adjust night shift .

[make | set] ((display | screen) (temperature | temp) | (nightshift | night shift)) <user.number_string>:
    user.system_command_nb("nightlight temp {number_string}")

toggle (nightshift | night shift | night light | [(display | screen)] (temperature | temp)):
    user.system_command_nb("nightlight toggle") 

## +++++++++++++++++ adjust brightness .

[(screen | display)] (brightness | brightens | brighten) up | brighten [up] (screen | display):
    key(f15)

[(screen | display)] (brightness | brighten | brightens | Brighton) down | dim [down] (screen | display):
    key(f14)

[(screen | display)] (brightness | brighten | brightens | Brighton) single <user.number_string>:
    user.system_command_nb("brightness 0.0{number_string}")

[(screen | display)] (brightness | brighten | brightens | Brighton) <user.number_string>:
    user.system_command_nb("brightness 0.{number_string}")
    

(screen | display) (brightness | brighten | brightens | Brighton) full:
    user.system_command_nb("brightness 1")
        
round (string | rap | wrap | text) <user.prose>:
    insert("({prose})")


(print display [name] | prentice play name) [{user.ryan.display.display_name.list}]:
    user.betterdisplay_print_display_name("{user.ryan.display.display_name.list or 'default'}")

open (display | displays) panel: 
    user.run_raycast_command("displays")

## +++++++++++++++++++++++++ dark mode .

toggle [system] dark mode:
    user.betterdisplay_toggle("darkMode", "default")

dark mode [on] | enter dark mode:
    user.betterdisplay_set("darkMode=on", "default")

dark mode off | light mode | (exit | leave) dark mode:
    user.betterdisplay_set("darkMode=off", "default")

## ++++++++++++++++  night shift 

[make | set] (nightshift | (night | nat) (shift | if | light) | system | macbook) [(temperature | temp)] <user.number_string>:
    user.betterdisplay_set("nightShiftValue=0.{number_string}", "default")

(nightshift | (night | nat) (shift | if | light) | system | macbook) [(temperature | temp)] up <user.number_string>:
    user.betterdisplay_set("nightShiftValue=0.{number_string} --offset", "default")

(nightshift | (night | nat) (shift | if | light) | system | macbook) [(temperature | temp)] down <user.number_string>:
    user.betterdisplay_set("nightShiftValue=-0.{number_string} --offset", "default")



[make | set] (nightshift | (night | nat) (shift | if | light) | system | macbook) [(temperature | temp)] (max | full | [one] hundred | 100):
    user.betterdisplay_set("nightShiftValue=1", "default")

[make | set] (nightshift | (night | nat) (shift | if | light) | system | macbook) [(temperature | temp)] default:
    user.betterdisplay_set("nightShiftValue=0.50", "default")

toggle (nightshift | night (shift  |  ship) | night light | nat if | system (temperature | temp)):
    user.betterdisplay_toggle("nightShift", "default")

(nightshift | night (shift  |  ship) | night light | nat if) [(temperature | temp)] on:
    user.betterdisplay_set("nightShift=on", "default")

(nightshift | night (shift  |  ship) | night light | nat if) [(temperature | temp)] off:
    user.betterdisplay_set("nightShift=off", "default")

# user.system_command_nb("nightlight toggle")


## +++++++++++++++ hardware brightness .

# user.system_command_nb("brightness 0.0{number_string}")Brain is five

# [(system | macbook)] (brightness | brightens | brighten) up | brighten [up] (system | macbook):
#     key(f15)

# [(system | macbook)] (brightness | brighten | brightens | Brighton) down | dim [down] (system | macbook):
#     key(f14)

[{user.ryan.display.display_name.list}] (hardware | hard) (brightness | brighten | brightens | Brighton) <user.number_string> :
    user.betterdisplay_set("hardwareBrightness={number_string}%", "{user.ryan.display.display_name.list or 'default'}")

[{user.ryan.display.display_name.list}] (hardware | hard) (brightness | brighten | brightens | Brighton) (full | max):
    user.betterdisplay_set("hardwareBrightness=100%", "{user.ryan.display.display_name.list or 'default'}")

## ++++++++++++++++ software brightnss .

[{user.ryan.display.display_name.list}] [(soft | software)] (brightness | brighten | brightens | Brighton) up [<user.number_string>]:
    user.betterdisplay_set("softwareBrightness={number_string or '5'}% --offset", "{user.ryan.display.display_name.list or 'default'}")

[{user.ryan.display.display_name.list}] [(soft | software)] (brightness | brighten | brightens | Brighton) down [<user.number_string>]:
    user.betterdisplay_set("softwareBrightness=-{number_string or '5'}% --offset", "{user.ryan.display.display_name.list or 'default'}")

[{user.ryan.display.display_name.list}] [(soft | software)] (brightness | brighten | brightens | Brighton) <user.number_string>:
    user.betterdisplay_set("softwareBrightness={number_string}%", "{user.ryan.display.display_name.list or 'default'}")

[{user.ryan.display.display_name.list}] [(soft | software)] (brightness | brighten | brightens | Brighton) (full | max):
    user.betterdisplay_set("softwareBrightness=100%", "{user.ryan.display.display_name.list or 'default'}")
 

## +++++++++++++++ brightness defaults .

[macbook] [(display | screen)] (brightness | brightens) default [library]:
    user.betterdisplay_set("hardwareBrightness=100%", "default")
    sleep(700ms)
    user.betterdisplay_set("softwareBrightness=51%", "default")

[(lib | library | hp)] [(display | screen)] (brightness | brightens) default: 
    user.betterdisplay_set("hardwareBrightness=100%", "HP ALL-in-One")
    sleep(700ms)
    user.betterdisplay_set("softwareBrightness=66%", "HP ALL-in-One")

library (all | both) [(screen | screens | display | displays)] (brightness | brightens) (default | defaults): 
    user.betterdisplay_set("hardwareBrightness=100%", "default")
    sleep(800ms)
    user.betterdisplay_set("softwareBrightness=51%", "default")
    sleep(800ms)
    user.betterdisplay_set("hardwareBrightness=100%", "HP ALL-in-One")
    sleep(800ms)
    user.betterdisplay_set("softwareBrightness=66%", "HP ALL-in-One")

[(ace | acer)] [(display | screen)] [(brightness | brightens)] default: 
    user.betterdisplay_set("softwareBrightness=50%", "Acer XF270H B")

## +++++++++++++++++++++++ adjustments .

[{user.ryan.display.display_name.list}] (suspend | pause | disable | turn off) (screen | display) [image] adjustments:
    user.betterdisplay_set("suspendImageAdjustments=on", "{user.ryan.display.display_name.list or 'default'}")

[{user.ryan.display.display_name.list}] (resume | un pause | enable | turn on) (screen | display) [image] adjustments:
    user.betterdisplay_set("suspendImageAdjustments=off", "{user.ryan.display.display_name.list or 'default'}")

## ++++++++++++++++++++++++++ contrast .

[{user.ryan.display.display_name.list}] (screen | display) contrast <user.number_string>:
    user.betterdisplay_set("contrast={number_string}%", "{user.ryan.display.display_name.list or 'default'}")

[{user.ryan.display.display_name.list}] (screen | display) contrast negative <user.number_string>:
    user.betterdisplay_set("contrast=-{number_string}%", "{user.ryan.display.display_name.list or 'default'}") 

[{user.ryan.display.display_name.list}] (screen | display) contrast max:
    user.betterdisplay_set("contrast=90%", "{user.ryan.display.display_name.list or 'default'}")

## ++++++++++++++++++++++++++ gain .

[{user.ryan.display.display_name.list}] (screen | display) (amplitude | amp) <user.number_string>:
    user.betterdisplay_set("gain={number_string}%", "{user.ryan.display.display_name.list or 'default'}")
    
[{user.ryan.display.display_name.list}] (screen | display) (amplitude | amp) negative <user.number_string>:
    user.betterdisplay_set("gain=-{number_string}%", "{user.ryan.display.display_name.list or 'default'}") 
    
[{user.ryan.display.display_name.list}] (screen | display) (amplitude | amp) max:
    user.betterdisplay_set("gain=100%", "{user.ryan.display.display_name.list or 'default'}")

## +++++++++++++++++++++++++ inversion .

[{user.ryan.display.display_name.list}] (screen | display) invert | invert (screen | display) :
    user.betterdisplay_toggle("inverted", "{user.ryan.display.display_name.list or 'default'}")

## ++++++++++++++++++++++++++ gamma .

[{user.ryan.display.display_name.list}] (screen | display) (gamma | game) <number>:
    n = number * 0.8
    user.betterdisplay_set("gamma={n}%", "{user.ryan.display.display_name.list or 'default'}")
    
[{user.ryan.display.display_name.list}] (screen | display) (gamma | game) negative <number>:
    n = number * 0.8
    user.betterdisplay_set("gamma=-{n}%", "{user.ryan.display.display_name.list or 'default'}")
    
[{user.ryan.display.display_name.list}] (screen | display) (gamma | game) max:
    user.betterdisplay_set("gamma=80%", "{user.ryan.display.display_name.list or 'default'}")

## ++++++++++++++++++++++++++ temperature .

[{user.ryan.display.display_name.list}] (screen | display) (temperature | temp) <number>:
    n = number / 2
    user.betterdisplay_set("temperature={n}%", "{user.ryan.display.display_name.list or 'default'}")
    
[{user.ryan.display.display_name.list}] (screen | display) (temperature | temp) negative <number>:
    n = number / 2
    user.betterdisplay_set("temperature=-n%", "{user.ryan.display.display_name.list or 'default'}") 
    
[{user.ryan.display.display_name.list}] (screen | display) (temperature | temp) max:
    user.betterdisplay_set("temperature=50%", "{user.ryan.display.display_name.list or 'default'}")

## ++++++++++++++++++++++++++++++ iris .

# [(iris | eye | i | screen | display)] (brightness | brighten | brightens | Brighton) <user.number_string>: 
#     user.system_command_nb("open iris://sb-{number_string}")

# (iris | eye | i | screen | display) (temperature | temp) <user.number_string>: 
#     user.system_command_nb("open iris://st-{number_string}")
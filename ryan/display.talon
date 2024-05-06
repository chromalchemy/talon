
open display panel: 
    key(cmd-space)
    sleep(300ms)
    insert("displays")
    key(enter)

## +++++++++++++++++++++++++ dark mode .

toggle [system] dark mode:
    user.betterdisplay_toggle("darkMode")

dark mode [on] | enter dark mode:
    user.betterdisplay_set("darkMode=on")

dark mode off | light mode | (exit | leave) dark mode:
    user.betterdisplay_set("darkMode=off")

## ++++++++++++++++  night shift 

[make | set] (nightshift | night shift | night light | nat if | system | macbook) [(temperature | temp)] <user.number_string>:
    user.betterdisplay_set("nightShiftValue=0.{number_string}")

(nightshift | night shift | night light | nat if) [(temperature | temp)] up <user.number_string>:
    user.betterdisplay_set("nightShiftValue=0.{number_string} --offset")

(nightshift | night shift | night light | nat if) [(temperature | temp)] down <user.number_string>:
    user.betterdisplay_set("nightShiftValue=-0.{number_string} --offset")
    

[make | set] (nightshift | night shift | night light | nat if | system | macbook) [(temperature | temp)] (max | full | [one] hundred | 100):
    user.betterdisplay_set("nightShiftValue=1")

toggle (nightshift | night shift | night light | nat if | system (temperature | temp)):
    user.betterdisplay_toggle("nightShift")

(nightshift | night shift | night light | nat if) [(temperature | temp)] on:
    user.betterdisplay_set("nightShift=on")

(nightshift | night shift | night light | nat if) [(temperature | temp)] off:
    user.betterdisplay_set("nightShift=off")

# user.system_command_nb("nightlight toggle")


## +++++++++++++++ hardware brightness .

# user.system_command_nb("brightness 0.0{number_string}")Brain is five

# [(system | macbook)] (brightness | brightens | brighten) up | brighten [up] (system | macbook):
#     key(f15)

# [(system | macbook)] (brightness | brighten | brightens | Brighton) down | dim [down] (system | macbook):
#     key(f14)

(hardware | hard) (brightness | brighten | brightens | Brighton) <user.number_string>:
    user.betterdisplay_set("hardwareBrightness={number_string}%")

(hardware | hard) (brightness | brighten | brightens | Brighton) (full | max):
    user.betterdisplay_set("hardwareBrightness=100%")

## ++++++++++++++++ software brightnss .

[(soft | software)] (brightness | brighten | brightens | Brighton) up [<user.number_string>]:
    user.betterdisplay_set("softwareBrightness={number_string or '5'}% --offset")

[(soft | software)] (brightness | brighten | brightens | Brighton) down [<user.number_string>]:
    user.betterdisplay_set("softwareBrightness=-{number_string or '5'}% --offset")

[(soft | software)] (brightness | brighten | brightens | Brighton) <user.number_string>:
    user.betterdisplay_set("softwareBrightness={number_string}%")

[(soft | software)] (brightness | brighten | brightens | Brighton) (full | max):
    user.betterdisplay_set("softwareBrightness=100%")
 
## ++++++++++++++++++++++++++ contrast .

(screen | display) contrast <user.number_string>:
    user.betterdisplay_set("contrast={number_string}%")
    
(screen | display) contrast negative <user.number_string>:
    user.betterdisplay_set("contrast=-{number_string}%") 
    
(screen | display) contrast max:
    user.betterdisplay_set("contrast=100%")

## ++++++++++++++++++++++++++ gain .

(screen | display) amp <user.number_string>:
    user.betterdisplay_set("gain={number_string}%")
    
(screen | display) amp negative <user.number_string>:
    user.betterdisplay_set("gain=-{number_string}%") 
    
(screen | display) amp max:
    user.betterdisplay_set("gain=100%")

## +++++++++++++++++++++++++ inversion .

(screen | display) invert | invert (screen | display) :
    user.betterdisplay_toggle("inverted")

## ++++++++++++++++++++++++++ gamma .

(screen | display) (gamma | game) <number>:
    n = number * 0.8
    user.betterdisplay_set("gamma={n}%")
    
(screen | display) (gamma | game) negative <number>:
    n = number * 0.8
    user.betterdisplay_set("gamma=-{n}%")
    
(screen | display) gamma max:
    user.betterdisplay_set("gamma=100%")

## ++++++++++++++++++++++++++ temperature .

(screen | display) (temperature | temp) <number>:
    n = number / 2
    user.betterdisplay_set("temperature={n}%")
    
(screen | display) (temperature | temp) negative <number>:
    n = number / 2
    user.betterdisplay_set("temperature=-n%") 
    
(screen | display) (temperature | temp) max:
    user.betterdisplay_set("temperature=100%")

## ++++++++++++++++++++++++++++++ iris .

# [(iris | eye | i | screen | display)] (brightness | brighten | brightens | Brighton) <user.number_string>: 
#     user.system_command_nb("open iris://sb-{number_string}")

# (iris | eye | i | screen | display) (temperature | temp) <user.number_string>: 
#     user.system_command_nb("open iris://st-{number_string}")
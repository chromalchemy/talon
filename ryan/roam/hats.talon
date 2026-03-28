app.name: Roam Research 
mode: command
-

^(hat | hats | nav | deep nav [hats] | block point | block hats | show hats)$: 
    user.roam_bb_task("bridge --on")

hide hats | hats off:
    user.roam_bb_task("bridge --off")

((deep | do you) grab | go) <user.number_string>: 
    user.roam_bb_task("bridge --select {number_string}")
    
((deep | do you ) grab | go)  <user.letter>:
    user.roam_bb_task("bridge --select {letter}")

((deep | do you ) grab | go)  <user.letters>:
    user.roam_bb_task("bridge --select {letters}")    

((deep | do you ) grab | go)  <user.letter> <user.number_key>:
    user.roam_bb_task("bridge --select {letter}{number_key}")

((deep | do you ) grab | go)  <user.number_key> <user.number_key>:
    user.roam_bb_task("bridge --select {number_key}{number_key}")

## ++++++++++++++++++++++++++++++ fold .

(fold | collapse) <user.number_string>: 
    insert(number_string)
    sleep(300ms)
    key(cmd-up)
    
(fold | collapse)  <user.number_key>:
    key(number_key)
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-up)

(fold | collapse) (single | small)  <user.number_key>:
    key(number_key)
    sleep(300ms)
    key(cmd-up)

(fold | collapse) <user.number_key> <user.number_key>:
    key(number_key_1 number_key_2)
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-up)
    
(fold | collapse)  <user.letter>:
    key("{letter}")
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-up)

(fold | collapse) (single | small)  <user.letter>:
    key("{letter}")
    sleep(300ms)
    key(cmd-up)
    
(fold | collapse)  <user.letter> <user.letter>:
    key("{letter_1} {letter_2}")
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-up)

(fold | collapse)  <user.letter> <user.number_key>:
    key("{letter} {number_key}")
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-up)

## ++++++++++++++++++++++++++++ unfold .

(unfold | expand) <user.number_string>: 
    insert(number_string)
    sleep(300ms)
    key(cmd-down)
    
(unfold | expand)  <user.number_key>:
    key(number_key)
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-down)

(unfold | expand) (single | small)  <user.number_key>:
    key(number_key)
    sleep(300ms)
    key(cmd-down)

(unfold | expand) <user.number_key> <user.number_key>:
    key(number_key_1 number_key_2)
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-down)
    
(unfold | expand)  <user.letter>:
    key("{letter}")
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-down)

(unfold | expand) (single | small)  <user.letter>:
    key("{letter}")
    sleep(300ms)
    key(cmd-down)
    
(unfold | expand)  <user.letter> <user.letter>:
    key("{letter_1} {letter_2}")
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-down)

(unfold | expand)  <user.letter> <user.number_key>:
    key("{letter} {number_key}")
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-down)
    

## +++++++++++++++++ zoom block by hat .


(zoom | focus) <user.number_string>: 
    insert(number_string)
    sleep(300ms)
    key(cmd-.)
    
    
(zoom | focus)  <user.number_key>:
    key(number_key)
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-.)

(zoom | focus) (single | small)  <user.number_key>:
    key(number_key)
    sleep(300ms)
    key(cmd-.)

(zoom | focus) <user.number_key> <user.number_key>:
    key(number_key_1 number_key_2)
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-.)
    
(zoom | focus)  <user.letter>:
    key("{letter}")
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-.)

(zoom | focus) (single | small)  <user.letter>:
    key("{letter}")
    sleep(300ms)
    key(cmd-.)
    
(zoom | focus)  <user.letter> <user.letter>:
    key("{letter_1} {letter_2}")
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-.)

(zoom | focus)  <user.letter> <user.number_key>:
    key("{letter} {number_key}")
    sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-.)


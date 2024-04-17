title: /Flowstorm debugger/
-

(kill | clear) ((flow | flows) state | (flow | flows)): 
    key(ctrl-l) 

toggle (debug mode | console logging):
    key(ctrl-d)

unblock (breakpoints | threads):
    key(ctrl-u)

cancel task:
    key(ctrl-g)

## ++++++++++++++++++++++ customize ui .

(font | text) size up: 
    key(ctrl-+)
(font | text) size down: 
    key(ctrl--)

(rotate | next) theme: 
    key(ctrl-t)

## ++++++++++++++++++++++++ tool modes .

flows (tool | view | pane | pain | tab):
    key(shift-f)

browser (tool | view | pane | pain | tab): 
    key(shift-b)

taps (tool | view | pane | pain | tab): 
    key(shift-t)

(docs | documentation) (tool | view | pane | pain | tab): 
    key(shift-d)

## +++++++++++++++++++++++++++++ flows .

(go | open) thread <number_small>:
    key(number_small)


## +++++++++++ flow inspector sub tabs .

tree (tool | view | pane | pain | tab):
    key(t)

code (tool | view | pane | pain | tab):
    key(c)

(function |  functions) (tool | view | pane | pain | tab): 
    key(f)

## ++++++++++++++++++++++++++ stepping .

step last (over | same): 
    key(shift-p)

step last:
    key(p)

step [next]: 
    key(n)

step [next] (over | same):
    key(shift-n)

step out:
    key(^)

step first:
    key(<)

step end:
    key(>)

## ++++++++++++++++++++++++++++++ copy .
    
(copy | carve) (function | fun) (symbol | name) [here]:
    key(ctrl-f)

(copy | carve) (function | fun) (call | form | code) [here]: 
    key(ctrl-shift-f)

## +++++++++++++++++++++ undo/redo nav .

(undo | go back): 
    key(ctrl-z)

(redo | go (fore | forward)):
    key(ctrl-r)

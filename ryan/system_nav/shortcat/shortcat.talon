
#show targets
(target | shortcat | cat) [point] | cat point: 
    user.shortcat_popup()

#pick target
(shortcat | cat) [(pick | pic)] <user.letters>:
    user.shortcat_pick_letters(letters)

#pick number from popup menu menu
(shortcat | cat) [(pick | pic)] [item] <number>:
    user.shortcat_pick_number(number)

#refresh menu
(short | target) refresh: 
    user.shortcat_refresh()  
    


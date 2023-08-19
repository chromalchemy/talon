mode: dictation
and mode: command
-

# testing mixed: key(s)

# generic "phrase... over" command for mixed mode
^<user.text> over: 
    user.add_phrase_to_history(text)
    insert(text)



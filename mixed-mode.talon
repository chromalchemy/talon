mode: dictation
and mode: command
-

# testing mixed: key(s)

# generic "phrase... over" command for mixed mode
# phrase interferes with "over" Commands in formatters file
^<user.text> (phrase | text) over: 
    user.add_phrase_to_history(text)
    insert(text)

    



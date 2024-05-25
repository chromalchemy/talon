app.name: Roam Research 
mode: command
-
## +++++++++++++++++++++ select blocks .


select all blocks: key(cmd-shift-a)


# Select the block above where the cursor is placed

# Shift
# Up
# Select the block below where the cursor is placed

# Shift
# Down
# Select all blocks

# Cmd
# Shift
# A

## ++++++++++++++++++++++ multi select .

[toggle] (multi select | select (multi | multiple [blocks])) [(off | on)]: key(cmd-m)

(toggle | exit | enter) multi [select] | select (blocks | (multi | multiple) [blocks]) | multi select: 
    key(cmd-m)

[exit] ((multi | multiple) select | multiselect) | select (multi | multiple) [blocks]:  
    key(cmd-m)



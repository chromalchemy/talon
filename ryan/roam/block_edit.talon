app.name: Roam Research 
mode: command
-

# edit.paragraph_start()
# edit.jump_line
# edit.sentence_start

## +++++++++++++ navigate within block .

[go] (block end | post block): 
    user.roam_go_block_end()

go block start: 
    user.roam_go_block_start()

## ++++++++++++ select block start/end .

(select | take) block start:
    user.roam_select_block_start()

(select | take) (block end | rest of block ):
    user.roam_select_block_end()

## ++++++++++++ clear block start/end .

(clear | chuck) block start:
    user.roam_select_block_start()
    key(delete)

(clear | chuck) (block end | rest of block ):
    user.roam_select_block_start()
    key(delete)

## +++++++++++++++++++++++++++++++ all .

(select | take) block [text]: 
    user.roam_select_block_text()

clear block | (clear | chuck) [block] text:
    user.roam_select_block_text()
    key(delete)


## +++++++++++++++++ strip empty space . 

strip (block | (whitespace | white [space]) ): 
    user.roam_strip_block_text_whitespace_padding()
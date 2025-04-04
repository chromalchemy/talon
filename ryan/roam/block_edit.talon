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

copy block start:
    user.roam_select_block_start()
    edit.copy()

(select | take) (block end | rest of block ):
    user.roam_select_block_end()

copy (block end | rest of block ):
    user.roam_select_block_end()
    edit.copy()

## ++++++++++++ clear block start/end .

(clear | chuck) block start:
    user.roam_select_block_start()
    key(delete)

(clear | chuck) (block end | rest of block ):
    user.roam_select_block_end()
    key(delete)

## +++++++++++++++++++++++++++++++ all block text .

(select | take) (block [inside] text | inside block [text]): 
    user.roam_select_block_text()

copy (block [inside] text | inside block [text]): 
    user.roam_select_block_text()
    edit.copy()

clear block | (clear | chuck) [block] text:
    user.roam_select_block_text()
    key(delete)


## +++++++++++++++++ strip empty space . 

trim (block | (whitespace | white [space])): 
    edit.select_all()
    sleep(200ms)
    block_str = edit.selected_text()
    # edit.delete()
    sleep(300ms)
    print(user.bb_transform_text(block_str, "string-transforms/trim-block"))
    # user.roam_strip_block_text_whitespace_padding()
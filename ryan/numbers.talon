app.name: Numbers 
-

<user.arrow_keys>: user.move_cursor(arrow_keys)

gmail: insert("gmail.com")
at gmail: insert("@gmail.com")
at yahoo: insert("@yahoo.com")
dot com: insert(".com")
edit [cell]: key(alt-enter)

## +++++++++++++++++ sidebars / panels .

(show | hide | toggle | bar) (inspector | inspect):
    key(cmd-alt-i)

[bar] format:
    user.menu_select('View|Inspector|Format')

[bar] (organize | sort | filter):
    user.menu_select('View|Inspector|Organize')

bar colors: 
    key(cmd-shift-c)

zoom in:
    key(cmd->)
zoom out:
    key(cmd-<)

(inspect | inspector) next:
    key(ctrl-`)

(inspect | inspector) last:
    key(ctrl-shift-`)

## +++++++++++++++++ edit rows/columsn .

(chuck | delete) (row |rows) [point]:
    user.run_ctx_menu_cmd("delete row")
    
(chuck | delete) (column |columns) [point]:
    user.run_ctx_menu_cmd("delete column")

add column before:
    user.menu_select('Table|Add Column Before')

add column after:
    user.menu_select('Table|Add Column After')

add row above:
    user.menu_select('Table|Add Row Above')

add row below:
    user.menu_select('Table|Add Row Below')


add header column before:
    user.menu_select('Table|Add Header Column Before')

add header column after:
    user.menu_select('Table|Add Header Column After')

add header row above:
    user.menu_select('Table|Add Header Row Above')

add header row below:
    user.menu_select('Table|Add Header Row Below')


## ++++++++++++++++++++++++++++ sheets .

new sheet: 
    user.menu_select('Insert|Sheet')

## ++++++++++++++++++++++++++++ export .


export new [(comma | csv)] sheet:
    user.menu_select('File|Export To|CSV…')
    sleep(200ms)
    key(enter)

export [(comma | csv)] sheet:
    user.menu_select('File|Export To|CSV…')
    sleep(200ms)
    key(enter)
    sleep(1800ms)
    key(enter)
    sleep(200ms)
    key(tab)
    sleep(200ms)
    key(space)
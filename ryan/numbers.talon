app.name: Numbers 
-

<user.arrow_keys>: user.move_cursor(arrow_keys)

gmail: insert("gmail.com")
at gmail: insert("@gmail.com")
at yahoo: insert("@yahoo.com")
dot com: insert(".com")
edit [cell]: key(alt-enter)

## ++++++++++++++++++++++++ formatting .

copy [cell] (formatting  | style | thou | tile):
    user.menu_select('Format|Copy Style')
    
paste [cell] (formatting  | style | thou | tile):
    user.menu_select('Format|Paste Style')

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

(chuck | delete) row [point]:
    user.run_ctx_menu_cmd("delete row")

(chuck | delete) rows [point]:
    user.run_ctx_menu_cmd("delete rows")

(chuck | delete) selected rows [point]:
    user.run_ctx_menu_cmd("delete selected rows")

(chuck | delete) column [point]:
    user.run_ctx_menu_cmd("delete column")

(chuck | delete) columns [point]:
    user.run_ctx_menu_cmd("delete columns")

(chuck | delete) selected columns [point]:
    user.run_ctx_menu_cmd("delete selected columns")

(add | insert) column before:
    user.menu_select('Table|Add Column Before')

(add | insert) column after:
    user.menu_select('Table|Add Column After')

(add | insert) row above:
    user.menu_select('Table|Add Row Above')

(add | insert) row below:
    user.menu_select('Table|Add Row Below')


(add | insert) header column before:
    user.menu_select('Table|Add Header Column Before')

(add | insert) header column after:
    user.menu_select('Table|Add Header Column After')

(add | insert) header row above:
    user.menu_select('Table|Add Header Row Above')

(add | insert) header row below:
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
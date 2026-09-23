app.name: "Adobe Bridge 2026"

(open | edit) [in] [camera] raw:
    user.menu_select('File|Open in Camera Raw...')

copy [raw] settings:
    user.menu_select('Edit|Develop Settings|Copy Camera Raw Settings...')
paste [raw] settings:
    user.menu_select('Edit|Develop Settings|Paste Camera Raw Settings...')
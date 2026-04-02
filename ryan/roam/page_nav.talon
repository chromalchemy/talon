app.name: Roam Research 
mode: command
-
go [to] (page | tag) ({user.abbreviation} | {user.roam_tag} | [<user.formatters>] <user.text>) $:
    tag_text = user.roam_tag("{formatters or 'SLASH_SEPARATED'}", "{text or ''}", "{abbreviation or ''}", "{user.roam_tag or ''}")
    user.roam_primary_search("{tag_text}" or "")    
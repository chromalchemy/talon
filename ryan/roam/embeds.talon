
#----------------- embed block

(in bed | embed) (block | ref | reference) | (paste | pace) (embed | in bed):
    r = clip.text()
    user.roam_insert_snippet("embed", r)
    key(esc)

#embed block/page children only

(in bed | embed) (block | black | ref | reference) (children | kids):
    r = clip.text()
    user.roam_insert_snippet("embedChildren", r)
    key(esc)


(in bed | embed) (block | black | ref | reference) (path | breadcrumbs | crumbs):
    r = clip.text()
    user.roam_insert_snippet("embedPath", r)
    key(esc)

# ----------- block/page mentions

(paste | (in bed | embed) | insert) (block | black | ref | reference) (mentions | links):
    r = clip.text()
    user.roam_insert_snippet("mentions", r)
    key(esc)

(in bed | embed) mentions [for] {user.roam_ref}:
    user.roam_insert_snippet("refMentions", roam_tag)
    key(esc:2)

(in bed | embed) page mentions [for] {user.roam_tag}:
    user.roam_insert_snippet("pageMentions", roam_tag)
    key(esc:2)

((in bed | embed) | insert) page (mentions | links):
    user.insert_snippet_by_name_with_stop_at_end("pageMentions")

((in bed | embed) | insert) (mentions | links) [for] page <user.text>:
    user.insert_snippet_by_name_with_stop_at_end("pageMentions")
    insert(text)
    # how to insert a snippet with stop after substituted text?
    # user.roam_insert_snippet("pageMentions", text)

((in bed | embed) | insert) (mentions | links) [for] (block | black | ref | reference) <user.text>:
    user.insert_snippet_by_name_with_stop_at_end("blockMentions")
    insert(text)
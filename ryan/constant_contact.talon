app: chrome
title: /app.constantcontact.com/pages/campaign/
-

go [mark] {user.cc_edit_mark}:
    # insert("{cc_edit_mark}")
    user.rango_run_action_on_reference("clickElement", "{cc_edit_mark}")
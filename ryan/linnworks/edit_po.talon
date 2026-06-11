app: chrome
title: /EditPurchaseOrder/
-

# copy email:
#     user.rango_run_action_on_reference("copyElementTextContent", "email")


convert (to | two) delivered:
    user.rango_run_action_on_reference("clickElement", "convert to delivered")
    sleep(500ms)
    user.rango_run_action_on_reference("clickElement", "confirm conversion") 
    sleep(800ms)
    user.rango_run_action_on_reference("clickElement", "close purchase order")

confirm conversion:
    user.rango_run_action_on_reference("clickElement", "confirm conversion")

close purchase order [tab] | tab close purchase order:
    user.rango_run_action_on_reference("clickElement", "close purchase order")


app: chrome
title: /PurchaseOrder/
-

# copy email:
#     user.rango_run_action_on_reference("copyElementTextContent", "email")


convert (to | two) delivered here:
    mouse_click(0)
    mouse_click(0)
    sleep(500ms)
    user.rango_run_action_on_reference("clickElement", "convert to delivered")
    sleep(1000ms)
    user.rango_run_action_on_reference("clickElement", "confirm conversion") 
    sleep(800ms)
    user.rango_run_action_on_reference("clickElement", "close purchase order")
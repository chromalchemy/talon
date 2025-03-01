app: chrome
browser.host: store-7hstasnrjg.mybigcommerce.com
-
tag(): browser


view on storefront:
    user.rango_run_action_on_reference("clickElement", "view")

hunt (bc | Big commerce) products (paste | pace):
    user.open_url("https://store-7hstasnrjg.mybigcommerce.com/manage/products")
    sleep(2000ms)
    user.rango_run_action_on_reference("focusElement", "search")
    edit.paste()
    sleep(200ms)
    key(enter)
    


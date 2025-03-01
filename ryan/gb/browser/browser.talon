app: chrome
browser.host: getbitoutdoors.com
browser.host: store-7hstasnrjg.mybigcommerce.com
-
tag(): browser
    
#open js bookmarklet links (parses page for input data)

[(open | go)] mark {user.ryan.gb.browser.bookmarks.list}:
    user.load_bookmark("{user.ryan.gb.browser.bookmarks.list}")

go [product] categories:
    user.rango_command_without_target("focusOrCreateTabByUrl", "https://store-7hstasnrjg.mybigcommerce.com/manage/products/categories")
    # user.open_url("https://store-7hstasnrjg.mybigcommerce.com/manage/products/categories")
    
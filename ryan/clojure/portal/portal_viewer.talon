app: vscode
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

#usefull with portal

## ++++++++++++++++++++++++++ tap top form 

#  run top level form with portal viewer
(tap | send) (it | top [form]) {user.portal_viewer}:
    fn = """
    (do 
        (require '[portal.api :as p])
        (require '[portal.viewer :as pv])
        (->> $top-level-form
            (pv/{portal_viewer or 'pprint'})
            (tap>)))
        """
    user.run_repl_snippet(fn) 

# clear portal, then run current top level form with portal viewer
clear (tap | send) (it | top [form]) {user.portal_viewer}:
    fn = """
    (do 
        (require '[portal.api :as p])
        (require '[portal.viewer :as pv])
        (p/clear)
        (->> $top-level-form
            (pv/{portal_viewer or 'pprint'})
            (tap>)))
        """
    user.run_repl_snippet(fn) 

#run cursorless target text with portal viewer
(tap | send) [form] {user.portal_viewer} text <user.cursorless_target>:
    target_text = user.cursorless_get_text(cursorless_target)
    sleep(500ms)    
    clj_fn = """
    (do 
        (require '[portal.api :as p])
        (require '[portal.viewer :as pv])
        (->> {target_text}
            (pv/{portal_viewer or 'pprint'})
            (tap>)))
        """
    user.run_repl_snippet(clj_fn)

#select cursorless target, then run current form with portal viewer
(tap | send) [form] {user.portal_viewer} <user.cursorless_target>:
    user.cursorless_command("setSelection", cursorless_target)
    sleep(500ms)    
    clj_fn = """
    (do 
        (require '[portal.api :as p])
        (require '[portal.viewer :as pv])
        (->> $current-form
            (pv/{portal_viewer or 'pprint'})
            (tap>)
            ))
        """
    user.run_repl_snippet(clj_fn)

# run top level form at cursor with portal viewer
(tap | send) (it | top [form]) {user.portal_viewer} point:
    mouse_click(0)
    fn = """
    (do 
        (require '[portal.api :as p])
        (require '[portal.viewer :as pv])
        (->> $top-level-form
            (pv/{portal_viewer or 'pprint'})
            (tap>)))
        """
    user.run_repl_snippet(fn) 

# clear portal, then run top level form at cursor with portal viewer
clear (tap | send) (it | top [form]) {user.portal_viewer} point:
    mouse_click(0)
    fn = """
    (do 
        (require '[portal.api :as p])
        (require '[portal.viewer :as pv])
        (p/clear)
        (->> $top-level-form
            (pv/{portal_viewer or 'pprint'})
            (tap>)))
        """
    user.run_repl_snippet(fn)
  
## ++++++++++++++++ tap selected text /caret from .

# (tap | send) (that | form | here): 
#     user.vscode("calva.tapSelection")

# (tap | send) <user.cursorless_target>:
#     user.cursorless_ide_command("calva.tapSelection", cursorless_target)
    
# (tap | send) [(that | form | here)] point: 
#     mouse_click(0)
#     user.vscode("calva.tapSelection")


 


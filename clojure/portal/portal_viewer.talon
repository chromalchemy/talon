app: vscode
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

#usefull with portal

## ++++++++++++++++++++++++++ tap top form 


(tap | send) (it | top [form]) {user.portal_viewer}:
    fn = """
    (do 
        (require '[portal.api :as p])
        (require '[portal.viewer :as pv])
        (->> $top-level-form
            (pv/{portal_viewer or 'pprint'})
            (tap>)))
        """
    user.run_rpc_command("calva.runCustomREPLCommand", fn) 

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
    user.run_rpc_command("calva.runCustomREPLCommand", fn) 

 #target text   
(tap | send) elephant [form] {user.portal_viewer} <user.cursorless_target>:
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
    user.run_rpc_command("calva.runCustomREPLCommand", clj_fn)

#select target first
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
    user.run_rpc_command("calva.runCustomREPLCommand", clj_fn)

  
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
    user.run_rpc_command("calva.runCustomREPLCommand", fn) 

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
    user.run_rpc_command("calva.runCustomREPLCommand", fn)
  
## ++++++++++++++++ tap selected text /caret from .

# (tap | send) (that | form | here): 
#     user.vscode("calva.tapSelection")

# (tap | send) <user.cursorless_target>:
#     user.cursorless_ide_command("calva.tapSelection", cursorless_target)
    
# (tap | send) [(that | form | here)] point: 
#     mouse_click(0)
#     user.vscode("calva.tapSelection")


 


app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

## ++++++++++++++++++++++++ search bar .

bar search <user.text>:
    user.run_rpc_command("workbench.view.search")
    sleep(100ms)
    insert(text)

go [bar] search [bar] (list | results | hits):
     user.run_rpc_command("search.action.focusSearchList")

go search string [from results]: 
    user.run_rpc_command("search.action.focusSearchFromResults")
    user.run_rpc_command("search.action.focusSearchFromResults")
    user.run_rpc_command("search.action.focusSearchFromResults")
     
## ++++++++++++++++++++++ query filter .

go search filter:
    key(cmd-down)

clear search filter:
    key(cmd-down)
    sleep(100ms)
    key(delete)
    sleep(100ms)
    key(cmd-up)

## ++++++++++++++++ results view style .

bar search tree | search (results | hits) tree:            
    user.run_rpc_command("search.action.viewAsTree")

bar search list | search (results | hits) list:            
    user.run_rpc_command("search.action.viewAsList")

[bar] search fold | (collapse | clap | fold) search [(results | result | hits)]: 
    user.run_rpc_command("search.action.collapseSearchResults")

([bar] search fold | (collapse | clap | fold) search [(results | result | hits)]) (top [level] [items] | max): 
    user.run_rpc_command("search.action.collapseSearchResults") 
    user.run_rpc_command("search.action.collapseSearchResults")
    user.run_rpc_command("search.action.collapseSearchResults")

[bar] search [(results | hits)] expand | (expand | unfold) search [(results | hits)]: 
    user.run_rpc_command("search.action.expandSearchResults")

## ++++++++++++++++++++ filter results .

(restrict | filter) [search] results (to | by) folder | (focus | filter) [search] results here:
    key(alt-shift-f)

## +++++++++++++++++++++++++++++++++  .clear results

bar search (clear | new) | clear search (results | hits) | (new | fresh) [bar] search: 
    user.run_rpc_command("search.action.clearSearchResults")

###  search editor(s)

new [workspace] search [(editor | tab)]: 
    user.run_rpc_command("search.action.openNewEditor")

new [workspace] search [(editor | tab)] (to [the] side | right): 
    user.run_rpc_command("search.action.openNewEditorToSide")

open [workspace] [search] (results | hits) to side: 
    user.run_rpc_command("search.action.openInEditor")

[bar] search [(results | hits)] to tab: 
    user.run_rpc_command("search.action.openInEditor")

search (results | hits) to tab:      
    user.run_rpc_command("search.action.openInEditor")

move search results to tab:
    user.run_rpc_command("search.action.openInEditor")
    user.run_rpc_command("search.action.clearSearchResults")

#scrolls to top and focuses new input
(go) [workspace] search [(editor | tab)]: 
    user.run_rpc_command("search.action.openEditor")

# why is this popping normal search editor
(search | find) in files:   
    user.run_rpc_command("workbench.action.findInFiles")

### search files
 
#todo: use file hunt commands instead?
(open | find | fine | search) file [<user.text>]:
    key(cmd-p)
    sleep(100ms)
    insert("{text}")

## ++++++++++++++++++++ find in folder .
# must have folder selected and focused in explorer

(search | find) [in] folder [<user.text>]: 
    key(shift-alt-f)
    sleep(200ms)
    insert(text or "")
    
(search | find) [in] folder (paste | pace):
    key(shift-alt-f)
    sleep(200ms)
    edit.paste()

# key(shift-cmd-e) # not reliable toggles back and forth

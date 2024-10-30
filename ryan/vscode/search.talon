app: vscode
-



## ++++++++++++++++++++++++ search bar .

bar search <user.text>:
    user.vscode("workbench.view.search")
    sleep(100ms)
    insert(text)

go [bar] search [bar] (list | results | hits):
     user.vscode("search.action.focusSearchList")

go search string [from results]: 
    user.vscode("search.action.focusSearchFromResults")
    user.vscode("search.action.focusSearchFromResults")
    user.vscode("search.action.focusSearchFromResults")
     
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
    user.vscode("search.action.viewAsTree")

bar search list | search (results | hits) list:            
    user.vscode("search.action.viewAsList")

bar search fold | (collapse | clap | fold) search [(results | hits)]: user.vscode("search.action.collapseSearchResults")

[bar] search [(results | hits)] expand | (expand | unfold) search [(results | hits)]: 
    user.vscode("search.action.expandSearchResults")

## ++++++++++++++++++++ filter results .

(restrict | filter) [search] results (to | by) folder | (focus | filter) [search] results here:
    key(alt-shift-f)

## +++++++++++++++++++++++++++++++++  .clear results

bar search (clear | new) | clear search (results | hits) | (new | fresh) [bar] search: 
    user.vscode("search.action.clearSearchResults")

###  search editor(s)

new [workspace] search [(editor | tab)]: 
    user.vscode("search.action.openNewEditor")

new [workspace] search [(editor | tab)] (to [the] side | right): 
    user.vscode("search.action.openNewEditorToSide")

open [workspace] [search] (results | hits) to side: 
    user.vscode("search.action.openInEditor")

[bar] search [(results | hits)] to tab: 
    user.vscode("search.action.openInEditor")

search (results | hits) to tab:      
    user.vscode("search.action.openInEditor")

move search results to tab:
    user.vscode("search.action.openInEditor")
    user.vscode("search.action.clearSearchResults")

#scrolls to top and focuses new input
(go) [workspace] search [(editor | tab)]: 
    user.vscode("search.action.openEditor")

# why is this popping normal search editor
(search | find) in files:   
    user.vscode("workbench.action.findInFiles")

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

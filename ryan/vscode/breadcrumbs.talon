app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-


# Use `alt-left` and `alt-right` to navigate the bread crumb
# from community

## ++++++++++++++++++++++++ visibility .

(toggle | show | hide) (file context | path | crumb | crumbs | breadcrumb | breadcrumbs | chromes): 
    user.run_rpc_command("breadcrumbs.toggle")

## +++++++++++++++++++++++++++++++ nav .

select (breadcrumb | crumb) | file context | path | crumb | crumbs | breadcrumb | breadcrumbs | chromes: 
    user.run_rpc_command("breadcrumbs.focusAndSelect")

(go | focus) (file context | path | crumb | crumbs | breadcrumb | breadcrumbs | chromes): 
    user.run_rpc_command("breadcrumbs.focus")

(crumb | crumbs | level) (left | [level] up | parent | last): 
    key(alt-left)

(crumb | crumbs | level) (right | [level] down | child | next): 
    key(alt-right)

# todo: (crumb | crumbs) parent ... doesnt work
parent ([(file | level)] context | path | crumb | crumbs | breadcrumb | breadcrumbs | chromes): 
    user.run_rpc_command("breadcrumbs.focus")
    key(left down)  

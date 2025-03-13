app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-


# Use `alt-left` and `alt-right` to navigate the bread crumb
# from community
select (breadcrumb | crumb): 
    user.run_rpc_command("breadcrumbs.focusAndSelect")

(toggle | show | hide) (file context | path | crumb | crumbs | breadcrumb | breadcrumbs | chromes): 
    user.run_rpc_command("breadcrumbs.toggle")

file context | path | crumb | crumbs | breadcrumb | breadcrumbs | chromes: 
    user.run_rpc_command("breadcrumbs.focusAndSelect")

(go | focus) (file context | path | crumb | crumbs | breadcrumb | breadcrumbs | chromes): 
    user.run_rpc_command("breadcrumbs.focus")

(crumb | crumbs | level) (left | [level] up | parent): key(alt-left)

(crumb | crumbs | level) (right | [level] down | child): key(alt-right)

# todo: (crumb | crumbs) parent ... doesnt work
parent ([(file | level)] context | path | crumb | crumbs | breadcrumb | breadcrumbs | chromes): 
    user.run_rpc_command("breadcrumbs.focusAndSelect")
    key(alt-(left)  

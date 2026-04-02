from talon import Module, Context, actions

mod = Module()
ctx = Context()

CODE_PATH = "/Users/ryan/dev/tmem-roam-ext"
BB_PATH = "/usr/local/bin/bb"

# Move mode: spoken word → value for opts map
mod.list("roam_move_mode", desc="Optional move mode for bridge commands")
ctx.lists["user.roam_move_mode"] = {
    "alias": "alias",
    "ref": "alias",
    "leave alias": "alias",
    "link": "link",
}

@mod.capture(rule="{user.roam_move_mode}")
def roam_move_mode(m) -> str:
    return m.roam_move_mode

# Block position relative to target
mod.list("roam_position", desc="Block placement position")
ctx.lists["user.roam_position"] = {
    "top": ":first",
    "start": ":first",
    "first": ":first",
    "bottom": ":last",
    "end": ":last",
    "last": ":last",
    "before": ":before",
    "above": ":before",
    "after": ":after",
    "below": ":after",
}

@mod.capture(rule="{user.roam_position}")
def roam_position(m) -> str:
    return m.roam_position

# Source capture: returns a clojure map literal string
# label → {:labels [:A]}, ref → {:source-uid "uid"}, selected → {:selected true}
@mod.capture(rule="<user.letters> | {user.roam_ref} | (selected [blocks] | [block] selection)")
def roam_source(m) -> str:
    try:
        return "{:labels [:" + m.letters + "]}"
    except AttributeError:
        pass
    try:
        return '{:source-uid "' + m.roam_ref + '"}'
    except AttributeError:
        pass
    return "{:selected true}"

@mod.action_class
class Actions:
    def roam_fn(clj: str):
        """Evaluate a clojure expression in bridge.clj context"""
        cmd = f'''cd '{CODE_PATH}' && {BB_PATH} -e '(load-file "bridge.clj") {clj}' '''
        print(cmd)
        actions.user.system_command_nb(cmd)

    def roam_move_or_link(source: str, target_key: str, target_val: str,
                          position: str, mode: str):
        """Build and execute a move!/link! call.
        source: clojure map string e.g. '{:labels [:A]}'
        target_key: :label, :uid, :page
        target_val: the target value (label name, uid, or page title)
        position: first/last/before/after or empty
        mode: alias/link or empty (plain move)"""
        # Determine if target value is a keyword (label) or string (uid/page)
        val_is_keyword = target_key == ":label"

        # before/after positions change the target key to :before/:after (always keyword val)
        if position in (":before", ":after"):
            tgt = "{" + position + " :" + target_val + "}"
            opts_order = ""
        else:
            if val_is_keyword:
                tgt = "{" + target_key + " :" + target_val + "}"
            else:
                tgt = '{' + target_key + ' "' + target_val + '"}'
            opts_order = ":order " + position + " " if position else ""

        if mode == "link":
            fn = "link!"
            opts = "{" + opts_order + "}" if opts_order else ""
        else:
            alias_flag = ":alias true " if mode == "alias" else ""
            opts = "{" + opts_order + alias_flag + "}" if (opts_order or alias_flag) else ""
            fn = "move!"

        if opts:
            clj = f"({fn} {source} {tgt} {opts})"
        else:
            clj = f"({fn} {source} {tgt})"

        actions.user.roam_fn(clj)

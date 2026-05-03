❌ Audit miss: `swap-blocks!` helpers also used by new `swap-uids!`

When pruning ~25 legacy fns from `bridge.clj`, I classified three
private helpers (`ancestor-path`, `swap-nested-positional!`,
`swap-nested-content!`) as "only called by `swap-blocks!`" — and
slated them for deletion.

Wrong. They're also called by `swap-uids!` (the new dispatch helper
shared by the `swap` and `swapContent` defmethods). My grep audit
missed it because I was looking at fn-name regexes scoped to legacy-
deletion targets, not at every existing reference site.

The general subagent caught it post-deletion (the daemon would have
errored on `swap-uids!` resolution otherwise). It restored the three
fns verbatim and relocated them next to `swap-uids!` where they
logically belong.

Lesson for next time: when deleting a fn `F`, don't just check
"who calls `F`" — also check "what does `F` call." Each helper that
`F` uniquely uses *might* be unique to `F` or *might* be shared.
Reverse-direction grep (does `F`'s helper appear elsewhere?) is the
correct second pass.

Better still: rely on clojure-lsp's reachability analysis after
deletion (the warnings only surface for *currently* unused public
vars, but private fns get `unused-binding` info). After a deletion
batch, the diagnostics will tell you what to keep — *if you reload
first*.

Cost: zero — the subagent caught it before commit. But the audit
table I produced was wrong; the brief needs to flag "trust but
verify the helper-list from the calling agent."

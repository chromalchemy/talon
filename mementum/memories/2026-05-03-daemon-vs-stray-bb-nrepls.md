🔁 The "daemon vs dev REPL" problem in tmem-roam-ext is real, accumulates

`REFACTOR-PROGRESS.md` flagged this as an open question:

> "Daemon vs dev REPL discrimination: currently `clj-nrepl-eval
> --discover-ports` returns 3 bb processes for this directory —
> those are likely dev REPLs."

Today (2026-05-03) the count was up to **5 listening bb nREPLs in
`/Users/ryan/dev/tmem-roam-ext`**: one real daemon (PID 2338, port
6888, started by `bb bridge.clj`) + four ad-hoc `bb --nrepl-server N`
processes ranging from yesterday to a month old. They were all
detected by `clj-nrepl-eval --discover-ports` and `list_nrepl_ports`,
indistinguishable by signature.

How to tell the daemon apart from a stray:
- The daemon is launched as `bb bridge.clj` (process command string).
  bridge.clj's daemon block only fires when `*file*` matches
  `babashka.file` — i.e. the file IS the launch entry.
- Strays are launched as `bb --nrepl-server <port>` — blank-slate
  sessions, may or may not have `(load-file "bridge.clj")` evaluated
  into them by an editor.

**Periodic cleanup is fine.** Killing all `bb --nrepl-server` processes
in this directory leaves the daemon untouched and makes port
discovery unambiguous. Just `kill <pids>` — no graceful shutdown
needed since nothing important lives in those sessions.

Long-term fix per progress-doc Open Questions: tag the daemon with
a known marker, e.g. `(defonce DAEMON :v1)`, so discovery scripts can
filter `bb` processes by checking for that var. Not implemented;
manual cleanup remains the workflow until then.

When in doubt: `ps -ef | grep "bb bridge\.clj"` finds the daemon;
`ps -ef | grep "bb --nrepl-server"` finds the strays.

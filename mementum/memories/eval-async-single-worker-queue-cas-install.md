💡 tlisp.nrepl eval-async! → single daemon worker per client draining a
queue.Queue (was: thread per call → one Talon WARN per voice command).
Key move: install the worker via `compare-and-set!`, NOT a lock. Two
wins under Talon's 3.14t GIL-off CPython: (1) CAS is atomic so exactly
one caller installs the queue + starts the thread; (2) it reads no
pre-seeded atom key, so a `defonce` client atom that survives a hot
reload from an OLDER `client` def still works — a lock-in-the-atom
approach would `(.acquire nil)` and crash on the next voice command.

🔁 When adding new state keys to an atom that lives in a defonce var,
assume old instances survive reload without the new keys; design the
reader to tolerate their absence (CAS / or-default), don't assume shape.

Verified live :7891: 5 jobs → 1 worker/client, FIFO, stale-atom drains.

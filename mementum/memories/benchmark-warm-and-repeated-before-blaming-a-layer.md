🌀 Never characterise latency from one cold sample — and never attribute it to a layer you haven't measured *around*.

**What I did wrong (2026-09-08, rebelle):** measured `invoker-clj-eval` once at 471ms and told the user it "blocks Talon for ~0.5s", implicitly blaming the Talon/subprocess path I'd just written. User pushed back: *"if I invoke it from shell it's supposed to be very quick."* They were right. Warm n=3: **164–189ms via Talon vs 160–310ms from the shell — parity.** The 471ms was a one-time server-side `add-lib` on first use. My number was real but not representative, and my causal story was invented.

**The rule — before blaming a layer:**
1. **≥3 warm iterations.** First call buys deps/JIT/connect; quote it separately and *say "cold"*.
2. **Measure the same op through the other path** (shell vs Talon) — parity exonerates the layer.
3. **Measure the floor**: bare interpreter start, and the wrapper on a no-op (`sh!` on `echo` = 17ms proved subprocess overhead was negligible).

Step 3 is what actually found the fix: the floor *was* the cost (2× bb boot), which pointed at skipping the CLI entirely → 170ms → 7ms.

Cheap measurements beat confident narration. The user's "that seems off" is a strong signal — treat it as a hypothesis to test, not a claim to defend.

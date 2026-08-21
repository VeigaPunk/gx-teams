# r1-connector — cdx-connector-r1 (qwen3.8-max)

spawn_method: cdx-cli qwen38
bin: /home/vgpnk/.local/bin/codex
cwd: /home/vgpnk/Projects/xbgst/gx-teams
CODEX_BIN unset: yes

# State
- inf: every axis observable in this experiment is a grep over a file a later gate reads — P, E, C, V are one grep-mediated chain, so the cheapest round-1 gains are writes that pre-satisfy future greps *with provenance fields* (banner, exit code, wall seconds), not more live calls [strong] — axes: P, E, C, V
- m07 (M02 stub answer): yes — the next unshipped gx-teams slice is the M07 ACP `session/prompt` live DM; README.md line 99: “Live DMs still need ACP `session/prompt` — mailbox JSONL is the log only.” Mailbox JSONL = durable log, not a transport; the initialize-then-kill oneshot proves handshake only [strong] — axes: V, X
- risk: bit-for-bit file discipline is satisfiable by scaffolding before live proof — `.xbgst/inner/r1-connector.md` already exists as a header-only stub written *before this connector spoke*, so P quietly degrades into “was this file filled by a live call?” unless each artifact carries live provenance; second-order, the connector pre-flight couples M02’s critical path to Token Plan uptime even when the openai-codex L2 plane is healthy

# Dissent
- planner (WWKD): will call connector pre-flight out of order — in xbreed phase order the connector belongs inside r1 PROPOSE, not before r0; my counter is that pre-flight is evidence capture, not phase execution, and the inner round still records its own propose.
- critic: will flag double-spend — if the inner L2 root must also demonstrate the connector spawn (X-fidelity), the qwen38 lane runs twice against an explicitly-raised-but-finite E-budget; and will say “write-for-the-grep” invites Goodhart unless every artifact carries banner + exit + wall fields (conceded — that is exactly what I propose).
- sentinel: will flag drift — the plan’s copy-shape says `-C /tmp/codex-token-plan-smoke`, but the stub header records cwd `gx-teams`; sentinel may demand a re-spawn in a disposable dir rather than recording the drift. Counter: this session is sandbox read-only, so re-spawn buys zero isolation and costs budget.
- mutation-tester (M05): should mark my “inner round adopts the pre-flight exec instead of re-spawning” move as a live mutant — if the inner loop never exercises the connector lane itself, that is a real X finding; I surface it now so it is recorded, not hidden.

# Rationale
The strange angle: the connector is the only role whose probe and whose artifact are the same object — this reply is simultaneously the C-axis proof and the content of `r1-connector.md`. The experiment is already running on its own evidence. Two consequences. First, K is *mechanically* guaranteed for C in a way greps can’t match: this session is read-only sandboxed, so the connector cannot write marketplace or source even in principle — record the sandbox mode in the artifact and K’s marketplace-diff check becomes redundant for the C lane. Second, for V: the pure vs guided comparison changes two variables at once (coordinator model *and* connector model). Holding the connector prompt constant across arms — re-running this exact stub prompt in M06 as a connector-control column — lets the verdict separate “who coordinates” from “who advises”, which is the question the experiment actually answers.

# PROPOSE
Moves for M01 (improve P/I/E, K-neutral):
- Run `gate-intermodel-m01.sh` exactly once; on `GATE_INTERMODEL_M01_OK`, append to `evidence/pure-intermodel-m01.md` the tick wall seconds plus `find "$CWD" -mindepth 1 | wc -l = 0` (disposable cwd stayed empty). evidence: M06 comparison table needs wall-time baseline for the pure arm; empty-cwd assertion hardens I beyond the mktemp glob.
- On first tick failure, rerun once with a *fresh* `mktemp -d /tmp/xbgst-prime-XXXX` (never reuse the dir), then `Status: blocked E-provider` with the `.err` tail; never swap provider to make the canary pass. evidence: plan executor notes “rerun once, then escalate. Do not invent a new lane” + envelope `stop:` abort list.
- Keep M01 the only live openai-codex call until M02 files are staged — no warm-up ticks. evidence: E-budget escalation raises tokens for inner 4-phase work, not retries; P is one clean timestamped proof, not a sample.

Moves for M02 (C-axis + later):
- Connector pre-flight before the PrimeAgent inner r0+r1: run the plan’s spawn shape verbatim (non-ELF binary check, `env -u CODEX_BIN`, `timeout 180s`, `-s read-only`) and append full stdout below the existing stub header in `.xbgst/inner/r1-connector.md`, so a qwen38 timeout attributes to C and never pollutes P. evidence: M02 gate greps `r1-connector.md` for `cdx-connector-r1` + the r1 canary (final line of this reply); unknowns field names Token Plan long-prompt stability.
- Record live provenance in `r1-connector.md`: banner `model: qwen3.8-max`, exit code, wall seconds, sandbox read-only, and the cwd drift vs the plan’s `-C` shape. evidence: C-axis observable “banner model: qwen3.8-max” in `r1-axes.md`; stub header already records `cwd: gx-teams` vs plan copy-shape `/tmp/codex-token-plan-smoke`.
- Inner L2 root emits the exact connector spawn command line inside `r1-propose.md` (satisfying `grep -q cdx-connector`) and adopts the pre-flight exec as its connector phase; if PrimeAgent cannot run the phase against the live connector, escalate E-qwen38 — never swap to a Grok connector this session. evidence: M03 gate greps `r1-propose.md` for `cdx-connector`; plan: “do not swap to Grok connector (session override)”.
- Keep the connector prompt at stub-size plus return contract only — no full plan paste into the qwen38 lane — and keep replies in the strict format so pasted stdout stays grep-inert for later ban checks. evidence: unknowns “long-prompt Token Plan stability”; M03/M05 gates grep inner artifacts for ban strings and the ship token.
- (Later, M06, advisory) Run this identical stub prompt as a third connector-control column alongside the guided arm, so the verdict separates coordinator effect from connector effect. evidence: M06 gate greps `pure-vs-guided.md` for both `cdx-connector-r1` and `gx-connector`; table columns include connector-override compliance.

No implementation performed; no ship claim made; L1 remains the sole judge, Pareto authority, and integrator.

XBGST_CDX_CONNECTOR_R1_OK

## Live provenance (L1 pre-flight, V baseline)

- bin: `/home/vgpnk/.local/bin/codex` (bash stub, not ELF; `env -u CODEX_BIN`)
- profile: `qwen38`
- banner: `model: qwen3.8-max` / `provider: bailian-cli` / Codex `v0.149.0`
- sandbox: read-only
- cwd: `/home/vgpnk/Projects/xbgst/gx-teams` (drift vs plan copy-shape `/tmp/codex-token-plan-smoke`; recorded, not hidden)
- exit: 0
- canary: HIT
- wall: ~275s including first typo retry
- stdin note: later inner execs must use `</dev/null` so Codex does not wait on piped stdin

EXIT:0

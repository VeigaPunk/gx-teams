# r2-connector — cdx-connector-r2 (qwen3.8-max)

spawn_method: cdx-cli qwen38
bin: /home/vgpnk/.local/bin/codex
cwd: /tmp/xbgst-cdx-connector-r2
CODEX_BIN unset: yes

cwd is empty (no README on disk here), so the mailbox line is quoted verbatim from the task payload as supplied.

# State
- inf: R1 settled three facts: (1) M01 L2 canary HIT; (2) live r1 connector HIT, citing the README split — "Live DMs still need ACP session/prompt — mailbox JSONL is the log only."; (3) critic warning: H1 is unfalsifiable unless PrimeAgent *itself* execs qwen38. Local cwd `/tmp/xbgst-cdx-connector-r2` is empty → no V-baseline or SSoT present to accidentally mutate; README quote carried in-payload.
- risk: R1 (top) — H1 degenerates to unfalsifiable if PrimeAgent delegates/stubs the qwen38 exec instead of spawning it. R2 — mailbox JSONL mistaken for live-delivery evidence (it is log-only per README). R3 — clobbering `r1-connector.md` (V baseline) or any SSoT write. R4 — Grok-swap / titanium / general-purpose drift on the inner seat.

# Dissent
One point against the keep-set as stated: "inner MUST live-exec cdx-connector-r1-inner" is necessary but not sufficient for H1. If the pass-gate reads the inner's mailbox lines, a dead session that merely appends JSONL would still "HIT." The observable must be the ACP session/prompt transcript of the qwen38 child process (exit code + stream), with mailbox demoted to corroborating log. I dissent from treating any mailbox artifact as primary evidence; otherwise I concur with the L1 Pareto keep.

# Rationale
Axes named: **F** falsifiability of H1 · **E** evidence grade (live transcript > log) · **S** baseline/SSoT safety · **C** cost (stub-size, parallel-cheap). The L1 keep (M02 PrimeAgent WITH tools + child_fanout shell-cdx) improves F and C; my dissent clause improves E; the guardrails (no overwrite of r1-connector.md, no SSoT writes, evidence-only) hold S constant. Net: every axis improves or holds → Pareto keep, no aim-point added, frontier walks.

# PROPOSE
Round 2 only, stub-size, cross-axis — **M02**:

1. **Seat**: PrimeAgent = qwen3.8-max via stock `codex exec -p qwen38`, session override, WITH tools; child_fanout transport = shell-cdx. Never Grok-swap, never titanium, never general-purpose/explore; never emit APPROVED.
2. **Falsifiability gate (R1 fix)**: PrimeAgent MUST itself spawn the inner as a child exec — `codex exec -p qwen38 … cdx-connector-r1-inner`. Capture: spawn argv, child exit code, ACP session/prompt transcript → evidence `E1`. No child transcript ⇒ H1 marked UNFALSIFIED-UNFALSIFIABLE, run halts, no HIT claim.
3. **Inner obligation**: inner MUST live-exec `cdx-connector-r1-inner` (no canned/stub reply). Live reply is adjudicated only from the ACP session/prompt stream; mailbox JSONL may be attached solely as corroborating log, per README: "Live DMs still need ACP session/prompt — mailbox JSONL is the log only."
4. **Guardrails (S-axis lock)**: `r1-connector.md` read-only (V baseline) — no overwrite; zero SSoT writes; all artifacts land in fresh `r2-evidence/` only.
5. **Pass criteria**: E1 present AND inner live transcript shows r1-inner response AND guardrail diff is empty ⇒ M02 HIT; else record which axis failed and keep frontier moving.

XBGST_CDX_CONNECTOR_R2_OK
EXIT:0

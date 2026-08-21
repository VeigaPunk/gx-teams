# r1-distill — Round 1 propose → scored moves (L1 Pareto input)
**Session:** 1 | **Role:** gx-distiller-r1 | **Date:** 2026-08-21
**Sources:** `evidence/pure-intermodel-m01.md`, `.xbgst/inner/r1-connector.md`, `.xbgst/inner/r1-critic.md`, `.xbgst/judge/r1-axes.md`, `.xbgst/plans/2026-08-21-pure-intermodel-l2.md`, L1 handoff stable_context
**Axes:** I isolation, P proof, C connector, X xbreed-fidelity, D delegation, K no-wrap, E evidence, V compare
**Not:** `APPROVED`. Distill only. L1 remains sole Pareto authority.

---

## EVIDENCE AUDIT

| Bucket | N | Items |
|---|---|---|
| **with evidence** | **8** | M01 `GATE_INTERMODEL_M01_OK` (gate re-run EXIT 0); `XBGST_PURE_INTERMODEL_L2_OK` in `evidence/pure-intermodel-m01.md`; cwd `/tmp/xbgst-prime-KrED`; provider `openai-codex` / model `gpt-5.4` / binary `prime-agent` 0.7.4; L1 connector retry `EXIT:0` + `XBGST_CDX_CONNECTOR_R1_OK`; live State/Dissent/Rationale citing README L99 (mailbox JSONL ≠ transport); axes + escalation locks in `r1-axes.md`; envelope `m01.yaml` has required keys |
| **without evidence** | **4** | Critic ACH posteriors H1–H5 (adversarial / planning; `evidence: none`); skip-PrimeAgent devil’s advocacy (skill-text argument, not a timed run); “grep gate ≡ live PID” falsifier A7 (design claim); M06 connector-control column (proposed, not run) |
| **dropped (stale)** | **3** | Critic **E6** `EXIT:1` / no canary — superseded by live retry `EXIT:0` (handoff: first fail = cwd typo `vbgst`); Critic **E3** M01 absent / not green — superseded by evidence file + gate OK; Critic snapshot “M02 already falsified on A1” — A1 now true |
| **spoof risk (not claimed hit)** | **2** | Filename-only / `test -s` as C proof without transcript+banner+exit; canary parrot without State/Dissent/Rationale (current connector body is **not** canary-only — do not regress) |

Duplicates collapsed: ~35 peer findings → 18 unique scored moves + 3 conflicts.

---

## Move list

Legend: **keep** = Pareto-safe (≥1 axis up, none harmed under stated conditions). **drop** = harms an axis or is superseded. **hold** = delay, not discard.

| Id | Source | Axes ↑ | Axes ↓ / risk | Evidence | Rec |
|---|---|---|---|---|---|
| M01 | labrat + axes | P, I, E | none | GATE OK + canary HIT + disposable cwd | **keep** (done) |
| M02 | critic KEEP + axes | K | none | E-cdx-connector / E-write locks; no SSoT edit | **keep** Marketplace SSoT freeze |
| M03 | critic KEEP + axes | I, K | none | E-write evidence-only; first ticks `/tmp/xbgst-prime-*` | **keep** Evidence-only through M06 |
| M04 | critic KEEP + plan R8 | I, K | none | ambient titanium; stock `codex` must be non-ELF | **keep** `env -u CODEX_BIN` + `file` before every cdx exec |
| M05 | critic KEEP + connector | C, K, V | X delayed only | session override; plan stop list | **keep** Fail closed `Status: blocked E-qwen38`; **no Grok connector swap** |
| M06 | critic KEEP vs plan 180s | C, E | none if copy updated | L1 E-budget RAISE wall 300s; plan paste still 180s | **keep** Align executor timeout to **300s** |
| M07 | critic KEEP + connector dissent | I | C still via prompt | plan `-C /tmp/codex-token-plan-smoke`; artifact cwd was gx-teams | **keep** Disposable `-C` on next live exec (fix I drift) |
| M08 | connector PROPOSE | P, E, C, V | Goodhart if fields forged | C observable needs banner `model: qwen3.8-max` + exit + wall | **keep** Provenance fields on every C/P artifact |
| M09 | connector PROPOSE | C, E | X thin if prompt=ping only | Token Plan long-prompt risk; critic what-if 400s | **keep** Stub-sized prompt + State/Dissent/Rationale contract (cite README L99) |
| M10 | connector PROPOSE | P, I, E | none | M06 needs wall baseline; empty disposable cwd | **keep** Append M01 wall secs + `find CWD -mindepth 1 \| wc -l = 0` |
| M11 | connector + critic | C, X | double-spend if preflight+inner both count as proof | M03 greps `cdx-connector` in propose | **keep** Emit exact spawn cmdline in `r1-propose.md` |
| M12 | L1 handoff (overrides connector) | C, X, V | E cost of second live call | critic H2; connector dissent on adopt-preflight | **keep** Inner **must live-exec** qwen38 (`env -u CODEX_BIN`); preflight ≠ substitute |
| M13 | L1 handoff (overrides critic A4) | X, D, V | I if tools unbounded | critic: fanout=none → H1 unfalsifiable | **keep** RAISE `child_fanout` for M02 to **shell-only** stock `codex exec` |
| M14 | critic KEEP | V | none | this round is already guided-teams control | **keep** Freeze L1 artifacts (plan/axes/critic/connector transcript) as guided baseline |
| M15 | critic KEEP + plan M05 | D, K, C | none if dry-grep first | mutants listed in plan | **keep** M05 mutant list; can dry-grep table before 45 min loop |
| M16 | critic KEEP + plan M02 OOS | P, K | X delayed to M03 | M02 out-of-scope: phases after PROPOSE | **keep** No `--autonomous` / no full 4-phase smuggled into M02 |
| M17 | critic DROP + connector | C, P, V | rewards H2 | grep-only / canary-only as C | **drop** |
| M18 | critic DROP | K, P, I | wrap / scheduler smell | 500k / 45 min on M02 stub | **drop** |
| M19 | critic DROP | K | SSoT write | edit marketplace connector = qwen38 | **drop** |
| M20 | critic DROP + axes E-auth | K | H3 | inner prompt with APPROVED+push | **drop** |
| M21 | critic DROP | C, E, V | silent collapse | 3rd retry / ds-flash-as-connector / Grok swap | **drop** |
| M22 | connector PROPOSE | C, E risk | **harms C/X if used to skip live** | “adopt pre-flight as connector phase” | **drop as sole C proof**; may **hold** as cache beside M12 live exec |
| M23 | critic devil’s advocacy | K, D cheap | **harms X/V of user experiment** | skill skip-list vs spend-Codex intent | **hold** — see CONFLICT-1; do not skip C live; delay PA orchestrator until M12+M13 real |
| M24 | connector later M06 | V | none if advisory | separates coordinator vs connector effect | **hold** for M06 (connector-control column) |
| M25 | critic sequencing | D before X-theater | delays X | live C → M04/M05 → M03 if fanout set | **keep** Sequence: C transcript before inner 4-phase theater |

---

## CONFLICTS

### CONFLICT-1 — Critic skip-PrimeAgent vs user experiment
- **Critic:** M02 stub is skip-class per `xbgst-primeagent` skill; stay guided-teams; Codex only on live cdx + mutants.
- **User / plan / axes:** Run pure-intermodel vs guided; spend Codex; M01→M02 inner with cdx connector.
- **Affects:** M23, M13, X/V.
- **Distill:** Do **not** drop the experiment. **Do** make H1 falsifiable: M01 green (done) + live C transcript (done at L1) + RAISE shell-only fanout (M13) + inner live-exec (M12). Skip applies to *unfalsifiable costume*, not to a live C+P path.

### CONFLICT-2 — Adopt pre-flight vs inner must live-exec
- **Connector:** Inner adopts pre-flight exec as connector phase (save E-budget).
- **L1 handoff / critic H2:** Inner MUST live-exec qwen38; adopt-only → silent Grok-collapse / X fail.
- **Affects:** M22 vs M12; C, X, E.
- **Distill:** **M12 wins.** Pre-flight is evidence capture only; inner records its own exec. Double-spend accepted over fake C.

### CONFLICT-3 — Fanout=none vs RAISE child_fanout (resolved direction)
- **Critic A4 / E8:** fanout none + Grok executor ⇒ H1 unfalsifiable.
- **L1 handoff:** RAISE child_fanout for M02 to shell-only stock `codex exec` (`env -u CODEX_BIN`).
- **Affects:** M13, H1, X, D.
- **Distill:** Treat RAISE as the load-bearing fix. Envelope must match before claiming inner coordination. Still no marketplace SSoT write; still no Grok connector swap.

### Stale-vs-live (not a live conflict)
- Critic E6 EXIT:1 / E3 M01 missing are **stale**. Live: M01 GATE OK; connector EXIT:0 + canary + cross-axis body. Do not re-litigate A1/E6 as open blockers.

---

## Round-1 Pareto frontier (distiller recommendation to L1)

**Keep now (no harm):** M01–M11, M14–M16, M25 + provenance discipline (M08) + 300s align (M06) + disposable `-C` (M07).

**Keep as M02 shape locks:** M12 (inner live-exec), M13 (shell-only fanout RAISE), M05 (no Grok-swap).

**Drop:** M17–M22-as-sole-proof, M18–M21, M19.

**Hold:** M23 (skip-PA — only if C fails closed twice), M24 (M06 control column).

Round-1 target from axes (**P, I, E without harming K**): **met** on M01 + SSoT freeze + evidence-only. C is live at L1 PROPOSE with EXIT:0; inner C still owes M12.

---

SYNTHESIS_READY

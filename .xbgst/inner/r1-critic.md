# r1-critic — ACH attack of pure-intermodel before M02 Codex spend
**Session:** 1 | **Role:** gx-critic-r1 | **Date:** 2026-08-21
**Plan:** `.xbgst/plans/2026-08-21-pure-intermodel-l2.md`
**Axes (L1):** P proof, C connector, X xbreed-fidelity, D delegation, K no-wrap, V compare, I isolation
**evidence:** none — adversarial / planning
**Not:** `APPROVED`. Inner COMPILE is not this file. Do not spend M02 Codex on this critique.

---

## Approach map (steelman first)

**Problem claimed:** Does a PrimeAgent `openai-codex` L2-loop running inner xbgst 4-phase, with connector pinned to live `cdx-connector-*` = `env -u CODEX_BIN codex exec -p qwen38`, produce better evidence than Grok-guided `gx-*` teams?

**Strongest version of the current plan:** WWKD is already correct in shape — M01 print-tick, then overfit one inner r0+r1, then widen one axis per milestone (phases → table → mutants → compare). L1 locked the load-bearing rails: inner never `APPROVED`, connector is session override not SSoT, evidence-only through M06, provider `openai-codex`, budget RAISED (connector 300s, inner 500k / 45 min). Marketplace already names this exact substrate: optional L2-loop for long-lived intermodel exchange, envelope-bound, fallback to `gx-*`. The independent variable *should* be coordinator family (gpt-5.4 via PrimeAgent + qwen3.8-max connector) vs Grok-native spawn.

**What was actually designed:** a Grok L1 campaign (`gx-labrat-l2tick`, `gx-executor-inner-r01`, this `gx-critic-r1`) that *nests* a PrimeAgent role-play of xbgst, then greps files. M02's live connector command is a canary parrot (`Reply with exactly XBGST_CDX_CONNECTOR_R1_OK plus one State line`). Default envelope `child fan-out: none`. M01 is `--no-tools`. Stub task is already answered in README L99 and the plan's Missing list.

That is not a pure-intermodel test. It is guided-teams with an expensive inner costume.

---

## ACH — H1–H5

Scoring: **C** consistent, **I** inconsistent, **N** neutral. Diagnosticity in the last column. Snapshot at critic start: **M01 tick not green** (no `evidence/pure-intermodel-m01.md`, no `XBGST_PURE_INTERMODEL_L2_OK` in this repo). L1 connector artifact `.xbgst/inner/r1-connector.md` exists with **EXIT:1** and `cwd` = gx-teams checkout (not disposable).

### Evidence inventory

| Id | Fact | Source |
|---|---|---|
| E1 | Connector SSoT = Grok inherit; **no codex**. Dispatch name `gx-connector-*`. | marketplace `agents/connector.md`, `xbreed-shared.md`, `skills/xbgst/SKILL.md` |
| E2 | This session overrides connector to always `cdx-connector-*` qwen38; must **not** edit SSoT. | plan R2 / E-cdx-connector; L1 axes ACCEPT |
| E3 | M01 canary **absent** from `gx-teams` at critic start. Gate script + envelope exist; evidence file does not. | grep `XBGST_PURE_INTERMODEL` empty; `evidence/` has no `pure-intermodel-m01.md` |
| E4 | Prior host probe: `prime-agent --provider openai-codex --no-tools -p` → `XBGST_OPENAI_L2_OK`. Binary 0.7.4. | marketplace `evidence/openai-primeagent-l2-loop-routing.md` |
| E5 | Token Plan qwen38 canary PASS: 3,455 tokens, 120s cap, `model: qwen3.8-max`, stock bash `codex` (not ELF). | `evidence/qwen38-cli.md` |
| E6 | L1 r1 connector file: spawn named `cdx-connector-r1`, bin `/home/vgpnk/.local/bin/codex`, **cwd = gx-teams**, **EXIT:1**. No canary. | `.xbgst/inner/r1-connector.md` |
| E7 | M02 gate = `test -s` + string greps. Connector spawn copy is canary + one State line, timeout **180s** in the plan block. | plan M02 |
| E8 | Envelope default `child fan-out: none`. M02 executor is **Grok** `gx-executor-inner-r01` **plus** mandatory cdx-connector. | plan envelope + M02 executor column |
| E9 | Inner routing table still offers planner/critic via **RLM children if envelope allows**. | plan session-local table |
| E10 | xbgst 4-phase COMPILE path includes `APPROVED` + commit + push `main`. Inner is told to role-play xbgst. | marketplace `skills/xbgst/SKILL.md` round phases |
| E11 | E-auth ACCEPT: inner never Pareto-accepts / `APPROVED:` / commit. M03 grep is `! grep -q '^APPROVED:'`. | L1 axes; plan M03 |
| E12 | This activation **is** guided-teams: L1 `spawn_subagent` of named `gx-*`. Control already running. | this handoff `spawn_method: grok spawn_subagent critic` |
| E13 | Stub task (“M07 live DM is next unshipped slice, citing mailbox JSONL line”) is already in README L99 and plan Missing. | README; plan |
| E14 | E-budget RAISE: connector wall **300s**; inner `--autonomous-max-tokens 500000`, 45 min. Plan copy-paste still 180s / 200k / 30 min. | L1 axes vs plan E-budget default |
| E15 | Ambient `CODEX_BIN` = `codex-titanium` ELF. All Token Plan / E2 / connector execs must `env -u CODEX_BIN`. | plan R8; README routing table |
| E16 | Host RLM children previously proven (two named children, parent replies, released). | plan State map (INTERMODEL.md, host not this repo) |
| E17 | PrimeAgent skill: use L2-loop for **long-lived** intermodel / attach / resume. **Skip** one-shot labrat probes and judge rounds. Absence → native `gx-*`. | `skills/xbgst-primeagent/SKILL.md` When to call / Skip |
| E18 | Marketplace: PrimeAgent is L2-loop **behind a named `gx-*` route owner**, never judge, never child fan-out unless envelope allows. | `docs/model-routing.md` binary split |

### ACH matrix

| Evidence | H1 PrimeAgent coordinates inner 4-phase + live qwen38 **better than** guided-teams | H2 qwen38 connector **silently fails or is skipped**; experiment collapses to Grok-only | H3 Inner “xbgst” **leaks judge authority** (APPROVED/ship) and harms K | H4 **Mutation of delegations is the signal**; inner 4-phase is expensive noise | H5 **Guided-teams (this L1) is the control and beats pure-intermodel on X** |
|---|---|---|---|---|---|
| E1 SSoT connector=Grok, no cdx | I (override is the experiment) | C (every inner prompt that loads SSoT will try to skip cdx) | N | C (routing invariant is the thing to mutate) | C (native connector is the X-faithful path) |
| E2 session override, no SSoT write | C | C (override is easy to “honor” in prose and skip in process) | N | C | I (override *is* the treatment, so control should stay Grok connector — M06 allows that) |
| E3 M01 not green | I (skeleton missing; H1 untestable) | N | N | C (do not spend Codex on theater before tick) | C (guided-teams already producing artifacts without L2) |
| E4 prior openai-codex `-p` canary | C (lane alive *once*) | N | I (that tick had `--no-tools`, no judge verbs) | I (proves *a* tick, not that 4-phase is noise) | N |
| E5 qwen38 short canary PASS | C | I for *short* ping; N for long connector | N | N | N |
| E6 L1 `r1-connector.md` EXIT:1, cwd leak | I | **C diagnostic** (live fail already, and not fail-closed `Status: blocked`) | N | C (failed connector without 4-phase still informative) | C (guided connector already struggling; inner will not do better) |
| E7 grep gate + canary parrot + 180s copy | I (cannot distinguish coordinate vs forge) | **C diagnostic** (gate rewards file text, not a live PID) | C (same grep weakness on `APPROVED`) | C | C |
| E8 no child_fanout; Grok executor owns M02 | **I diagnostic** (PrimeAgent is not the coordinator) | C (executor can skip cdx and still write files) | N | C | **C diagnostic** (outer loop is already the control) |
| E9 RLM-if-allowed | C if L1 flips fanout; else theater | C (RLM “inner connector” ≠ `codex exec -p qwen38`) | C (RLM children inherit xbgst verbs) | C | I if fanout on and types match; C if names are `cdx-*` but runtime is PrimeAgent roleplay |
| E10 xbgst COMPILE ships | N | N | **C diagnostic** | C (copying ship-loop is the expensive part) | C (guided L1 actually *is* the judge; inner is a copy) |
| E11 E-auth + `^APPROVED:` grep | I (rail exists) | N | C (caret-anchored grep is evadeable; commit not gated in M02) | C | N |
| E12 this round is guided-teams | I (confound) | N | I (L1 is correctly the judge here) | C | **C diagnostic** |
| E13 stub already answered | I (no coordination problem to solve) | C (low value → skip the slow lane) | N | **C diagnostic** | C |
| E14 500k / 45 min / 300s vs plan 180s | N (budget exists) | C (plan copy-paste still 180s → false timeout; *or* 45 min autonomous becomes the skip path) | C (autonomous ≈ scheduler) | **C diagnostic** | C (guided is cheaper per X-shaped artifact) |
| E15 ambient titanium | N | C (forgot `env -u` → E-CODEX_BIN or silent L3 binary) | C (titanium is a wrap) | C (mutant 2 is exactly this) | N |
| E16 host RLM proven | C (mechanism exists) | I if RLM used *instead of* qwen38 | C | I (RLM is real capability, not only theater) | I (then X might transfer) |
| E17 skill: skip one-shot probes | **I diagnostic** (M02 stub is the skip class) | C | N | C | C |
| E18 L2 behind gx-* owner | I (H1 “PrimeAgent coordinates xbgst” overclaims) | N | I if envelope held | C | C |

### Posterior (critic, pre-M02)

| H | Reading | Why |
|---|---|---|
| **H1** | **weak / currently unfalsifiable** | E8+E12+E17: Grok executor + no fanout + skill says skip this class. A later M01-green `--no-tools` tick would still not support “coordinates 4-phase with live qwen38”. |
| **H2** | **leading** | E6 already failed at L1; E7 gate cannot catch skip; E1 SSoT pushes skip; E5 only defends the *short* ping. Silent Grok-collapse is the default unless M02 records a live transcript. |
| **H3** | **plausible, not yet observed** | E10 vs E11. Mitigations exist; they are string-shaped. Harm to K is a prompt-content problem, not a grep problem. |
| **H4** | **leading, jointly with H2** | E13+E14+E7: the stub is known; the spend is 500k-class; the *routing* invariants (qwen38, `env -u`, no inner ship, no SSoT write) are M04–M05. |
| **H5** | **supported on X, confounded on V** | This L1 round already emits plan/axes/critic/connector-attempt. Inner 4-phase cannot beat native specialist types on X while nested under them. M06 as specified will compare Grok-guided-Grok vs Grok-guided-PrimeAgent-files, not pure vs guided. |

H1 does **not** need to be true for the experiment to be worth a **cheap** M01. It does need to be falsifiable before M02 spends Codex.

---

## Key assumptions that would falsify M02

If any of these is false, **do not** treat `GATE_INTERMODEL_M02_OK` as support for H1. Fail closed to guided-teams (`Status: blocked`), do not swap connector to Grok.

| Id | Load-bearing assumption | Falsifier (observable) | Axis hit |
|---|---|---|---|
| A1 | **M01 is green** before M02. | No `GATE_INTERMODEL_M01_OK` / no `XBGST_PURE_INTERMODEL_L2_OK` in `evidence/pure-intermodel-m01.md`. **True at critic start.** | P, E |
| A2 | `openai-codex` OAuth still live. No `/login`. | Tick 404s, auth prompt, or provider drift to `--provider openai`. | P, K |
| A3 | PrimeAgent **coordinates** the connector (tools + `codex exec -p qwen38`), not Grok writing the files. | `r1-*.md` appear with no qwen38 transcript / no `model: qwen3.8-max` banner from a captured exec; parent is only `gx-executor-*`. | C, V, X |
| A4 | `child_fanout` stays **none** *or* L1 explicitly allows it. Not both “none” and “inner 4-phase with live connector”. | Envelope says none **and** M02 claims inner orchestration. That is H1 unfalsifiable. | X, D |
| A5 | Live qwen38 connector completes inside **L1 300s** wall (not the plan’s leftover 180s). | Timeout, EXIT≠0, missing `XBGST_CDX_CONNECTOR_R1_OK` in **stdout of the exec**, not just a markdown file. **E6 already EXIT:1.** | C |
| A6 | Connector does **cross-axis** work (State / Dissent / Rationale), not a canary echo. | File contains the canary and nothing that required reading README L99 + axes. C claimed, ping delivered. | C, X |
| A7 | Gate ≡ live process. | Grep-only files with no attached exec transcript, `env -u CODEX_BIN` line, `file` of the binary, and session banner. | P, C |
| A8 | Disposable cwd for **both** PrimeAgent and connector. | Connector `-C` / recorded cwd is `gx-teams` checkout (E6 already). | I |
| A9 | Inner prompts **strip** ship verbs. | Inner files contain `APPROVED:` (any column), `git push`, or “L1 should ship”. `^APPROVED:` grep stays green → A9 false and M03 still passes. | K |
| A10 | Ambient titanium cannot leak into the exec. | Missing `env -u CODEX_BIN`, or `file "$(command -v codex)"` is ELF 64 under inherited `CODEX_BIN`. | I, K |
| A11 | `op run --env-file=/tmp/xbgst-bailian.env` is non-interactive this session. | `op` unsigned / env missing → Token Plan cannot start. Not curl-as-proof. | C, P |
| A12 | Plan copy-paste timeout (180s) is updated to L1 lock (300s) **before** the executor runs it. | Executor runs the 180s snippet → false E-qwen38 while 300s would have passed, **or** executor “fixes” it by dropping live cdx. | C, E |

**M02 is already falsified as an H1 test** if A1, A3, or A4 fail — even if the grep gate prints `GATE_INTERMODEL_M02_OK`.

---

## Devil’s advocacy — strongest case to SKIP PrimeAgent and stay guided-teams

Skip L2 for this stub. Keep guided-teams (already in motion). Spend Codex only on a **live** `cdx-connector-r1` plus later **delegation mutants**. Do not hire PrimeAgent to role-play the judge who hired it.

1. **The skill itself says skip.** `xbgst-primeagent` When-to-call: long-lived attach/resume/intermodel. Skip: judge rounds, one-shot labrat probes. M02 is “cite README about mailbox vs `session/prompt`.” That is a labrat ping. Using L2 here is a category error, not an experiment.
2. **Marketplace fallback is the product.** `docs/model-routing.md`: missing or unsuitable PrimeAgent → native `gx-*`. Absence must not promote L2. Starting L2 on a solved stub is promoting L2.
3. **Coordinator is already Grok.** M02’s named executor is `gx-executor-inner-r01`. Envelope forbids child fan-out. PrimeAgent cannot spawn `cdx-connector-r1` without tools/fanout. The treatment never leaves the control. V is then a self-comparison.
4. **X-fidelity lives in named Grok types**, godspeed injection, connector-every-PROPOSE, L1 Pareto. Inner 4-phase without `spawn_subagent` types is a markdown play. H5 is the prior, not a surprise.
5. **K / wrap risk.** gx-teams exists so Grok does **not** wrap Claude/TeamCreate. Nesting PrimeAgent as fake-xbgst is the same shape: wrap a runtime to simulate teams. Cheap M01 tick is isolation-proof. Inner autonomous 45 min is a wrap.
6. **C is already failing on the cheap path.** E6 EXIT:1 at L1. Fix live qwen38 (cwd, timeout, `op run`, `env -u`) under Grok labrat **before** burying the same command inside PrimeAgent tools, where skip is invisible.
7. **Opportunity cost is the Codex budget.** 500k tokens / 45 min on a known answer delays D (the mutation score of the routing table), which is the only result that would change SSoT *or* justify keeping the session override.
8. **Reversibility.** Skipping PrimeAgent now is free. Unskip after M01 green + live C transcript is one envelope. The reverse (spend 45 min, then discover grep-forged C) is not free and contaminates V.

**Counter-proposal (concrete):** M02 becomes two L1 labrat steps, no inner judge: (i) live `cdx-connector-r1` with L1 300s, disposable `-C`, State-format prompt that must cite README L99, stdout tee’d into `r1-connector.md`; (ii) optional PrimeAgent `--no-tools` *readback* of that file if M01 is green — or skip (ii) entirely. Inner r0-plan / r1-propose written by `gx-planner-*` / `gx-executor-*` (control). M04–M05 proceed on the session-local table. M03 inner 4-phase waits for C+P green **and** an explicit L1 fanout decision.

---

## What-if — qwen38 400s on a long connector prompt

**Setup.** E5 used 3,455 tokens and finished inside 120s. Connector-as-specified wants README + plan + axes + cross-axis State. That is not a 3k ping. L1 wall is 300s. Plan spawn copy is 180s. Bailian `wire_api=responses` hung-not-400 is already a noted risk (qwen38 evidence: this run did *not* 400; that is not a hang bound). E6 shows a **short** L1 connector already EXIT:1.

**If wall-clock ≈ 400s:**

| Path | What happens | Axis |
|---|---|---|
| Executor runs **180s** snippet | False `E-qwen38` while 300s might pass. Pressure to retry, then skip. | C, E |
| Executor runs **300s** L1 lock | Still kills a 400s completion. Two retries = 10 min of Token Plan for one State line. | C, P |
| Raise to 400s+ silently | E-budget drift; `--autonomous` smell on the connector lane. | K, I |
| Swap to Grok `gx-connector-*` | **Forbidden** this session. Also the H2 collapse. | C, V |
| Write `r1-connector.md` with the canary by hand | M02 grep **passes**. H2 confirmed. Experiment becomes Grok-only with a qwen sticker. | C, P, V |
| Shrink prompt to canary-only | Completes. C **not** measured. X **not** measured. Only P ping. | C, X |
| `Status: blocked E-qwen38` after two live timeouts, transcript attached | **Correct.** M02 does not go green. Stay guided-teams. | C, E, K |

**Reversible failure modes**

- **Hang (not exit):** `timeout` is the only friend. Without it, 45 min inner autonomous waits on a dead bailian stream. Keep `timeout` on the **exec**, not only on PrimeAgent.
- **Partial file:** E6 shape (header + EXIT:1, no canary) is the honest fail. Gate must **reject** that, not `test -s`.
- **Wrong binary:** without `env -u CODEX_BIN`, 400s of titanium is an L3 leak, not a slow qwen. ELF check must run **before** exec.
- **Cwd leak:** long prompt + `-C gx-teams` (E6) lets a read-only sandbox still index the repo and look “smart” without being the Token Plan smoke cwd. I is already failing.
- **Retry storm:** two retries are in the plan. A third is Codex spend without new information. After two live timeouts: block, do not “try ds-flash as connector”.

**What-if counter-proposal:** one **short-but-real** connector prompt (State + Dissent + Rationale, must quote README mailbox line, no plan dump), 300s, disposable cwd, `op run` + `env -u`. If that cannot hit `XBGST_CDX_CONNECTOR_R1_OK` **in the exec transcript**, M02 is blocked and PrimeAgent is not started. Do not lengthen the prompt to make C look like X.

---

## Critique blocks

```
CRITIQUE: M02 cannot test PrimeAgent coordination while a Grok executor owns the files and child_fanout is none.
SEVERITY: RETHINK
CURRENT: gx-executor-inner-r01 + mandatory cdx-connector; envelope fanout none; PrimeAgent “coordinates” inner r0+r1.
ALTERNATIVE: L1 fires live cdx-connector; guided gx-* write r0/r1; PrimeAgent only if M01 green and either (a) --no-tools readback or (b) L1 sets child_fanout=true and tools=shell for the exec. Pick one.
TRADE-OFF: Current looks like pure-intermodel in filenames, sacrifices V/H1 falsifiability. Alternative looks less “inner xbgst”, actually measures C and leaves X for M03.
FAILURE-MODE: GATE_INTERMODEL_M02_OK with no qwen38 process — H1 “confirmed”, H2 true.
CONFIDENCE: high
```

```
CRITIQUE: M02’s connector is a canary parrot gated by greps; live skip is the default, and L1 already EXIT:1.
SEVERITY: RETHINK
CURRENT: spawn copy says “Reply with exactly XBGST_CDX_CONNECTOR_R1_OK plus one State line”; gate greps file strings; plan timeout 180s vs L1 300s.
ALTERNATIVE: require exec transcript (banner model: qwen3.8-max, env -u CODEX_BIN, non-ELF binary, timeout 300s, EXIT 0) inside r1-connector.md; connector body must be State/Dissent/Rationale citing README L99; fail closed on EXIT:1.
TRADE-OFF: Current cheap to “pass”, blind on C. Alternative can fail M02; that is the experiment working.
FAILURE-MODE: qwen38 400s / op unsigned / forgotten env -u → forge or Grok-swap; V poisoned.
CONFIDENCE: high
```

```
CRITIQUE: Inner xbgst 4-phase on a solved stub is Codex theater; the routing table mutants are the actual D/K/C signal.
SEVERITY: CONSIDER
CURRENT: M02 overfit r0+r1 then M03 full 4-phase under 500k/45min autonomous, M05 later.
ALTERNATIVE: After live C, jump M04 table + M05 mutants (connector→Grok, missing env -u, inner APPROVED, banned explore). Delay M03 until those kill. Keep M02 out-of-scope “phases after PROPOSE”.
TRADE-OFF: Current obeys WWKD widen-phases-first, spends the budget on X-cosplay. Alternative improves D/K/P now, delays X (does not drop it).
FAILURE-MODE: 45 min autonomous emits advisory Pareto that reads like L1; K harmed; M05 never reached.
CONFIDENCE: high
```

```
CRITIQUE: Role-playing xbgst COMPILE imports APPROVED+push; E-auth is a caret grep.
SEVERITY: CONSIDER
CURRENT: Inner labeled evidence-only; M03 `! grep -q '^APPROVED:'`; boundary append forbids ship.
ALTERNATIVE: Inner prompt is a stripped 4-phase (PROPOSE+connector, CROSS-CRITIQUE, inner-pareto, COMPILE) that never includes the local-first ship loop; gate greps also `git push`, `Pareto-accept`, unanchored APPROVED, and `git -C gx-teams diff` on source.
TRADE-OFF: Current trusts the model to obey the envelope against the skill it is imitating. Alternative harms X-fidelity-to-full-xbgst (good — full xbgst includes ship) and protects K.
FAILURE-MODE: Inner commits, or L1 treats inner-pareto as accept. Harm K, maybe I.
CONFIDENCE: medium
```

```
CRITIQUE: Guided-teams is not waiting in M06; it is this round. M06 as specified cannot measure X.
SEVERITY: MONITOR
CURRENT: M06 same stub, Grok connector allowed in control only; verdict line required.
ALTERNATIVE: Freeze this L1 round’s artifacts as the guided baseline *now* (plan, axes, this critic, live connector transcript). M06 compares process traces (spawn_method, who pid’d qwen38, authority verbs), not who wrote more markdown.
TRADE-OFF: Current will likely print `verdict: guided` or `inconclusive` after paying L2. Alternative makes V cheap and honest; may never need inner 4-phase to call X.
FAILURE-MODE: Sample=1 filename compare “proves” H1 or H5 by construction.
CONFIDENCE: medium
```

```
CRITIQUE: Using PrimeAgent at all for this stub contradicts the L2 skill’s skip list.
SEVERITY: CONSIDER
CURRENT: User asked to spend Codex and check pure-intermodel vs guided; plan starts M01 then M02 inner.
ALTERNATIVE: Keep M01 as the only PrimeAgent tick (P/I/E, --no-tools, 120s). All inner rounds stay gx-*. Codex spend = live qwen38 connector + optional ds-pro critic later, not an inner scheduler.
TRADE-OFF: Current honors “spend Codex / try L2”. Alternative honors marketplace routing and still spends Codex on C/D. X of *inner* 4-phase is not measured — and should not be, until H1 is falsifiable.
FAILURE-MODE: M01 fails (A1) and M02 starts anyway because the user said generous.
CONFIDENCE: high
```

---

## Round-1 keep / drop (Pareto: improve ≥1 axis, harm none)

Round-1 L1 target was **P, I, E without harming K**. Connector this round is L1 PROPOSE (C), not inner. Align with that.

### KEEP

| Move | Axes up | Why none harmed |
|---|---|---|
| **Block M02 until M01 green** (`GATE_INTERMODEL_M01_OK` + canary in evidence). | P, E, I | X/D not in M02 skeleton; K unchanged. |
| **Marketplace SSoT freeze** (no edits to `model-routing.md` / `connector.md` / `xbreed-shared.md`). | K | Session override stays in envelope. |
| **E-write evidence-only through M06.** First ticks `/tmp/xbgst-prime-*`. | I, K | X does not require source edits. |
| **`env -u CODEX_BIN` + non-ELF `file` before every cdx exec.** | I, K | C still uses stock `codex`. |
| **Fail closed `Status: blocked E-qwen38`** after two *live* timeouts. No Grok connector swap this session. | C, K, V | X delayed, not dropped. |
| **Align spawn timeout to L1 300s** in the executor copy (plan 180s is stale). | C, E | Does not raise inner autonomous. |
| **Disposable `-C` for connector** (`/tmp/codex-token-plan-smoke` or `/tmp/xbgst-prime-*`), not gx-teams. | I | C still reads README via prompt, not by sandboxing `main`. |
| **M05 mutant list as written** (Grok-connector, missing `env -u`, inner `APPROVED`, banned `explore`). | D, K, C | Can dry-grep the table before any 45 min loop. |
| **Keep M02 out-of-scope: phases after PROPOSE, no `--autonomous`, no fanout unless L1 flips it.** | P, K | X belongs to M03, not smuggled into M02. |
| **Freeze this L1 round as guided baseline** (plan, axes, critic, connector transcript) for later V. | V | Does not spend L2. |

### DROP / DO NOT DO this round

| Move | Why it is not Pareto | Would harm |
|---|---|---|
| PrimeAgent inner-xbgst orchestrator under fanout=none | Unfalsifiable H1 | V, X (fake), P (cost) |
| `--autonomous-max-tokens 500000` / 45 min on M02 | Budget was for inner 4-phase; M02 is one stub | K, P, I |
| Grep-only M02 gate as C proof | Rewards H2 | C, P, V |
| Canary-only connector counted as C | Ping ≠ connector | C, X |
| Starting M02 while A1 false (M01 not green) | Plan: none of M02–M07 if M01 failed | P, E |
| Lengthening qwen38 prompt to dump the whole plan | 400s path | C, P |
| Third retry / ds-flash-as-connector / Grok swap | Silent collapse | C, D, V |
| Inner prompt that includes local-first `APPROVED`+push | H3 | K |
| Treating E6 EXIT:1 file as a C hit because the filename exists | `test -s` would pass | C, E |
| Editing marketplace to “connector = qwen38” | E-cdx-connector blocker | K |

### Sequencing that improves P/C/I and does not drop X/D/V

```
M01 green (P/I/E) ──► live cdx-connector-r1 transcript (C/I) ──┬──► M04 table (D)
                                                               ├──► M05 mutants (D/K/C)
                                                               └──► M03 inner 4-phase only if L1 sets fanout/tools
M06 uses this L1 round as guided baseline (V), not a second theater pass unless C+P already green.
```

X is **delayed** until C is real. Delay ≠ drop. Spending X-theater before C is a harm to P and C.

---

## Axes snapshot (critic, not judge)

| Axis | Round-1 move | Harm if M02 proceeds as written |
|---|---|---|
| P | M01 first; cheap live ticks | 500k inner on a known stub |
| C | Live transcript, 300s, fail closed | Grep canary / EXIT:1 ignored |
| X | Native 4-phase stays L1; inner later | Markdown xbgst without types |
| D | Table + mutants after live C | Mutants never reached |
| K | No SSoT write, no inner ship, no wrap | Autonomous inner judge + titanium leak |
| V | Freeze guided artifacts now | Confounded filename compare |
| I | `/tmp/xbgst-prime-*` + `env -u` | E6 cwd already gx-teams |

**Do not dispatch M02 Codex on H1.** Dispatch it only as a **live C probe** after M01, or skip L2 and keep guided-teams.

`[critic-gate: advisory, risks-open]` — H2/H4 leading; H1 unfalsifiable under current M02 shape; E6 already EXIT:1.

# Plan — Pure-intermodel L2 xbgst experiment (PrimeAgent inner 4-phase vs guided-teams)
**Session:** 1 | **Dispatched by:** xbgst | **Date:** 2026-08-21
**Spec:** this Phase 0 artifact | **Author:** wwkd posture, 2026-08-21
**Writes:** `gx-teams/.xbgst/` and (if L1 authorizes) `gx-teams/docs/` + `gx-teams/evidence/` only until E-write is decided.
**Never write:** marketplace plugin, installed plugin, `~/.grok/skills`, `scripts/prime-agent-l2.sh`, sekhmet, ds4cc.

evidence: none — planning artifact

---

## Phase 0 — State map

### Exists
- **gx-teams on `main`** at `a26eed4` (clean; origin `git@github.com:VeigaPunk/gx-teams.git`). Handoff “uncommitted README / acp-oneshot / gate-m07” is **stale** — those landed in `e8bfcbd` + `a26eed4`.
- **Shipped harness:** M01 mux, M02 one real `grok -p`, M03 `GX_PARENT_SESSION` = session name, M04 JSONL mailbox (log only), M05 hardcap 16, M06 godspeed files + two-pane dm. Cheap all-green: `bash scripts/gate-all.sh` → `GX-TEAMS-GATE-OK` (skips M02 and M07).
- **M07 optional ACP initialize-oneshot** shipped (`scripts/acp-oneshot.py` + `scripts/gate-m07.sh`). README: *“Live DMs still need ACP `session/prompt` — mailbox JSONL is the log only.”* That is the next unshipped **gx-teams** slice. Do not invent M09.
- **M08** is a marketplace SKILL.md `spawn_method: tmux-pane` pointer only (`evidence/m08-hook.md` GATE_M08_OK). Installed plugin still lacks `tmux-pane`. Out of this experiment’s write scope.
- **Live routing canaries (this host, 2026-08-21):**
  - `codex exec -p qwen38` → `XBGST_QWEN38_OK` (`evidence/qwen38-cli.md`)
  - `codex exec -p ds-flash` → `XBGST_DSFLASH0731_OK`
  - `codex exec -p ds-pro` → `XBGST_DSPRO0813_OK`
  - stock `codex exec -m gpt-5.6-luna` E2 → `XBGST_CDX_REVENGER_OK`
- **Profiles (names only):** `~/.codex/qwen38.config.toml` `model = "qwen3.8-max"` / `model_provider = "bailian-cli"`; same shape for ds-flash / ds-pro. Provider `bailian-cli` `wire_api = "responses"`. `/tmp/xbgst-bailian.env` present. Ambient `CODEX_BIN=/home/vgpnk/.local/bin/codex-titanium` (ELF). Stock `codex` is a bash stub; **all Token Plan / E2 / connector execs must `env -u CODEX_BIN`**.
- **Canonical routing SSoT:** marketplace `plugins/xbgst-stack/docs/model-routing.md`. xbrd-grok docs are pointers / superseded freeze notes. Do not fork.
- **PrimeAgent 0.7.4** on PATH (`basename prime-agent`). `prime-agent model list` includes `openai-codex` / `gpt-5.4` (prior probe `XBGST_OPENAI_L2_OK`). Help: `--provider`, `--cwd`, `--session-dir`, `--append-system-prompt`, `-p`, `--no-tools`, `--no-session`, `--autonomous*`, `send` / `attach` / `list`.
- **Marketplace L2 skill (preferred SSoT):** `skills/xbgst-primeagent/SKILL.md` — OpenAI ChatGPT/Codex OAuth (`openai-codex`) preferred; required envelope `route_id, parent, task, scope, allowed_actions, return, stop`; first ticks `/tmp/xbgst-prime-*`; returns evidence not decisions; child fan-out off unless envelope allows; never titanium / never `/login` / never `pi`.
- **Host `~/.grok/skills/xbgst-primeagent/SKILL.md` is STALE (xAI-only).** Do not treat as SSoT. Do not edit it this experiment.
- **xbreed essence (inferred, not invented):** planner first (Round 0 / Phase 0, WWKD); connector **every PROPOSE**; Pareto on evidence; 4 rounds max; local-first ship to `main` **by L1 only**; Grok L1 judge; optional PrimeAgent L2-loop; Exception E2 revenger → stock cdx; Token Plan lanes qwen3.8-max / ds-flash / ds-pro; Daybreak Blue lab-only; Titanium = sekhmet L3 only; never inherit judge authority into L2; banned `general-purpose` / `explore`.
- **Prior L2 pattern (host, not this repo):** `~/.xbgst/prime-agent/launch-l2-openai.sh` uses `--provider openai` (drift vs marketplace `openai-codex`). RLM children already proven (`INTERMODEL.md`: two named children, parent replies, then released). Copy envelope + disposable cwd; do not copy `--provider openai` or titanium-cache roster rows.
- **sekhmet-l3 / ds4cc:** direction only. L3 is a separate plane; this experiment must not proxy sekhmet or invoke `codex-titanium`. ds4cc critic/heuer is optional and out of scope.

### Missing
- `gx-teams/.xbgst/` tree (this plan is the first file).
- Experiment envelope + canary evidence for a **this-run** L2 tick (`XBGST_PURE_INTERMODEL_L2_OK`).
- Inner xbgst round artifacts (r0 plan, r1–rN propose/critique/pareto/compile).
- Session-local inner **delegation table** (not a marketplace SSoT write).
- Mutation score of those delegations.
- Head-to-head evidence: pure-intermodel vs guided-teams.
- M07 ACP **live DM** (`session/prompt`); current oneshot is initialize-then-kill only.

### Risk
- **R1 authority leak:** inner PrimeAgent “xbgst rounds” can look like a judge. They are **evidence generators**. L1 alone names axes, Pareto-accepts, `APPROVED`, ships.
- **R2 connector SSoT clash:** marketplace `agents/connector.md` + xbreed-shared pin connector to **Grok inherit / no codex**. This session user-overrides connector to **always** outbound stock `codex exec -p qwen38` named `cdx-connector-*`. Must **not** edit marketplace SSoT to match; pin the override in the experiment envelope only.
- **R3 inner 4-phase fidelity unknown:** PrimeAgent can `-p` a canary and can RLM-child; whether it can actually run PROPOSE→CROSS-CRITIQUE→PARETO→COMPILE with a live qwen38 connector is the experiment. Fail closed to guided-teams.
- **R4 qwen38 long-prompt stability:** Token Plan canary used 3,455 tokens / 120s cap. Connector prompts are larger. Cap + retry + `Status: blocked` — do not silently fall back to Grok connector this session.
- **R5 provider flag drift:** SSoT / prior probe = `--provider openai-codex`; host launch scripts = `--provider openai`. Pin `openai-codex`. If that lane 404s, escalate — do not silently switch, do not run `/login`.
- **R6 write scope:** first ticks must stay `/tmp/xbgst-prime-*`. Inner work on gx-teams source requires L1 E-write. Default = **evidence-only**.
- **R7 `op` not signed in:** Token Plan still has `/tmp/xbgst-bailian.env`. Gates use `op run --env-file` or fail `E-token-plan`, never curl-as-proof, never commit `.env`.
- **R8 titanium inheritance:** ambient `CODEX_BIN` is titanium. Any gate that forgets `env -u CODEX_BIN` is a blocker (E-CODEX_BIN).
- **R9 token spend:** generous, especially Codex. Still stop on envelope `stop` caps. Inner `--autonomous` is **not** an xbgst scheduler.

---

## Data Walk (WWKD Phase 0)

Looked at (not the spec’s description — the thing itself):

| Input | Found |
|---|---|
| `gx-teams` git | clean `main` `a26eed4`; 7 commits M01→M_final; `.gitignore` is `*.tmp` + `.gx-teams/` (**does not** ignore `.xbgst/`) |
| `gx-teams.sh` | spawn/nuke/dm only; mode `cmd`; deny claude/TeamCreate; hardcap 16; identity env; JSONL O_APPEND |
| gates | `gate.sh` M01; `gate-m02`..`m07`; `gate-all` skips M02+M07 |
| evidence/ | 6 canaries; **no** PrimeAgent tick, **no** inner-round, **no** ACP `session/prompt` |
| marketplace routing + primeagent skill + xbgst skill + xbreed-shared + connector.md | L1 Grok; optional OpenAI L2; connector Grok-native; E2 stock cdx; Token Plan opt-in via `-p` |
| host installed primeagent skill | xAI-only stale |
| xbrd-grok docs | pointer + superseded titanium recipes — **do not execute** |
| sekhmet-l3 | L3 64-wide / titanium; L2 pulse JOBS=1; never this experiment’s runtime |
| ds4cc plans | kimi plugin Phase 0; orthogonal |
| `prime-agent --help` / `model list` | 0.7.4; openai-codex gpt-5.4 present; RLM/send/attach exist |
| `~/.codex/qwen38.config.toml` | file exists; model id qwen3.8-max; no secrets read beyond names |

Surprises: (1) working tree is clean — planner must not “finish” already-committed M07 initialize. (2) host L2 launch scripts are **not** the marketplace OpenAI command block. (3) marketplace connector forbids codex; this session requires it. (4) next gx-teams feature is already named in README (ACP `session/prompt`), not a new milestone number.

Spec/reality: experiment is feasible as an **evidence program** on top of a shipped mux. It is **not** a missing-harness build. Skeleton is an L2 tick, not another tmux spawn.

---

## WWKD

1. **What:** Prove whether a **pure-intermodel** path (Grok L1 launches one PrimeAgent L2-loop that itself runs inner xbgst 4-phase rounds on gx-teams, with connector always `cdx-connector-*` = `env -u CODEX_BIN codex exec -p qwen38`) produces better evidence than **guided-teams** (Grok L1 `spawn_subagent` / gx-teams panes). Success boundary: M01–M06 experiment gates green with canaries on disk; inner rounds never auto-ship; marketplace/plugin/skills untouched. Optional M07 (ACP live DM) only after E-write.
2. **Why:** User asked to check pure-intermodel vs intermediary-guided teams, pin connector to cdx/qwen3.8-max **this session**, spend Codex tokens, mutation-test the inner delegations, and keep L1 as sole Pareto/`APPROVED`/ship authority. Evidence: live Token Plan + openai-codex probes already PASS; gx-teams M01–M06 + M07-init shipped; inner 4-phase + comparison **do not exist yet**.
3. **Assumptions/Risks:** openai-codex OAuth still live (no `/login`); qwen38 profile remains; `/tmp/xbgst-bailian.env` usable without interactive `op`; PrimeAgent tools can shell `codex exec` from disposable cwd; inner “judge” will obey evidence-only; session connector override is **not** a SSoT write. Risks R1–R9 above. If M01 canary fails → `Status: blocked` fallback to guided-teams, do not promote L2.
4. **How:** Skeleton L2 tick (M01) → overfit one inner r0+r1 with live qwen38 connector (M02) → widen **one axis per milestone**: 4-phase e2e (M03), delegation table (M04), mutate those delegations (M05), compare vs guided-teams (M06), then (only if E-write) bounded ACP `session/prompt` on gx-teams (M07). Polish last (M_final report).
5. **Escalation points:** see below — L1 must answer before M02 write, M04 SSoT, M07 source, or any inner `APPROVED`.

### Escalation points (judge arbitration before dispatch)

| Id | Decision | Default if judge silent one cycle | Blocker if wrong |
|---|---|---|---|
| **E-auth** | Inner xbgst may **not** Pareto-accept, `APPROVED`, commit, or push. L1 only. | Inner COMPILE = evidence files under `gx-teams/.xbgst/inner/` + `evidence/`. Marker `[planner-gate: advisory, risks-open]`. | Inner ship of marketplace/plugin/gx-teams `main`. |
| **E-cdx-connector** | Connector-as-cdx/`qwen38` is a **session override**, not a marketplace SSoT change. | Keep override in envelope + this plan. Do not edit `agents/connector.md` or xbreed-shared. | Writing SSoT “connector = qwen38”. |
| **E-write** | May inner PrimeAgent write gx-teams **source** (`gx-teams.sh`, `scripts/*`) or **evidence-only**? | **Evidence-only** through M06. M07 ACP live DM waits for explicit L1 yes. Disposable cwd always `/tmp/xbgst-prime-*` for first ticks; any gx-teams write uses a disjoint worktree named in `scope`. | First tick on xbgst/`gx-teams` `main`. |
| **E-budget** | Token/wall caps. User said generous, especially Codex. | M01: `--no-tools` 120s. M02 connector: 180s / qwen38. Inner 4-phase: `autonomous-max-tokens` 200000 Codex-side + 30 min wall unless L1 raises. | Uncapped `--autonomous` becoming a scheduler. |
| **E-provider** | Pin `--provider openai-codex` (marketplace + `model list`). | Do not use host `launch-l2-openai.sh` as-is (`--provider openai`). | `/login`, xAI wrapper, or titanium. |
| **E-axes** | Judge names experiment axes **after** this plan lands. Planner does not name L1 axes. | Downstream specialists wait for L1 axis list. Milestones below are WWKD gates, not axes. | Specialists inventing L1 axes from this plan. |

---

## Session-local inner routing (NOT marketplace SSoT)

Copy into every inner envelope. Do not write this table into `docs/model-routing.md`.

| Inner role | Spawn name | Lane | Effort | Notes |
|---|---|---|---|---|
| L2 root (role-play inner orchestrator) | `prime-l2-intermodel` (not `gx-…`) | `prime-agent --provider openai-codex --model gpt-5.4` | medium–high | Evidence only. Not L1. Not selector. Not sekhmet. |
| the-planner | inner `the-planner` via L2 tools / RLM only if envelope allows children | openai-codex gpt-5.4 **or** `codex exec -p ds-pro` | medium–high | Round 0 only; WWKD. |
| connector | **`cdx-connector-rN`** | `env -u CODEX_BIN timeout 180s codex exec -p qwen38 --skip-git-repo-check --ephemeral -C <disposable> -s read-only` | default | **Always this session.** Never Grok `spawn_subagent`. Never titanium. |
| critic, reviewer, sentinel, mutation-tester | `cdx-{role}-rN` or inner RLM | openai-codex gpt-5.4 / `ds-pro` | medium–high | Pondering roles. |
| distiller, scribe, executor, labrat | `cdx-{role}-rN` | `codex exec -p ds-flash` | low | Speed / concurrency. |
| scout | `cdx-scout-rN` | `codex exec -p qwen38` | low–medium | Breadth cheap. |
| the-revenger | `cdx-revenger-*` | stock `codex exec -m gpt-5.6-luna` | E2 freeze | Not Token Plan. Not titanium. |
| daybreak | — | lab only | — | Do not use as inner default. |

Hard bans (every inner prompt): `general-purpose`, `explore`, `codex-titanium`, `/login`, host `pi`, sekhmet/L3, claiming `APPROVED`/ship.

---

## Required L2 envelope (M01+; fill per milestone)

```yaml
route_id: pure-intermodel-l2-2026-08-21
parent: gx-labrat-l2tick
task: <milestone one-liner>
scope: |
  read: /home/vgpnk/Projects/xbgst/gx-teams
  write: /tmp/xbgst-prime-* and gx-teams/.xbgst/ plus gx-teams/evidence/
  forbid: grok-marketplace/plugins, ~/.grok/skills, sekhmet-l3, installed-plugins
allowed_actions: |
  prime-agent openai-codex; shell stock codex with env -u CODEX_BIN;
  child fan-out: none unless L1 sets allowed_actions.child_fanout=true
return: evidence markdown + canary string to parent gx-labrat-l2tick; no decisions
stop: |
  canary hit OR Status: blocked <reason>;
  abort on titanium, /login, banned types, marketplace writes, inner APPROVED
```

Boundary append (from marketplace command, keep verbatim sense):

`L2-loop only. L1 xbgst is the sole scheduler, Pareto judge, APPROVED authority, integrator, and shipper. Follow the supplied route envelope. Return evidence, not decisions. No child fan-out unless allowed. Never act as xbrd-selector or sekhmet. Never spawn general-purpose or explore. Never invoke codex-titanium.`

---

## Milestones

| # | Title | Gate command | Expected output | Executor |
|---|---|---|---|---|
| M01 | Skeleton: one PrimeAgent openai-codex L2 tick + envelope + canary | `bash gx-teams/.xbgst/gates/gate-intermodel-m01.sh` | `GATE_INTERMODEL_M01_OK` and `evidence/pure-intermodel-m01.md` contains `XBGST_PURE_INTERMODEL_L2_OK` | gx-labrat-l2tick |
| M02 | Overfit one inner r0+r1 with live `cdx-connector-r1` = qwen38 | `bash gx-teams/.xbgst/gates/gate-intermodel-m02.sh` | `GATE_INTERMODEL_M02_OK`; bit-for-bit files listed below; `XBGST_CDX_CONNECTOR_R1_OK` | gx-executor-inner-r01 **plus mandatory** cdx-connector-r1 |
| M03 | Generalize (a): inner 4 phases e2e, evidence-only | `bash gx-teams/.xbgst/gates/gate-intermodel-m03.sh` | `GATE_INTERMODEL_M03_OK`; rN artifacts for PROPOSE (has connector), CROSS-CRITIQUE, PARETO, COMPILE; **no** git commit | gx-executor-inner-4ph |
| M04 | Generalize (b): session-local multi-model delegation table | `bash gx-teams/.xbgst/gates/gate-intermodel-m04.sh` | `GATE_INTERMODEL_M04_OK`; `.xbgst/inner/delegation.md` lists every inner role → probed lane; greps prove marketplace SSoT **unchanged** | gx-executor-delegate |
| M05 | Generalize (c): mutation-test the delegations | `bash gx-teams/.xbgst/gates/gate-intermodel-m05.sh` | `GATE_INTERMODEL_M05_OK`; `MUTATION SCORE: killed/total`; connector-off-qwen38 mutant **KILLED**; titanium mutant **KILLED** | gx-mutester-delegate |
| M06 | Generalize (d): compare pure-intermodel vs guided-teams | `bash gx-teams/.xbgst/gates/gate-intermodel-m06.sh` | `GATE_INTERMODEL_M06_OK`; `evidence/pure-vs-guided.md` with same stub task both modes | gx-labrat-compare |
| M07 | Generalize (e): bounded gx-teams ACP `session/prompt` live DM | `bash scripts/gate-m07.sh && bash gx-teams/.xbgst/gates/gate-intermodel-m07.sh` | `GATE_M07_OK` still; new `GATE_INTERMODEL_M07_OK` = one `session/prompt` round-trip or `Status: blocked E-write` if L1 denied source | gx-executor-acp-dm |
| M_final | Polish: experiment report (not product chrome) | `test -f evidence/pure-intermodel-report.md && git -C /home/vgpnk/Projects/xbgst/grok-marketplace diff --exit-code -- plugins/xbgst-stack && bash scripts/gate-all.sh` | `GX-TEAMS-GATE-OK`; report cites M01–M06 canaries; marketplace plugin diff empty; no secrets | gx-scribe-intermodel |

### M01 — Skeleton (end-to-end, toy)
**Does:** L1-owned `gx-labrat-l2tick` launches **one** `prime-agent --provider openai-codex` print tick in disposable `/tmp/xbgst-prime-*` with the full envelope + boundary append, no tools, no session save, model `gpt-5.4`, thinking `minimal`. Copies stdout into `gx-teams/evidence/pure-intermodel-m01.md`.
**Gate:**

```bash
# created by executor; contract:
set -euo pipefail
ROOT=/home/vgpnk/Projects/xbgst/gx-teams
test -f "$ROOT/.xbgst/envelopes/m01.yaml"
grep -E 'route_id:|parent:|task:|scope:|allowed_actions:|return:|stop:' "$ROOT/.xbgst/envelopes/m01.yaml"
CWD=$(mktemp -d /tmp/xbgst-prime-XXXX)
[[ "$CWD" == /tmp/xbgst-prime-* ]]
PA=$(command -v prime-agent)
[[ $(basename "$PA") == prime-agent ]]
[[ $(prime-agent --version) == 0.7.4 ]]
export PRIME_AGENT_TELEMETRY=0 DO_NOT_TRACK=1 PI_SKIP_VERSION_CHECK=1
BOUNDARY='L2-loop only. L1 xbgst is the sole scheduler, Pareto judge, APPROVED authority, integrator, and shipper. Follow the supplied route envelope. Return evidence, not decisions. No child fan-out unless allowed. Never act as xbrd-selector or sekhmet. Never spawn general-purpose or explore. Never invoke codex-titanium.'
timeout 120s prime-agent --provider openai-codex --model gpt-5.4 --thinking minimal \
  --no-tools --no-session --cwd "$CWD" --append-system-prompt "$BOUNDARY" \
  -p 'Read envelope at '"$ROOT"'/.xbgst/envelopes/m01.yaml if present in prompt. Reply with exactly: XBGST_PURE_INTERMODEL_L2_OK' \
  | tee /tmp/xbgst-pure-intermodel-m01.out
grep -q XBGST_PURE_INTERMODEL_L2_OK /tmp/xbgst-pure-intermodel-m01.out
grep -q XBGST_PURE_INTERMODEL_L2_OK "$ROOT/evidence/pure-intermodel-m01.md"
! grep -qi 'codex-titanium\|/login\|APPROVED:' /tmp/xbgst-pure-intermodel-m01.out
echo GATE_INTERMODEL_M01_OK
```

**Expected output:** `GATE_INTERMODEL_M01_OK`. Evidence file records binary path, provider `openai-codex`, cwd glob `/tmp/xbgst-prime-*`, canary HIT, no secrets.
**Touches:** `gx-teams/.xbgst/envelopes/m01.yaml`, `gx-teams/.xbgst/gates/gate-intermodel-m01.sh`, `gx-teams/evidence/pure-intermodel-m01.md`.
**Out-of-scope:** inner rounds, connector spawn, gx-teams source, marketplace, `--autonomous`, child fan-out, `/login`.
**Reference:** marketplace `commands/xbgst-primeagent.md` command block; prior probe in `plugins/xbgst-stack/evidence/openai-primeagent-l2-loop-routing.md`.

### M02 — Overfit one real instance
**Does:** Solve **exactly one** inner xbgst stub: Round 0 planner note + Round 1 PROPOSE that **must** include live connector `cdx-connector-r1` via `env -u CODEX_BIN codex exec -p qwen38`. PrimeAgent coordinates; it does not pretend to be `gx-connector-*`. Bit-for-bit files, not plausibility.
**Single instance:** inner task = “state whether gx-teams M07 live DM (`session/prompt`) is the next unshipped slice, citing README.md line about mailbox JSONL. Do not implement.”
**Gate (bit-for-bit):**

Required files (all must exist, non-empty):

- `gx-teams/.xbgst/inner/r0-plan.md` — contains `WWKD` and `evidence: none — planning artifact`
- `gx-teams/.xbgst/inner/r1-propose.md` — contains `PROPOSE`
- `gx-teams/.xbgst/inner/r1-connector.md` — contains `cdx-connector-r1` and `XBGST_CDX_CONNECTOR_R1_OK`
- `gx-teams/evidence/pure-intermodel-m02.md` — records qwen38 banner `model: qwen3.8-max`, `env -u CODEX_BIN`, binary not ELF titanium

```bash
ROOT=/home/vgpnk/Projects/xbgst/gx-teams
test -s "$ROOT/.xbgst/inner/r0-plan.md"
grep -q WWKD "$ROOT/.xbgst/inner/r0-plan.md"
test -s "$ROOT/.xbgst/inner/r1-propose.md"
grep -q PROPOSE "$ROOT/.xbgst/inner/r1-propose.md"
test -s "$ROOT/.xbgst/inner/r1-connector.md"
grep -q cdx-connector-r1 "$ROOT/.xbgst/inner/r1-connector.md"
grep -q XBGST_CDX_CONNECTOR_R1_OK "$ROOT/.xbgst/inner/r1-connector.md"
grep -q qwen3.8-max "$ROOT/evidence/pure-intermodel-m02.md"
# titanium not used
! grep -q E-CODEX_BIN "$ROOT/evidence/pure-intermodel-m02.md" || true
file "$(CODEX_BIN= command -v codex)" | grep -qi 'ELF 64' && { echo blocked E-CODEX_BIN; exit 2; }
# marketplace untouched
git -C /home/vgpnk/Projects/xbgst/grok-marketplace diff --exit-code -- plugins/xbgst-stack
echo GATE_INTERMODEL_M02_OK
```

**Connector spawn shape (copy):**

```bash
bin=$(CODEX_BIN= command -v codex)
file "$bin" | grep -qi 'ELF 64' && { echo blocked E-CODEX_BIN; exit 2; }
op run --env-file=/tmp/xbgst-bailian.env -- env -u CODEX_BIN timeout 180s "$bin" exec -p qwen38 \
  --skip-git-repo-check --ephemeral \
  -C /tmp/codex-token-plan-smoke \
  -s read-only \
  'You are cdx-connector-r1. Cross-axis only. Reply with exactly XBGST_CDX_CONNECTOR_R1_OK plus one State line on gx-teams M07 mailbox vs session/prompt.'
```

If qwen38 times out twice: `Status: blocked E-qwen38` — **do not** swap to Grok connector (session override). Escalate E-cdx-connector / E-budget.
**Touches:** `.xbgst/inner/r0-plan.md`, `r1-propose.md`, `r1-connector.md`, `evidence/pure-intermodel-m02.md`, gate script.
**Out-of-scope:** phases after PROPOSE; mutation; comparison; source edits; 4-round cap; child fan-out unless L1 sets it.

### M03 — Generalize (a) all 4 inner phases e2e
**Does:** Widen **phase coverage only** (same stub instance as M02). Inner loop must emit artifacts for PROPOSE (connector present), CROSS-CRITIQUE, PARETO FILTER, COMPILE. Inner Pareto is **advisory scoring of moves as evidence**, labeled `inner-pareto` — L1 still judges. Round cap 1 for this milestone (one full 4-phase, not 4 outer rounds).
**Gate:**

```bash
I=/home/vgpnk/Projects/xbgst/gx-teams/.xbgst/inner
for f in r1-propose.md r1-critique.md r1-pareto.md r1-compile.md r1-connector.md; do test -s "$I/$f"; done
grep -q cdx-connector "$I/r1-propose.md"
grep -q inner-pareto "$I/r1-pareto.md"
grep -q COMPILE "$I/r1-compile.md"
! grep -q '^APPROVED:' "$I/r1-compile.md"
# source must remain unchanged this milestone
git -C /home/vgpnk/Projects/xbgst/gx-teams diff --exit-code -- gx-teams.sh scripts README.md
echo GATE_INTERMODEL_M03_OK
```

**Expected:** `GATE_INTERMODEL_M03_OK`. Compile file states `evidence-only; L1 retains APPROVED`.
**Out-of-scope:** changing role→model map; writing gx-teams.sh; shipping.

### M04 — Generalize (b) sensible multi-model delegation table
**Does:** Widen **routing documentation only**. Materialize the session-local table (above) under `.xbgst/inner/delegation.md` with one **probed** spawn example per lane (reuse existing canaries where live; do not re-probe Daybreak). Grep-lock marketplace SSoT files unchanged.
**Gate:**

```bash
D=/home/vgpnk/Projects/xbgst/gx-teams/.xbgst/inner/delegation.md
grep -q 'cdx-connector' "$D"
grep -q 'qwen3.8-max' "$D"
grep -q 'deepseek-v4-flash-0731' "$D"
grep -q 'deepseek-v4-pro-0813' "$D"
grep -q 'gpt-5.6-luna' "$D"
grep -q 'openai-codex' "$D"
grep -q 'NOT marketplace SSoT' "$D"
git -C /home/vgpnk/Projects/xbgst/grok-marketplace diff --exit-code -- plugins/xbgst-stack/docs/model-routing.md plugins/xbgst-stack/agents/connector.md plugins/xbgst-stack/commands/references/xbreed-shared.md
echo GATE_INTERMODEL_M04_OK
```

**Out-of-scope:** editing connector.md; claiming Token Plan is now default Grok-host connector.

### M05 — Generalize (c) mutation-test of delegations
**Does:** Widen **test-the-routing-invariants**, not gx-teams.sh. Isolated copies of `delegation.md` (no git worktree required if only `.xbgst/` scratch; do not pollute `main` source). Mutants (minimum 4):
1. Connector lane → Grok `spawn_subagent` (must **KILLED** by session-override grep).
2. Connector/`codex exec` without `env -u CODEX_BIN` (must **KILLED** by E-CODEX_BIN / ELF check).
3. Planner lane → ds-flash (may SURVIVE as quality finding; record; not a hard invariant).
4. Inner compile emits `APPROVED:` (must **KILLED** by E-auth grep).
5. Optional: banned type `explore` in spawn name (must **KILLED**).

**Gate:**

```bash
R=/home/vgpnk/Projects/xbgst/gx-teams/evidence/pure-intermodel-m05.md
grep -q 'MUTATION SCORE:' "$R"
grep -A2 'connector.*Grok' "$R" | grep -q KILLED
grep -A2 'CODEX_BIN' "$R" | grep -q KILLED
grep -A2 'APPROVED' "$R" | grep -q KILLED
echo GATE_INTERMODEL_M05_OK
```

**Naming:** executor `gx-mutester-delegate` (xbreed `gx-mutester-{scope}`).
**Out-of-scope:** mutating `gx-teams.sh` control flow (that is product mutation-testing, later).

### M06 — Generalize (d) comparison vs guided-teams
**Does:** Same stub task as M02, run **guided-teams** path: L1 `spawn_subagent` / optional `gx-teams` pane for `gx-planner-*` + `gx-connector-*` (Grok-native — this is the **control**, so Grok connector is allowed **here only**). Produce a comparison table: wall time, tokens if known, artifact completeness, connector-override compliance, authority leaks.
**Gate:**

```bash
F=/home/vgpnk/Projects/xbgst/gx-teams/evidence/pure-vs-guided.md
grep -q 'pure-intermodel' "$F"
grep -q 'guided-teams' "$F"
grep -q 'cdx-connector-r1' "$F"
grep -q 'gx-connector' "$F"
grep -qE 'verdict: (pure|guided|tie|inconclusive)' "$F"
echo GATE_INTERMODEL_M06_OK
```

**Expected:** a **verdict line**. Inconclusive is valid if sample=1. Do not ship on this verdict — L1 still decides.
**Out-of-scope:** changing default xbgst spawn_method; installing tmux-pane into `~/.grok/skills`.

### M07 — Generalize (e) bounded gx-teams feature (ACP live DM)
**Does:** Next unshipped slice **already named in README**: ACP `session/prompt` live DM. Current `acp-oneshot.py` = initialize then kill. This milestone extends **one** JSON-RPC `session/prompt` (or documented ACP equivalent) so a mailbox `dm` can be paired with a live prompt, then kill. **Blocked unless E-write = yes.**
If E-write denied: write `evidence/pure-intermodel-m07-design.md` only and exit `Status: blocked E-write` (exit 2) — that is a **valid** experiment outcome, not a skip-silent.
**Gate (when E-write yes):**

```bash
bash /home/vgpnk/Projects/xbgst/gx-teams/scripts/gate-m07.sh   # still GATE_M07_OK
bash /home/vgpnk/Projects/xbgst/gx-teams/.xbgst/gates/gate-intermodel-m07.sh
# expect GATE_INTERMODEL_M07_OK meaning one session/prompt round-trip logged
# still no TeamCreate; flags still before stdio
```

**Out-of-scope:** M09; wrapping Claude; making M07 a `gate-all.sh` blocker; marketplace SKILL install of M08.

### M_final — Polish
**Does:** One report: `evidence/pure-intermodel-report.md` citing canaries, comparison verdict, mutation score, open escalations. No framework, no README rewrite unless L1 APPROVED a product slice.
**Gate:** report exists; `grok-marketplace/plugins/xbgst-stack` git diff empty; no secrets (`rg -i 'sk-|api_key|op://' evidence/` empty); `bash scripts/gate-all.sh` still `GX-TEAMS-GATE-OK`.

---

## Dependencies

```
M01 → M02 → M03
M02 → M04 → M05
M03 + M05 → M06
M03 + E-write → M07
M06 (+ M07 if run) → M_final
```

None of M04–M07 may start if M01 failed (L2 tick is the skeleton). M07 must not start if E-write unresolved.

Parallel after M02: M03 (phases) and M04 (table) may run in parallel — they touch disjoint files (`inner/r1-*` vs `inner/delegation.md`).

---

## Executor handoff notes (cold start)

- **Language:** bash + markdown, match gx-teams. No Rust lock.
- **Spawn method (L1 side):** `spawn_subagent` named types only, **or** `gx-teams` panes. Never `general-purpose` / `explore`.
- **Connector this session:** always outbound stock Codex, name `cdx-connector-rN`, profile `qwen38`. Not Grok spawn.
- **PrimeAgent cwd:** `/tmp/xbgst-prime-*` first; never xbgst `main`; never sekhmet.
- **Telemetry:** `PRIME_AGENT_TELEMETRY=0` `DO_NOT_TRACK=1` `PI_SKIP_VERSION_CHECK=1`.
- **On gate fail:** `Status: blocked <reason>` + recovery (rerun once, then escalate). Do not invent a new lane.
- **Do not commit** unless L1 emits `APPROVED:`.
- **Do not edit** `~/.grok/skills`, marketplace plugin, installed plugin.

Godspeed: name axes (L1), iterate cheap in parallel, keep moves that improve any axis and harm none, don’t aim.

`[planner-gate: advisory, risks-open]` — E-auth, E-cdx-connector, E-write, E-budget, E-provider, E-axes open until L1 answers.

---

## What this plan is not

- Not an implementation of ACP live DM.
- Not a rewrite of Grok-native connector SSoT.
- Not a promotion of PrimeAgent to L1.
- Not an L3 sekhmet campaign.
- Not a pin of Daybreak Blue as revenger.
- Not a `/login` or credential copy.
- Not a commit.

# Plan — Frontier real inner xbgst (Codex sub-switch + ACP live DM)
**Session:** 2 | **Dispatched by:** xbgst | **Date:** 2026-08-21
**Spec:** this Phase 0 artifact | **Author:** wwkd posture, 2026-08-21
**Writes (after L1 axis-name + E-write lock):** `gx-teams/.xbgst/`, `gx-teams/evidence/`, `gx-teams/README.md`, and (E-write YES) `gx-teams.sh` + `gx-teams/scripts/*`. Optional `gx-teams/docs/` only if README overflows; default = README + evidence, no new docs dir.
**Never write:** `~/.codex` (user already switched; backups exist), marketplace plugin, `~/.grok/skills`, sekhmet, `codex-titanium`, secrets, `*.bak`, API keys.
**Never redo:** user SUB_SWITCH_OK / QWEN_STILL_OK completions; previous-experiment canary ticks; MUTATION SCORE theater; `Reply with exactly CANARY` inner tasks.

evidence: none — planning artifact

`[planner-gate: advisory, risks-open]` — L1 names axes after this plan. Escalations below stay open one dispatch cycle; executors may then proceed with this marker.

---

## Phase 0 — State map

### Exists
- **gx-teams `main` `a26eed4`** tracking `origin/main` (`git@github.com:VeigaPunk/gx-teams.git`). Working tree dirty only with **unshipped session-1 experiment** (no APPROVED, no commit):
  - `?? .xbgst/` (plans, envelopes, gates, inner r0–r4, judge r1)
  - `?? evidence/pure-intermodel-m01.md` `m02.md` `m03.md` `m05.md` `pure-intermodel-report.md` `pure-vs-guided.md`
- **Shipped product:** M01 mux, M02 one `grok -p`, M03 session-name identity, M04 JSONL mailbox (**log only**, O_APPEND, no mkdir in `dm`), M05 hardcap 16, M06 godspeed files. Cheap all-green: `bash scripts/gate-all.sh` → `GX-TEAMS-GATE-OK` (skips M02 `grok -p` and M07 ACP).
- **M07 handshake shipped:** `scripts/acp-oneshot.py` + `scripts/gate-m07.sh` = JSON-RPC `initialize` (`protocolVersion: 1`) then kill. Cap 30s. `/tmp/gx-acp-oneshot.out` = `protocolVersion=1`. README L99: *“Live DMs still need ACP `session/prompt` — mailbox JSONL is the log only.”* That is still the next unshipped **gx-teams** slice.
- **M08** marketplace `spawn_method: tmux-pane` pointer only. **Out of write scope.**
- **Host Codex sub-switch (USER already did; do not revert, do not re-ping):**
  - `~/.codex/config.toml` has **no** `model_catalog_json` **assignment** (comment-only mention). Default `model = "gpt-5.6-sol"`, `model_reasoning_effort = "ultra"`, `fast_mode = true`.
  - Token Plan opt-in profiles exist: `qwen38.config.toml` (`model=qwen3.8-max`, `model_provider=bailian-cli`), `ds-flash.config.toml` (`deepseek-v4-flash-0731`), `ds-pro.config.toml` (`deepseek-v4-pro-0813`). Each **layers** `model_catalog_json`.
  - Backups (names only): `config.toml.bak.pre-sub-switch`, `qwen38.config.toml.bak`, `ds-flash.config.toml.bak`, `ds-pro.config.toml.bak`. Rollback is the user’s recipe — **document, never execute**.
  - Live user smoke (cite, do not redo): default `env -u CODEX_BIN codex exec` → `SUB_SWITCH_OK` (session `~/.codex/sessions/2026/08/21/rollout-2026-08-21T18-13-21-01a0262b-d2b3-7f61-a4b5-96413487dfe5.jsonl`); `codex exec -p qwen38` → `QWEN_STILL_OK` (session `...T18-13-26-01a0262b-e52b-76e0-976b-37d9c1d3049f.jsonl`). Stock bash-stub `codex`, `CODEX_BIN` unset in those execs.
- **Ambient this pane:** `CODEX_BIN=/home/vgpnk/.local/bin/codex-titanium` (ELF). Stock `codex` = Bourne-Again stub. **Every** Token Plan / E2 / default-sub exec must `env -u CODEX_BIN`.
- **ACP surface in grok 1.0.5 binary:** client `initialize` → `session/new` (cwd) → `session/prompt` (user messages); agent `session/update` stream. Also `session/load` / `session/cancel`. Current oneshot never calls `session/new` or `session/prompt`.
- **PrimeAgent 0.7.4** on PATH (`basename prime-agent`). Session-1 M01 tick HIT `XBGST_PURE_INTERMODEL_L2_OK` with `--provider openai-codex --model gpt-5.4`.
- **Session-1 inner 4-phase** completed as **stub** (“is live DM the next slice?” → yes, README L99) — **not** product work. `verdict: inconclusive`. `cdx-connector-r1/r2/r3` HIT qwen3.8-max; **r4 timed out / MISS** (empty cwd, wandered `/tmp`, artifact stub `EXIT:0` without canary). Judge stopped relaunching; this sub-switch **is** that fix.
- **Mailbox vs live DM:** `gx-teams.sh dm` appends JSONL and prints `sent`. No ACP. DROP list already forbids `tmux send-keys` as the DM bus.
- **Canonical routing SSoT** remains marketplace `plugins/xbgst-stack/docs/model-routing.md` + `commands/references/xbreed-shared.md` (connector Grok-native; E2 stock cdx). **Do not edit.** Session connector override stays envelope-local.
- **No `docs/` dir, no AGENTS.md.** `.gitignore` is `*.tmp` + `.gx-teams/` — does **not** ignore `.xbgst/`.

### Missing
- gx-teams **documentation** of the Codex sub-switch (README still lists Token Plan as “routing probes” with canaries; default stock `codex exec` = ChatGPT sub is **not** written down).
- ACP **`session/new` + `session/prompt` live DM** on one spawned teammate, then kill.
- Transport from lead → in-pane `grok agent stdio` that is **not** `send-keys` (fifo/socket).
- PrimeAgent inner 4-phase **on the live-DM feature** (real file edits), with updated envelopes: default stock `codex` = sub; Token Plan only `-p qwen38|ds-flash|ds-pro`; always `env -u CODEX_BIN`; never titanium; never `/login`; **no canary inner task**.
- L1 `APPROVED` + `git push origin main` of unshipped tree + this work.

### Risk
- **R-acp-hang:** `session/prompt` runs a real Grok turn. Unknown whether it round-trips inside 30–60s. Gate: timeout → `Status: blocked E-acp` exit 2. Do not fall back to `send-keys`.
- **R-stdio-attach:** overfit requires a durable stdin to `grok agent stdio` inside a tmux pane (`cmd; exec sleep infinity` today). Fifo under `~/.gx-teams/<team>/acp/` is the established-pattern candidate; novel mux IPC is invention risk — flag and keep the surface one file (`scripts/acp-live-dm.py` + small spawn argv).
- **R-model-pin:** host default is `gpt-5.6-sol`. Envelopes should say stock `codex exec` **(no `-p`, no `-m`)** unless E2 luna. Do not bake sol into git if the account picker walks. Escalate E-model-pin.
- **R-commit-prior:** whether session-1 canary evidence ships with this work. Default below: **include** as historical; do not delete; do not re-run.
- **R-CODEX_BIN:** any forgotten unset is E-CODEX_BIN (ELF check). Ambient titanium still present.
- **R-qwen38-wander:** r4 spent the budget exploring empty cwd on a canary. Connector prompts this session must be **cross-axis analysis of the live-DM files**, with `</dev/null`, disposable `-C /tmp/xbgst-cdx-*`, wall 300s, two timeouts → `Status: blocked E-qwen38` (no Grok-swap).
- **R-auth-leak:** inner COMPILE must not emit `APPROVED:` / commit / push. L1 only.
- **R-SSoT:** connector-as-qwen38 is still a **session override**. Do not write marketplace `agents/connector.md`.
- **R-canary-relapse:** README/evidence/inner prompts must not grow new `XBGST_*_OK` ping loops or MUTATION SCORE theater.

---

## Data Walk (WWKD Phase 0)

Looked at the thing itself (not the spec’s description):

| Input | Found |
|---|---|
| git | `main` `a26eed4`; origin SSH; 7 untracked paths (`.xbgst/` + 6 evidence files) |
| `gx-teams.sh` | spawn/nuke/dm only; mode `cmd`; deny claude/TeamCreate; hardcap 16; identity env; JSONL O_APPEND; no ACP |
| `scripts/acp-oneshot.py` | `initialize` then `terminate`; no `session/new`, no `session/prompt` |
| `scripts/gate-m07.sh` | clap-reject `grok agent stdio --no-leader`; 30s oneshot; `GATE_M07_OK` |
| README L90–99 | M07 optional handshake; live DM named, not built |
| README L101–111 | routing **canary** table; no default=sub row |
| `~/.codex/config.toml` keys | default ChatGPT sub; **no** catalog assignment; `model=gpt-5.6-sol` |
| profile **filenames** | `qwen38` / `ds-flash` / `ds-pro` `.config.toml` exist; each has `model` + `model_provider` + `model_catalog_json` |
| user smokes | SUB_SWITCH_OK + QWEN_STILL_OK session jsonl **present**; gx-teams `evidence/` has **no** copy yet |
| grok binary strings | ACP sequence `session/new` → `session/prompt` → `session/update` documented in-binary |
| session-1 inner | stub 4-phase files exist; compile “no implementation”; M07 skipped E-write |
| `r4-connector.md` | stub `EXIT:0` after timeout/wander — do not treat as HIT |
| PrimeAgent | 0.7.4; prior envelope is a **canary** (`Reply with exactly XBGST_PURE_INTERMODEL_L2_OK`) — **do not reuse as inner task** |
| xbreed-shared | L1 Grok; optional OpenAI L2; connector Grok-native; Token Plan xask opt-in via `qwen38`; local-first ship after APPROVED |

Surprises: (1) user smoke files are Codex **session jsonl**, not gx-teams evidence — M01 must **cite** them, not re-exec. (2) r4 connector failed by wandering, not by auth — real-task prompts + `</dev/null` are the fix, not a lane swap. (3) ACP live DM is a **stdio client** problem, not a mailbox problem. (4) session-1 already answered the stub; repeating it is canary theater.

Spec/reality: skeleton is **document the switch + cheap filename/`--help` gate**. Overfit is **one teammate ACP round-trip**. Inner L2 is **product work on that feature**, not another ping.

---

## WWKD

1. **What:** Incorporate the host Codex sub-switch into gx-teams docs, then ship ACP `session/prompt` live DM on **one** teammate (initialize + `session/new` + `session/prompt` + kill), coordinated by a PrimeAgent L2 inner 4-phase on **that feature** with frontier delegates doing real analysis/edits. Success boundary: M01–M04 gates green; `gate-all.sh` still `GX-TEAMS-GATE-OK`; `gate-m07.sh` still `GATE_M07_OK`; mailbox JSONL remains log; marketplace/`~/.codex`/`~/.grok/skills` untouched; inner never `APPROVED`/push; L1 ships `main` after `APPROVED`.
2. **Why:** User fixed host Codex (catalog override gone; default = ChatGPT sub; Token Plan `-p` opt-in) and forbade canary theater. Session-1 proved inner 4-phase **files** on a stub and skipped live DM (E-write locked). README L99 still names the unshipped slice. Evidence: user SUB_SWITCH_OK / QWEN_STILL_OK sessions exist; acp-oneshot never prompts; r4 connector MISS.
3. **Assumptions/Risks:** openai-codex OAuth still live (no `/login`); qwen38/ds-* profiles remain; `/tmp/xbgst-bailian.env` still usable for Token Plan; grok ACP implements `session/new`+`session/prompt` as the binary docs say; fifo attach fits one Python file. Risks: R-acp-hang, R-stdio-attach, R-model-pin, R-commit-prior, R-CODEX_BIN, R-qwen38-wander, R-auth-leak, R-SSoT, R-canary-relapse.
4. **How:** M01 skeleton (docs + cite user smoke + filename/`--help` gate) → M02 overfit one teammate ACP round-trip → M03 inner PrimeAgent 4-phase **on that feature** (real edits, qwen38 connector analysis, stock-sub/ds-pro pondering, ds-flash clap/timeout probes that serve the feature) → M04 mailbox stays log while `dm` may **also** fire ACP → M_final L1 APPROVED + push. **No** mutate-the-delegation-table milestone.
5. **Escalation points:** table below. Judge names L1 axes after this plan. Silent one cycle → proceed with `[planner-gate: advisory, risks-open]` and the defaults.

### Escalation points (judge arbitration before dispatch)

| Id | Decision | Default if judge silent one cycle | Blocker if wrong |
|---|---|---|---|
| **E-auth** | Inner never Pareto-accepts, never `APPROVED:`, never commit/push. L1 only. | Inner COMPILE = evidence under `.xbgst/inner/live-dm/` + `evidence/`. | Inner ship of `main` or marketplace. |
| **E-write** | Product work on `gx-teams.sh` + `scripts/*` + README? | **YES** for those paths this activation (user-locked). Still no marketplace SSoT, no `~/.codex`, no `~/.grok/skills`. | First tick writing marketplace or `~/.codex`. |
| **E-cdx-connector** | Connector stays session override `cdx-connector-*` = `env -u CODEX_BIN codex exec -p qwen38`. | Keep override in envelopes only. Data-walk did **not** justify a lane swap (r1–r3 HIT; r4 failed by canary-wander). | Writing `agents/connector.md` or swapping to Grok connector on timeout. |
| **E-model-pin** | Pin `gpt-5.6-sol` in envelopes now that catalog is gone? | **Do not pin** in git. Say stock `codex exec` (no `-p`). Host happens to default sol. E2 still `-m gpt-5.6-luna`. | Committing account-picker churn as SSoT. |
| **E-commit-prior** | Commit session-1 `.xbgst/` + `evidence/pure-intermodel-*` with this work? | **YES, historical.** Do not delete, do not re-run canaries. | Committing secrets, `~/.codex`, or `.env`. |
| **E-budget** | Token/wall. User: generous Codex, especially sub models. | Connector 300s / two retries. ACP prompt 60s. Inner L2 tools on, thinking medium, `autonomous-max-tokens` 500000, wall 45 min **if** used as bounded worker — **not** a scheduler. No `--autonomous-as-scheduler`. | Uncapped autonomous loop. |
| **E-provider** | L2 root stays `prime-agent --provider openai-codex --model gpt-5.4`. | Do not copy host `launch-l2-openai.sh --provider openai`. No `/login`. | titanium, xAI wrapper, or `/login`. |
| **E-axes** | Judge names L1 axes **after** this plan. | Specialists wait one cycle, then execute milestones (not axes). | Specialists inventing L1 axes from this plan. |
| **E-acp** | If `session/prompt` hangs past 60s. | `Status: blocked E-acp` exit 2; keep initialize oneshot green; do not `send-keys`. | Declaring live DM shipped on handshake-only. |

---

## Session-local inner routing (NOT marketplace SSoT)

Copy into every **new** live-DM envelope. Do not mutate session-1 `delegation.md` as a gate. Do not write marketplace routing.

| Inner role | Spawn name | Lane | Effort | Work product |
|---|---|---|---|---|
| L2 root | `prime-l2-live-dm` (not `gx-…`) | `prime-agent --provider openai-codex --model gpt-5.4` tools **on**, thinking medium | medium–high | Coordinates inner 4-phase on ACP live DM. Evidence only. |
| the-planner | inner planner via L2 tools | stock `env -u CODEX_BIN codex exec` (**no `-p`**) **or** `codex exec -p ds-pro` | medium–high | WWKD notes for the live-DM files. |
| connector | **`cdx-connector-rN`** | `env -u CODEX_BIN timeout 300s codex exec -p qwen38 --skip-git-repo-check --ephemeral -C /tmp/xbgst-cdx-* -s read-only </dev/null` | default | **Always this session.** Real cross-axis analysis of `acp-oneshot.py` / fifo / `dm`. Never Grok spawn. Never titanium. Never “reply CANARY”. |
| critic / reviewer / sentinel | `cdx-{role}-rN` | stock `codex exec` (no `-p`) **or** `-p ds-pro` **or** openai-codex | medium–high | Review the live-DM patch. |
| executor / labrat / scribe | `cdx-{role}-rN` | `codex exec -p ds-flash` **or** L2 tools | low | Clap/timeout/fifo probes **that serve the feature**. |
| scout | `cdx-scout-rN` | `-p qwen38` | low–medium | Breadth on ACP method names / hang modes. |
| the-revenger | `cdx-revenger-*` | stock `codex exec -m gpt-5.6-luna` | E2 freeze | Only if live-DM hang needs observe-map-reproduce. Not default connector. |
| daybreak | — | lab only | — | Do not use. |

Hard bans (every inner prompt): `general-purpose`, `explore`, `codex-titanium`, `/login`, host `pi`, sekhmet/L3, claiming `APPROVED`/ship, `Reply with exactly <CANARY>`, MUTATION SCORE theater, new `XBGST_*_OK` ping loops.

Child fan-out: **shell-only** stock `codex` with `env -u CODEX_BIN`.

---

## Required L2 envelope (M03+; fill per milestone)

```yaml
route_id: frontier-real-inner-2026-08-21
parent: gx-executor-live-dm
task: <milestone one-liner — ACP live DM product work, never a canary>
scope: |
  read: /home/vgpnk/Projects/xbgst/gx-teams
  write: gx-teams.sh, scripts/*, README.md, evidence/*, .xbgst/inner/live-dm/, .xbgst/envelopes/, .xbgst/gates/
  cwd-first-ticks: /tmp/xbgst-prime-*
  forbid: grok-marketplace/plugins, ~/.grok/skills, ~/.codex, sekhmet-l3, git commit, git push
allowed_actions: |
  prime-agent openai-codex gpt-5.4 tools on
  shell stock codex with env -u CODEX_BIN
  default (no -p) = ChatGPT sub
  Token Plan only via -p qwen38|ds-flash|ds-pro
  child fan-out: shell-only stock codex
  never titanium, never /login, never send-keys as DM bus
return: evidence markdown + inner 4-phase files; no decisions
stop: |
  milestone gate OK OR Status: blocked <reason>
  abort on titanium, /login, banned types, marketplace writes, inner APPROVED, canary inner-task
```

Boundary append (keep sense):

`L2-loop only. L1 xbgst is the sole scheduler, Pareto judge, APPROVED authority, integrator, and shipper. Follow the supplied route envelope. Return evidence, not decisions. No child fan-out unless allowed. Never act as xbrd-selector or sekhmet. Never spawn general-purpose or explore. Never invoke codex-titanium. Default stock codex exec (no -p) is the ChatGPT sub. Token Plan is opt-in -p only. Always env -u CODEX_BIN.`

---

## Milestones

| # | Title | Gate command | Expected output | Executor |
|---|---|---|---|---|
| M01 | Skeleton: document Codex sub-switch; cite user smoke; cheap `--help`/filename check | `bash .xbgst/gates/gate-frontier-m01.sh` | `GATE_FRONTIER_M01_OK` | gx-scribe-subswitch |
| M02 | Overfit one teammate: ACP initialize + `session/new` + `session/prompt` + kill | `bash scripts/gate-m07.sh && bash .xbgst/gates/gate-frontier-m02.sh` | `GATE_M07_OK` and `GATE_FRONTIER_M02_OK` | gx-executor-acp-dm **plus mandatory** cdx-connector-r1 (real analysis, not canary) |
| M03 | Inner PrimeAgent 4-phase on the live-DM feature (real edits) | `bash .xbgst/gates/gate-frontier-m03.sh` | `GATE_FRONTIER_M03_OK`; live-dm inner files; no `^APPROVED:` | gx-executor-inner-4ph / `prime-l2-live-dm` **plus** cdx-connector-rN |
| M04 | Mailbox JSONL stays log; `dm` may also fire ACP | `bash scripts/gate-m04.sh && bash .xbgst/gates/gate-frontier-m04.sh && bash scripts/gate-all.sh` | `GATE_M04_OK`; `GATE_FRONTIER_M04_OK`; `GX-TEAMS-GATE-OK` | gx-executor-dm-path |
| M_final | L1 polish + APPROVED push `origin main` | see M_final gate | `GX-TEAMS-GATE-OK`; marketplace diff empty; no secrets; push only after `APPROVED:` | L1 xbgst (not inner) |

**There is no M05 mutate-delegation milestone.** Clap-order and hang-cap probes live **inside M02/M04 gates** and as ds-flash **feature** children under M03.

### M01 — Skeleton (end-to-end, toy, real)

**Does:** Write gx-teams-visible documentation of the host sub-switch. Cite the **user’s already-run** SUB_SWITCH_OK / QWEN_STILL_OK sessions. Cheap structural checks only — **no model completion**.

**Touches:**
- `evidence/codex-sub-switch.md` (new)
- `README.md` routing section (rewrite canary table → default=sub + `-p` opt-in; keep historical canary evidence links as history, do not add new pings)
- `.xbgst/gates/gate-frontier-m01.sh` (new)

**Out-of-scope:** editing `~/.codex`; rollback; PrimeAgent tick; ACP; committing.

**Rollback recipe to document (do not execute):**

```
cp ~/.codex/config.toml.bak.pre-sub-switch ~/.codex/config.toml
cp ~/.codex/qwen38.config.toml.bak ~/.codex/qwen38.config.toml
cp ~/.codex/ds-flash.config.toml.bak ~/.codex/ds-flash.config.toml
cp ~/.codex/ds-pro.config.toml.bak ~/.codex/ds-pro.config.toml
```

**Cite (do not re-exec):**
- SUB_SWITCH_OK — `~/.codex/sessions/2026/08/21/rollout-2026-08-21T18-13-21-01a0262b-d2b3-7f61-a4b5-96413487dfe5.jsonl`
- QWEN_STILL_OK — `~/.codex/sessions/2026/08/21/rollout-2026-08-21T18-13-26-01a0262b-e52b-76e0-976b-37d9c1d3049f.jsonl`

**Gate (`gate-frontier-m01.sh` contract):**

```bash
set -euo pipefail
ROOT=/home/vgpnk/Projects/xbgst/gx-teams
test -s "$ROOT/evidence/codex-sub-switch.md"
grep -q SUB_SWITCH_OK "$ROOT/evidence/codex-sub-switch.md"
grep -q QWEN_STILL_OK "$ROOT/evidence/codex-sub-switch.md"
grep -q 'config.toml.bak.pre-sub-switch' "$ROOT/evidence/codex-sub-switch.md"
grep -q -- '-p qwen38' "$ROOT/README.md"
grep -qE 'ChatGPT sub|subscription' "$ROOT/README.md"
grep -q 'ds-flash' "$ROOT/README.md"
grep -q 'ds-pro' "$ROOT/README.md"
grep -q 'env -u CODEX_BIN' "$ROOT/README.md"
# host facts (filenames + keys only; no secrets; no completion)
test -f "$HOME/.codex/qwen38.config.toml"
test -f "$HOME/.codex/ds-flash.config.toml"
test -f "$HOME/.codex/ds-pro.config.toml"
! grep -q '^model_catalog_json' "$HOME/.codex/config.toml"
# cheap --help (NOT a prompt)
env -u CODEX_BIN timeout 15s "$(CODEX_BIN= command -v codex)" exec --help | grep -q -- '--profile'
file "$(CODEX_BIN= command -v codex)" | grep -qi 'ELF 64' && { echo blocked E-CODEX_BIN; exit 2; }
# no secrets in what we write
! grep -qiE 'sk-|api_key=|op://|BAILIAN_TOKEN_PLAN_API_KEY=' "$ROOT/evidence/codex-sub-switch.md" "$ROOT/README.md"
echo GATE_FRONTIER_M01_OK
```

**Expected:** `GATE_FRONTIER_M01_OK`. Evidence file states default stock `codex exec` = ChatGPT sub; Token Plan = `-p qwen38|ds-flash|ds-pro`; always `env -u CODEX_BIN`; titanium = sekhmet L3; host `~/.codex` is **not** a git path.

### M02 — Overfit one real instance

**Does:** Solve **exactly one** live DM: one gx-teams teammate, one ACP client, bit-for-bit `initialize` → `session/new` → `session/prompt` → kill. Prompt is a **real teammate instruction** (quote the four Godspeed rules already written at spawn under `~/.gx-teams/<team>/godspeed/<name>.txt`). **Not** `Reply with exactly CANARY`.

**Single instance:** team `acp`, name `gx-labrat-acp`. Spawn via `./gx-teams.sh` (not on PATH). Transport: named fifo(s) under `~/.gx-teams/acp/acp/` (or equivalent recorded in evidence) — **never** `tmux send-keys`. Flags still **before** `stdio`. `GROK_SUBAGENTS=0 --no-leader --always-approve`.

**Reference:** existing `scripts/acp-oneshot.py` (extend or add `scripts/acp-live-dm.py`); grok 1.0.5 ACP sequence; DROP list (no send-keys). Invention risk: fifo attach — keep it one Python file.

**Mandatory connector (real work):** `cdx-connector-r1` reads `acp-oneshot.py` + spawn wrapper and returns a short State/Dissent/PROPOSE on hang modes, clap order, and why fifo ≠ mailbox. No canary token required. Wall 300s, `</dev/null`, `env -u CODEX_BIN`, `-p qwen38`.

**Gate (`gate-frontier-m02.sh` contract):**

```bash
set -euo pipefail
ROOT=/home/vgpnk/Projects/xbgst/gx-teams
cd "$ROOT"
bash scripts/gate-m07.sh   # still GATE_M07_OK
# clap-reject remains
if grok agent stdio --no-leader </dev/null >/dev/null 2>&1; then echo FAIL clap; exit 1; fi

GT="$ROOT/gx-teams.sh"
"$GT" nuke --team acp >/dev/null 2>&1 || true
before0=$(tmux list-panes -s -t '=0' -F '#{pane_id}:#{pane_pid}' | sort)
before1=$(tmux list-panes -s -t '=1' -F '#{pane_id}:#{pane_pid}' | sort)

# executor-defined spawn + client; gate asserts artifacts:
test -s "$ROOT/evidence/acp-live-dm-m02.md"
grep -q 'protocolVersion' "$ROOT/evidence/acp-live-dm-m02.md"
grep -qE 'session/new|sessionId' "$ROOT/evidence/acp-live-dm-m02.md"
grep -q 'session/prompt' "$ROOT/evidence/acp-live-dm-m02.md"
grep -qE 'Name the axes|godspeed' "$ROOT/evidence/acp-live-dm-m02.md"
! grep -qi 'send-keys' "$ROOT/scripts/acp-live-dm.py" "$ROOT/gx-teams.sh"
! grep -qiE 'codex-titanium|^APPROVED:' "$ROOT/evidence/acp-live-dm-m02.md"

# hang → blocked
# the live client itself must have used timeout 60s; evidence records elapsed_s < 60 or Status: blocked E-acp
grep -qE 'elapsed_s:|Status: blocked E-acp' "$ROOT/evidence/acp-live-dm-m02.md"

"$GT" nuke --team acp
after0=$(tmux list-panes -s -t '=0' -F '#{pane_id}:#{pane_pid}' | sort)
after1=$(tmux list-panes -s -t '=1' -F '#{pane_id}:#{pane_pid}' | sort)
[[ "$before0" == "$after0" && "$before1" == "$after1" ]]

# connector analysis present (real, not canary)
test -s "$ROOT/.xbgst/inner/live-dm/r1-connector.md"
grep -q cdx-connector "$ROOT/.xbgst/inner/live-dm/r1-connector.md"
grep -qE 'session/prompt|fifo|hang' "$ROOT/.xbgst/inner/live-dm/r1-connector.md"

echo GATE_FRONTIER_M02_OK
```

**Expected:** `GATE_M07_OK` then `GATE_FRONTIER_M02_OK`. If hang: `Status: blocked E-acp` (exit 2) — valid experiment outcome; do not fake a round-trip.

**Out-of-scope:** multi-teammate broadcast; making M07 a `gate-all` blocker; marketplace M08; inner 4-phase files beyond connector note.

### M03 — Generalize (a): inner 4-phase ON THE FEATURE

**Does:** Widen **coordination + implementation quality** on the **same** live-DM instance. PrimeAgent L2 (`openai-codex gpt-5.4`, tools on, disposable `/tmp/xbgst-prime-*` cwd for first tick, writes under envelope scope) runs inner PROPOSE (with live qwen38 connector analysis), CROSS-CRITIQUE, inner-pareto, COMPILE. Real file edits via L2 tools: harden fifo, timeouts, clap, evidence. Inner Pareto is **advisory** (`inner-pareto`).

**Do not reuse** session-1 canary envelopes (`envelopes/m01.yaml` task is a ping). Write new `.xbgst/envelopes/live-dm.yaml` + `.xbgst/inner/live-dm/{r0-plan,r1-propose,r1-critique,r1-pareto,r1-compile,rN-connector}.md`. Leave session-1 `inner/r1-*` as V-baseline.

**Sensible real delegations (must serve the feature):**
- qwen38 connector: cross-axis review of ACP client vs mailbox vs send-keys ban
- stock `codex exec` (no `-p`) and/or `-p ds-pro`: pondering review of the patch
- `-p ds-flash`: cheap parallel probes of clap order + 60s hang cap **on the live client**, not “are you alive?”

**Gate:**

```bash
set -euo pipefail
I=/home/vgpnk/Projects/xbgst/gx-teams/.xbgst/inner/live-dm
for f in r0-plan.md r1-propose.md r1-critique.md r1-pareto.md r1-compile.md r1-connector.md; do
  test -s "$I/$f"
done
grep -q WWKD "$I/r0-plan.md"
grep -q PROPOSE "$I/r1-propose.md"
grep -q cdx-connector "$I/r1-propose.md"
grep -q inner-pareto "$I/r1-pareto.md"
grep -q COMPILE "$I/r1-compile.md"
! grep -q '^APPROVED:' "$I/r1-compile.md"
! grep -qiE 'Reply with exactly|MUTATION SCORE' "$I"/r1-*.md
# product files exist (from M02 and any M03 edits)
test -f /home/vgpnk/Projects/xbgst/gx-teams/scripts/acp-live-dm.py
git -C /home/vgpnk/Projects/xbgst/grok-marketplace diff --exit-code -- plugins/xbgst-stack
echo GATE_FRONTIER_M03_OK
```

**Expected:** `GATE_FRONTIER_M03_OK`. Compile file: `evidence-only; L1 retains APPROVED`.

**Out-of-scope:** git commit; marketplace; `--autonomous` as scheduler; new canaries.

### M04 — Generalize (b): mailbox stays log; live path is ACP

**Does:** Widen **one axis**: pairing. `dm` still O_APPEND JSONL and still fails if `inboxes/` missing. If the teammate has an ACP fifo (the M02 instance), `dm` **also** sends `session/prompt` with the same text. JSONL is corroborating log, not transport. Wrong clap order still rejects. Hang still `E-acp`. Operators `0`/`1` frozen. `gate-all.sh` still green and still **does not** require M07.

**Gate:**

```bash
set -euo pipefail
ROOT=/home/vgpnk/Projects/xbgst/gx-teams
bash "$ROOT/scripts/gate-m04.sh"    # GATE_M04_OK
# live pairing evidence
test -s "$ROOT/evidence/acp-live-dm-m04.md"
grep -q '"type":"dm"' "$ROOT/evidence/acp-live-dm-m04.md"
grep -q 'session/prompt' "$ROOT/evidence/acp-live-dm-m04.md"
grep -q 'log only\|JSONL' "$ROOT/README.md"
# README still says mailbox is the log
grep -q 'mailbox JSONL is the log only' "$ROOT/README.md" || grep -q 'JSONL' "$ROOT/README.md"
bash "$ROOT/scripts/gate-all.sh"    # GX-TEAMS-GATE-OK
echo GATE_FRONTIER_M04_OK
```

**Expected:** `GATE_M04_OK`, `GX-TEAMS-GATE-OK`, `GATE_FRONTIER_M04_OK`.

**Out-of-scope:** replacing JSONL with ACP; TeamCreate; M08 install.

### M_final — Polish (L1 only)

**Does:** After L1 `APPROVED:` — commit (HEREDOC) and `git push origin main` (SSH). Include session-1 historical evidence iff E-commit-prior default holds. README live-DM section updated (handshake still optional; live DM gated separately; sub-switch documented). No framework. No `~/.codex` in the tree.

**Gate:**

```bash
set -euo pipefail
ROOT=/home/vgpnk/Projects/xbgst/gx-teams
bash "$ROOT/scripts/gate-all.sh"
test -f "$ROOT/evidence/codex-sub-switch.md"
test -f "$ROOT/evidence/acp-live-dm-m02.md"
git -C /home/vgpnk/Projects/xbgst/grok-marketplace diff --exit-code -- plugins/xbgst-stack
# no secrets
! grep -RniE 'sk-|api_key=|op://' "$ROOT/evidence" "$ROOT/README.md" "$ROOT/.xbgst/plans" || true
# inner never shipped
! grep -R '^APPROVED:' "$ROOT/.xbgst/inner" >/dev/null
# push is L1-only; this gate does not git push
echo GATE_FRONTIER_FINAL_OK
```

**Ship rule (xbreed-shared local-first):** on main → gates green → `APPROVED: <reason>` → commit HEREDOC → `git push -u origin main`.

---

## Dependencies

```
M01 → M02 → M03
M02 → M04
M03 + M04 → M_final (L1 APPROVED)
```

M01 is the skeleton; none of M02–M_final start if M01 docs/gate missing (downstream must know default=sub / `-p` opt-in). M02 is the overfit; M03 assumes one ACP round-trip exists. M04 must not start if M02 is `blocked E-acp` unless L1 explicitly accepts handshake-only + design note.

No M05. Parallel after M02: M03 (inner 4-phase + edits) owns scripts/README live-DM; M04 waits for those edits then proves mailbox invariant + pairing. If M03 and M04 would race `gx-teams.sh dm`, **serialize M04 after M03**.

---

## Executor handoff notes (cold start)

- **Language:** bash + Python + markdown. Match gx-teams. No Rust lock. Harness is `./gx-teams.sh` (not on PATH).
- **Spawn method (L1 side):** named `gx-*` only, or gx-teams panes. Never `general-purpose` / `explore`.
- **Connector this session:** always outbound stock Codex, name `cdx-connector-rN`, profile `qwen38`, real analysis. Not Grok spawn. Not a parrot.
- **Default Codex:** `env -u CODEX_BIN timeout … codex exec` with **no** `-p` = ChatGPT sub. Token Plan only `-p qwen38|ds-flash|ds-pro`. E2 luna only with `-m gpt-5.6-luna`.
- **PrimeAgent cwd:** `/tmp/xbgst-prime-*` first ticks; product writes only under envelope `scope`. Telemetry: `PRIME_AGENT_TELEMETRY=0` `DO_NOT_TRACK=1` `PI_SKIP_VERSION_CHECK=1`.
- **Codex stdin:** always `</dev/null` on `codex exec` (session-1 lesson).
- **On gate fail:** `Status: blocked <reason>` + recovery (rerun once, then escalate). Do not invent a lane. Do not `send-keys`. Do not `/login`.
- **Do not commit** unless L1 emits `APPROVED:`.
- **Do not edit** `~/.codex`, `~/.grok/skills`, marketplace plugin.

Godspeed: L1 names axes, iterate cheap in parallel, keep moves that improve any axis and harm none, don’t aim.

---

## What this plan is not

- Not a redo of session-1 canaries or MUTATION SCORE.
- Not a rewrite of Grok-native connector SSoT.
- Not a promotion of PrimeAgent to L1.
- Not an L3 sekhmet campaign or Daybreak default.
- Not a `/login`, credential copy, or `~/.codex` commit.
- Not M08 marketplace hook.
- Not a commit until L1 `APPROVED:`.

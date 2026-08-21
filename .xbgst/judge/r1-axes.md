# L1 axes — pure-intermodel experiment
**Session:** 1 | **Judge:** xbgst | **Date:** 2026-08-21
**Plan:** `.xbgst/plans/2026-08-21-pure-intermodel-l2.md`

## Escalation lock (this activation)

| Id | Judge call |
|---|---|
| E-auth | ACCEPT. Inner never Pareto-accepts, never `APPROVED:`, never commit/push. L1 only. |
| E-cdx-connector | ACCEPT session override. Connector is always `cdx-connector-*` via `env -u CODEX_BIN codex exec -p qwen38` (model qwen3.8-max). Do not edit marketplace SSoT. |
| E-write | ACCEPT evidence-only through M06. M07 source waits for a later L1 yes. First ticks `/tmp/xbgst-prime-*`. gx-teams writes only `.xbgst/` + `evidence/`. |
| E-budget | RAISE vs planner default. User asked for more tokens, especially Codex. M01 stays 120s `--no-tools`. Connector wall 300s. Inner 4-phase: `--thinking medium` root, pondering children high, `--autonomous-max-tokens 500000`, wall 45 min. Still abort on envelope `stop`. `--autonomous` is not an xbgst scheduler. |
| E-provider | ACCEPT `--provider openai-codex`. Do not copy host `launch-l2-openai.sh`. No `/login`. |
| E-axes | Named below. |

## Axes

| Id | Direction | Observable |
|---|---|---|
| I isolation | L2 in `/tmp/xbgst-prime-*`; never titanium; never xbgst `main` | cwd glob + `env -u CODEX_BIN` + basename `prime-agent` |
| P proof | cheapest live openai-codex tick + full envelope | `XBGST_PURE_INTERMODEL_L2_OK` in `evidence/pure-intermodel-m01.md` |
| C connector | every inner PROPOSE uses live `cdx-connector-rN` qwen3.8-max | `rN-connector.md` + `XBGST_CDX_CONNECTOR_RN_OK` + banner `model: qwen3.8-max` |
| X xbreed-fidelity | inner 4-phase (plan, propose+connector, critique, pareto, compile); no inner ship | `.xbgst/inner/rN-*.md`; compile has no `^APPROVED:` |
| D delegation | pondering → capable/medium-high; speed → cheap/fast; mutate the table | `.xbgst/inner/delegation.md` + `MUTATION SCORE:` |
| K no-wrap | no claude, TeamCreate, general-purpose, explore, sekhmet, inner ship | greps of prompts + marketplace diff empty |
| E evidence | gates print `GATE_INTERMODEL_M0N_OK` | gate stdout + evidence files |
| V compare | pure-intermodel vs guided-teams on the same stub | `evidence/pure-vs-guided.md` verdict |

Round 1 target: improve **P**, **I**, **E** without harming **K**. Connector this round is L1 PROPOSE (C), not inner yet.

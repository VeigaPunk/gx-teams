# L1 axes — frontier real inner
**Session:** 2 | **Judge:** xbgst | **Date:** 2026-08-21
**Plan:** `.xbgst/plans/2026-08-21-frontier-real-inner.md`

## Escalation lock

| Id | Call |
|---|---|
| E-auth | ACCEPT. Inner never `APPROVED:` / commit / push. |
| E-write | ACCEPT YES for `gx-teams.sh`, `scripts/*`, README. No marketplace, no `~/.codex`, no `~/.grok/skills`. |
| E-cdx-connector | ACCEPT. Always `cdx-connector-*` = `env -u CODEX_BIN codex exec -p qwen38`. Real analysis. No Grok-swap. |
| E-model-pin | ACCEPT. Do not pin `gpt-5.6-sol` in git. Stock `codex exec` (no `-p`) = ChatGPT sub. |
| E-commit-prior | ACCEPT. Ship session-1 `.xbgst/` + `evidence/pure-intermodel-*` as history. Do not re-run canaries. |
| E-budget | ACCEPT. Connector 300s / two retries. ACP prompt 60s. Inner tools on, thinking medium, no autonomous-as-scheduler. |
| E-provider | ACCEPT. `prime-agent --provider openai-codex --model gpt-5.4`. No `/login`. |
| E-acp | ACCEPT. Hang → `Status: blocked E-acp`. Never `send-keys`. |

## Axes

| Id | Direction | Observable |
|---|---|---|
| D docs | README + evidence record default=ChatGPT sub, Token Plan `-p` opt-in | `GATE_FRONTIER_M01_OK` |
| L live-DM | one teammate initialize + session/new + session/prompt + kill | `GATE_FRONTIER_M02_OK` or blocked E-acp |
| C connector | every PROPOSE is live qwen38 analysis of the live-DM files | `.xbgst/inner/live-dm/rN-connector.md` |
| X inner-4ph | PrimeAgent 4-phase on the feature, real edits | `.xbgst/inner/live-dm/` + no `^APPROVED:` |
| K no-wrap | no claude, send-keys, titanium, ~/.codex git, marketplace SSoT | greps + marketplace diff empty |
| I isolation | `env -u CODEX_BIN`; mailbox JSONL stays log | ELF check; `GATE_M04_OK` |
| E evidence | `GATE_FRONTIER_M0N_OK`; no new canary loops | gate stdout |
| P product | `gate-all.sh` still `GX-TEAMS-GATE-OK` after live DM | harness smoke |

Round 1 target: improve **D** and **C** without harming **K**/**P**. No canary completions.

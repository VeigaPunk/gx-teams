# Session-local inner routing — NOT marketplace SSoT
**Date:** 2026-08-21
**Status:** experiment table only. Do not copy into `docs/model-routing.md` or `agents/connector.md`.

This table is the inner role → lane map for the pure-intermodel L2 run. Marketplace SSoT remains Grok-native connector + Exception E2 revenger.

| Inner role | Spawn name | Lane | Effort | Why |
|---|---|---|---|---|
| L2 root | prime-l2-intermodel | `prime-agent --provider openai-codex --model gpt-5.4` | medium–high | Coordinator. Evidence only. Not L1. |
| the-planner | inner planner | openai-codex gpt-5.4 **or** `codex exec -p ds-pro` (`deepseek-v4-pro-0813`) | medium–high | Pondering. Round 0 WWKD. |
| connector | **cdx-connector-rN** | `env -u CODEX_BIN timeout 300s codex exec -p qwen38` (`qwen3.8-max`) | default | **Always this session.** Never Grok `spawn_subagent`. Never titanium. |
| critic, reviewer, sentinel, mutation-tester | cdx-{role}-rN | openai-codex gpt-5.4 / `ds-pro` (`deepseek-v4-pro-0813`) | medium–high | Pondering roles. |
| distiller, scribe, executor, labrat | cdx-{role}-rN | `codex exec -p ds-flash` (`deepseek-v4-flash-0731`) | low | Speed / concurrency. |
| scout | cdx-scout-rN | `codex exec -p qwen38` | low–medium | Breadth cheap. |
| the-revenger | cdx-revenger-* | stock `codex exec -m gpt-5.6-luna` | E2 freeze | Not Token Plan. Not titanium. |
| daybreak | — | `gpt-daybreak-blue-latest` lab only | — | Do not use as inner default. |

## Probed spawn examples (reuse live canaries)

| Lane | Probe | Canary | Evidence |
|---|---|---|---|
| qwen3.8-max | `env -u CODEX_BIN codex exec -p qwen38` | XBGST_QWEN38_OK / XBGST_CDX_CONNECTOR_R1_OK | `evidence/qwen38-cli.md`, `.xbgst/inner/r1-connector.md`, `/tmp/xbgst-prime-conn-m02/err.txt` |
| deepseek-v4-flash-0731 | `env -u CODEX_BIN codex exec -p ds-flash` | XBGST_DSFLASH0731_OK | `evidence/ds-flash-cli.md` |
| deepseek-v4-pro-0813 | `env -u CODEX_BIN codex exec -p ds-pro` | XBGST_DSPRO0813_OK | `evidence/ds-pro-cli.md` |
| gpt-5.6-luna E2 | `env -u CODEX_BIN codex exec -m gpt-5.6-luna` | XBGST_CDX_REVENGER_OK | `evidence/cdx-revenger.md` |
| openai-codex gpt-5.4 | `prime-agent --provider openai-codex --model gpt-5.4` | XBGST_PURE_INTERMODEL_L2_OK | `evidence/pure-intermodel-m01.md` |

## Invariants (mutation targets)

1. Connector is always `cdx-connector` / `qwen3.8-max` / `codex exec -p qwen38`. Never Grok spawn.
2. Every Token Plan / E2 exec uses `env -u CODEX_BIN`. Ambient titanium must not leak.
3. Inner never emits `APPROVED:` or `git push`.
4. Banned types: `general-purpose`, `explore`.
5. Titanium / sekhmet / `/login` / host `pi` forbidden on this plane.

## NOT marketplace SSoT

Do not edit `plugins/xbgst-stack/docs/model-routing.md`, `agents/connector.md`, or `commands/references/xbreed-shared.md` to match this table.

# Report — pure-intermodel L2 experiment
**Session:** 1 | **Judge:** xbgst | **Date:** 2026-08-21
**Plan:** `.xbgst/plans/2026-08-21-pure-intermodel-l2.md`

## Question

Is a PrimeAgent-coordinated, model-agnostic inner xbgst (connector always `codex exec -p qwen38` / qwen3.8-max) better than Grok-guided `gx-*` teams?

## What ran

| Milestone | Gate | Result |
|---|---|---|
| M01 L2 tick openai-codex gpt-5.4 | GATE_INTERMODEL_M01_OK | `XBGST_PURE_INTERMODEL_L2_OK` cwd `/tmp/xbgst-prime-KrED` |
| M02 inner r0+r1 + live inner connector | GATE_INTERMODEL_M02_OK | PA exec'd qwen38; 23436 / 400000 tokens, 113s |
| M03 inner 4-phase | GATE_INTERMODEL_M03_OK | critique / inner-pareto / COMPILE; no `^APPROVED:` |
| M04 session-local delegation table | GATE_INTERMODEL_M04_OK | qwen3.8-max, ds-flash, ds-pro, luna, openai-codex; NOT marketplace SSoT |
| M05 mutate delegations | GATE_INTERMODEL_M05_OK | MUTATION SCORE: 4/4 (100%) |
| M06 compare | GATE_INTERMODEL_M06_OK | verdict: inconclusive (pure-intermodel nested under L1) |
| M07 ACP `session/prompt` | skipped | E-write not unlocked; oneshot handshake remains |

L1 connectors: `cdx-connector-r1/r2/r3` all HIT on `model: qwen3.8-max` / `provider: bailian-cli` with `env -u CODEX_BIN`.

## Routing used (session-local)

- Connector: always stock `codex exec -p qwen38` (qwen3.8-max). Never Grok connector. Never titanium.
- Coordinator: `prime-agent --provider openai-codex --model gpt-5.4` thinking medium, tools on, **no `--autonomous`**.
- Pondering: gpt-5.4 / ds-pro (table). Speed: ds-flash (table). E2 revenger: gpt-5.6-luna (probed earlier, not respawned).
- Child fan-out: shell-only Codex. Inner never shipped.

## Verdict (not a ship of doctrine)

`verdict: inconclusive`. Pure-intermodel proved: L2 tick, inner live qwen38 exec, inner 4-phase files, delegation mutants all killed. Guided-teams still produced the deeper critic/distiller and remained the actual Pareto/APPROVED authority. Nesting PA under L1 confounds “who coordinated.”

Marketplace plugin diff empty. gx-teams.sh / scripts / README untouched. M07 live DM not implemented.

## Canaries

- `XBGST_PURE_INTERMODEL_L2_OK`
- `XBGST_CDX_CONNECTOR_R1_OK` (L1 and inner)
- `XBGST_CDX_CONNECTOR_R2_OK`
- `XBGST_CDX_CONNECTOR_R3_OK`
- `GATE_INTERMODEL_M01_OK` … `M05_OK`

# Round 1 COMPILE
**Judge:** xbgst L1 | **Date:** 2026-08-21
**Not APPROVED** — experiment incomplete (X/D/V still 0).

## What landed
- Plan: `.xbgst/plans/2026-08-21-pure-intermodel-l2.md`
- Axes + escalation lock: `.xbgst/judge/r1-axes.md`
- M01: `evidence/pure-intermodel-m01.md` GATE_INTERMODEL_M01_OK
- Connector: `.xbgst/inner/r1-connector.md` live qwen3.8-max, V baseline
- Critic: `.xbgst/inner/r1-critic.md`
- Distiller: `.xbgst/inner/r1-distill.md` SYNTHESIS_READY

## Round 2 dispatch (immediate)
- parent route owner: gx-executor-inner-r01 (launch script, does not write inner files)
- PrimeAgent openai-codex gpt-5.4 thinking medium, tools on, no --autonomous
- child fan-out: shell-only stock `codex exec` `env -u CODEX_BIN`
- mandatory L1 PROPOSE connector: cdx-connector-r2 (short prompt)
- inner must write r0-plan, r1-propose, r1-inner-connector, evidence/pure-intermodel-m02.md

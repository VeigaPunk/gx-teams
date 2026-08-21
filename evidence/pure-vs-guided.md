# Pure-intermodel vs guided-teams — same stub
**Modes:** pure-intermodel | guided-teams
**Date:** 2026-08-21
**Stub:** Is ACP `session/prompt` live DM the next unshipped gx-teams slice? Mailbox JSONL is the log only. Do not implement.

| Axis | Guided-teams (L1 `gx-*`) | Pure-intermodel (PrimeAgent openai-codex + cdx-connector qwen3.8-max) |
|---|---|---|
| P proof | `gx-labrat-l2tick` launched M01; GATE_INTERMODEL_M01_OK | same tick *is* the L2 proof; gpt-5.4 0.7.4 |
| C connector | L1 `cdx-connector-r1/r2/r3` live `codex exec -p qwen38` | PrimeAgent itself exec'd `cdx-connector-r1-inner` (transcript `/tmp/xbgst-prime-conn-m02/err.txt`, banner `model: qwen3.8-max`) |
| X xbreed-fidelity | planner + critic ACH + distiller SYNTHESIS_READY + L1 Pareto | inner r0-plan, r1-propose, r1-critique, inner-pareto, COMPILE; structurally complete, shallower than L1 critic |
| D delegation | Grok pins + this session override | session-local table; M05 4/4 mutants KILLED |
| K no-wrap | marketplace diff empty; no inner `APPROVED:` | same; envelopes forbid ship |
| E evidence | gates M01–M05 | inner files + live exec transcript |
| Cost | critic 256s Grok; distiller 69s; labrat 113s | PA M02 113s / 23436 tokens; PA M03 43s / 22966 tokens; qwen38 connectors 66–275s |
| gx-connector | used as control for critic/distiller/labrat only | never used as inner connector |

## Same-stub answer (both arms)

Yes. README: “Live DMs still need ACP `session/prompt` — mailbox JSONL is the log only.” M07 initialize-oneshot is not live DM.

## Confound (named)

Guided-teams *is* this L1 activation. Pure-intermodel ran *nested under* it. V cannot claim independent coordinators. H1 (PA coordinates 4-phase *better*) is only weakly tested: PA wrote the inner files and live-exec'd qwen38, but L1 still scheduled routes, named axes, and ran Pareto.

verdict: inconclusive
cdx-connector-r1
gx-connector

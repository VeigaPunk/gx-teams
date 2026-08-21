# Round 1 Pareto — L1 xbgst
**Date:** 2026-08-21
**Sources:** r1-distill.md, r1-connector.md, r1-critic.md, evidence/pure-intermodel-m01.md

## EVIDENCE AUDIT
M01 live tick + L1 qwen38 connector transcript + critic ACH + distiller SYNTHESIS_READY.

## CONFLICTS
- claim: skip PrimeAgent vs run L2 experiment
  [critic]: devil's advocacy — skill skip list, stub already answered
  [user/plan]: this activation exists to test pure-intermodel
  judge_resolution: KEEP L2. M01 already green. Falsify H1 by requiring inner live-exec; do not abort.
- claim: adopt L1 pre-flight as inner connector vs inner must exec
  [connector]: adopt to save budget
  [critic/distiller]: adopt hides X
  judge_resolution: inner MUST live-exec `cdx-connector-r1-inner`. Keep L1 `r1-connector.md` as V baseline (do not overwrite).
- claim: --autonomous on M02
  [L1 draft]: bounded autonomous worker
  [critic/distiller]: autonomous ≈ scheduler
  judge_resolution: DROP --autonomous on M02. One tool-enabled `-p` with 400k goal-token-budget and 900s wall.

## KEEP (improve ≥1, harm none)
| move | axes | evidence |
|---|---|---|
| M01 openai-codex canary | P I E | GATE_INTERMODEL_M01_OK / XBGST_PURE_INTERMODEL_L2_OK / cwd /tmp/xbgst-prime-KrED |
| Live cdx-connector-r1 qwen3.8-max | C E | EXIT:0, banner, README L99 cite, XBGST_CDX_CONNECTOR_R1_OK |
| Session override, no SSoT write | K | marketplace diff not started |
| Inner never APPROVED | K | envelope stop |
| M02 inner live-exec + shell fanout | C X V | critic A3/A4 |
| Provenance fields on artifacts | E C | connector propose |
| 300s connector timeout, `</dev/null` | C I | critic what-if + stdin hang |
| Evidence-only through M06 | K | E-write lock |

## DROP
| move | why |
|---|---|
| Skip PrimeAgent | harms user experiment after P already improved |
| Adopt pre-flight as inner C | harms X/V (grep already green) |
| M02 --autonomous | harms K (scheduler leak) |
| Grok-swap connector | forbidden session override |
| Marketplace/connector.md edit | harms K |
| M07 source this round | E-write not unlocked |
| Warm-up extra M01 ticks | no new axis |

## Axis delta vs Round 0
| axis | R0 | R1 | Δ |
|---|---|---|---|
| I | 0 | 1 | + M01 disposable cwd |
| P | 0 | 1 | + L2 canary |
| C | 0 | 1 | + live qwen38 PROPOSE |
| X | 0 | 0 | inner 4-phase not yet |
| D | 0 | 0 | table not yet |
| K | 1 | 1 | held |
| E | 0 | 1 | gates + evidence files |
| V | 0 | 0 | baseline captured, compare later |

R1 improved P, I, E, C. Round 2 required.

# M02 evidence — one real `grok -p` in gx-teams mux

**Date:** 2026-08-21  
**Host:** grok 1.0.5 (5115b46bc9) [stable]  
**Gate:** `bash scripts/gate-m02.sh`  
**Result:** `GATE_M02_OK`

## Command

```bash
./gx-teams.sh spawn --team toy --name gx-labrat-ping -- \
  cmd env GROK_SUBAGENTS=0 grok --no-leader --no-subagents --always-approve \
  -p 'Reply with exactly: GX_TEAMMATE_PONG'
```

Wrapper kept: `cmd; exec sleep infinity` (no `exec grok`). Capture via spawn `%N`, not `:0.0`. Exact `-t =session`.

## Spawn / exit

| Field | Value |
|---|---|
| session | `gx-teams-toy` |
| pane_id | `%79` |
| wrapper_pid | `187502` |
| gate exit | `0` |
| canary | `GX_TEAMMATE_PONG` present in `tmux capture-pane -t %79` |
| hang | no (PONG within 90s poll) |

## Checks

- Wrapper environ: `GX_TEAMMATE_NAME=gx-labrat-ping`
- Grok child ≠ wrapper when live; no `leader.sock` on child fds
- Zero `claude` in process list
- Toy nuked after gate (`nuke --team toy`)

## Operator freeze (pane_id:pid)

Before and after nuke (unchanged):

- session `0`: `%0:3434`
- session `1`: `%13:84446` `%14:85791` `%15:98485` `%16:100744`

No `tmux attach`, no `kill-server`.

## Secrets

None. No auth.json contents, no API keys, no vault URIs in this file.

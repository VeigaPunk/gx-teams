# gx-teams

From-scratch Grok teammate harness. Same *shape* as Claude Code experimental agent teams + tmux mode (OS process per teammate, named panes, file mailbox later). **Does not wrap `claude`. Does not require TeamCreate.**

Grok Build 1.0.5 has no `teammateMode`. `spawn_subagent` is in-process (depth 1). This supervisor is the missing OS layer.

## M01 (now)

One bash file. Detached named tmux session. Echo toy.

```bash
./gx-teams.sh spawn --team toy --name gx-labrat-ping -- cmd echo PING-OK
./gx-teams.sh nuke  --team toy
bash scripts/gate.sh   # expect GATE_OK; never kills operator sessions 0/1
```

| Contract | Rule |
|---|---|
| Session | `gx-teams-<team>`, created with `new-session -d -s` (**never** `-t`, that is a session group) |
| Target | exact `-t =gx-teams-<team>` (tmux prefix-matches without `=`) |
| Pane handle | `#{pane_id}` (`%N`). **Never** `:0.0` |
| Identity | env `GX_TEAM`, `GX_TEAMMATE_NAME`, `GX_TEAMMATE_ID=name@team` — **not** pane title |
| Hardcap | 16 panes / session |
| Cleanup | `nuke --team` only; **never** `kill-server` |
| Deny | `claude`, `TeamCreate`, `--team 0\|1` |
| Allowlist | `^[A-Za-z0-9][A-Za-z0-9_-]{0,62}$` |
| State | `~/.gx-teams/<team>/config.json` |

## Steal / drop (from CC 2.1.32-era teams, not the 2.1.137 VSCode patch)

**Steal:** OS process per pane; first spawn mkdir (no TeamCreate); JSON inbox with ack-on-write; identity in argv/env; `--no-leader` so panes do not share `~/.grok/leader.sock`.

**Drop:** wrapping Claude Code; TeamCreate/TeamDelete; pane title as SSoT; `tmux send-keys` as the DM bus; `grok agent leader` as the teammate transport; in-process `spawn_subagent` as “teammate mode”.

## Next (not in this tree yet)

Mailbox is a **log** (`~/.gx-teams/<team>/inboxes/<name>.jsonl`). Live DMs need ACP `session/prompt` — Grok 1.0.5 does not poll inbox files.

M02 overfit (one real Grok, flags **before** `-p`):

```bash
./gx-teams.sh spawn --team toy --name gx-labrat-ping -- \
  cmd env GROK_SUBAGENTS=0 grok --no-leader --no-subagents --always-approve \
  -p 'Reply with exactly: GX_TEAMMATE_PONG'
```

ACP leftover (M07): `GROK_SUBAGENTS=0 grok agent --no-leader --always-approve stdio`  
(`grok agent stdio --no-leader` clap-rejects.)

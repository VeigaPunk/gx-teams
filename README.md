# gx-teams

From-scratch Grok teammate harness. Same *shape* as Claude Code experimental agent teams + tmux mode (OS process per teammate, named panes, file mailbox later). **Does not wrap `claude`. Does not require TeamCreate.**

Grok Build 1.0.5 has no `teammateMode`. `spawn_subagent` is in-process (depth 1). This supervisor is the missing OS layer.

## M01 (shipped)

One bash file. Detached named tmux session. Echo toy.

```bash
./gx-teams.sh spawn --team toy --name gx-labrat-ping -- cmd echo PING-OK
./gx-teams.sh nuke  --team toy
bash scripts/gate.sh   # expect GATE_OK; never kills operator sessions 0/1
```

## M02 (shipped)

One real `grok -p` teammate in the mux. Flags before `-p`. Poll capture ≤90s. Operators `0`/`1` pane_id+pid frozen. Toy nuked.

```bash
bash scripts/gate-m02.sh   # expect GATE_M02_OK
# evidence: evidence/m02-pong.md
```

| Contract | Rule |
|---|---|
| Session | `gx-teams-<team>`, created with `new-session -d -s` (**never** `-t`, that is a session group) |
| Target | exact `-t =gx-teams-<team>` (tmux prefix-matches without `=`) |
| Pane handle | `#{pane_id}` (`%N`). **Never** `:0.0` |
| Identity | env `GX_TEAM`, `GX_TEAMMATE_NAME`, `GX_TEAMMATE_ID=name@team`, `GX_PARENT_SESSION=<tmux session name>` — **not** pane title / `%N` |
| Hardcap | 16 panes / session |
| Cleanup | `nuke --team` only; **never** `kill-server` |
| Deny | `claude`, `TeamCreate`, `--team 0\|1` |
| Allowlist | `^[A-Za-z0-9][A-Za-z0-9_-]{0,62}$` |
| State | `~/.gx-teams/<team>/config.json` + `inboxes/<name>.jsonl` |

## M03 (shipped)

`GX_PARENT_SESSION` = spawning client's tmux **session name** (`display-message '#{session_name}'`), not pane id.

```bash
bash scripts/gate-m03.sh   # expect GATE_M03_OK
```

## M04 (shipped)

Mailbox is a JSONL **log** (O_APPEND). `dm` prints `sent` only if write succeeds. Missing `inboxes/` → nonzero (no `mkdir -p` in `dm`).

```bash
./gx-teams.sh dm --team mail --to gx-labrat-ping --text hi
bash scripts/gate-m04.sh   # expect GATE_M04_OK
```

## M05 (shipped)

Hardcap 16: 16×`cmd true`, 17th fails with `hardcap`, nuke `cap`, operators `0`/`1` pane_id:pid frozen.

```bash
bash scripts/gate-m05.sh   # expect GATE_M05_OK
```

## M06 (shipped)

Two titled panes + godspeed 4-rule files on disk at spawn under `~/.gx-teams/<team>/godspeed/<name>.txt`. Both inboxes accept `dm`.

```bash
bash scripts/gate-m06.sh   # expect GATE_M06_OK
```

## Steal / drop (from CC 2.1.32-era teams, not the 2.1.137 VSCode patch)

**Steal:** OS process per pane; first spawn mkdir (no TeamCreate); JSON inbox with ack-on-write; identity in argv/env; `--no-leader` so panes do not share `~/.grok/leader.sock`.

**Drop:** wrapping Claude Code; TeamCreate/TeamDelete; pane title as SSoT; `tmux send-keys` as the DM bus; `grok agent leader` as the teammate transport; in-process `spawn_subagent` as “teammate mode”.

## M08 (xbgst hook pointer)

Optional `/xbgst` `spawn_method: tmux-pane` hook lives in marketplace source only: `grok-marketplace/plugins/xbgst-stack/skills/xbgst/SKILL.md` (not `~/.grok/skills/xbgst` until judge ships/installs).

## Next

Live DMs need ACP `session/prompt` — Grok 1.0.5 does not poll inbox files. Mailbox JSONL is the log only.

ACP leftover (M07): `GROK_SUBAGENTS=0 grok agent --no-leader --always-approve stdio`  
(`grok agent stdio --no-leader` clap-rejects.)

## Routing probes (this host; evidence only)

This Grok pane often exports `CODEX_BIN=codex-titanium`. Stock Codex and Ali lanes **unset** it. Titanium stays sekhmet L3.

| Lane | Command | Canary | Evidence |
|---|---|---|---|
| E2 revenger | `env -u CODEX_BIN codex exec -m gpt-5.6-luna` | `XBGST_CDX_REVENGER_OK` | `evidence/cdx-revenger.md` |
| Ali qwen | `codex exec -p qwen38` | `XBGST_QWEN38_OK` | `evidence/qwen38-cli.md` |
| Ali ds-flash | `codex exec -p ds-flash` | `XBGST_DSFLASH0731_OK` | `evidence/ds-flash-cli.md` |
| Ali ds-pro | `codex exec -p ds-pro` | `XBGST_DSPRO0813_OK` | `evidence/ds-pro-cli.md` |

Keys via `op run` (`BAILIAN_TOKEN_PLAN_API_KEY`). Never curl-as-proof. Never commit `.env`.

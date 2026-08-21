# M08 evidence — xbgst-stack SKILL.md tmux-pane hook (source only)

**Date:** 2026-08-21  
**Host:** grok (scribe gx-scribe-hook; spawn_method grok-spawn_subagent)  
**Gate:** SRC has `tmux-pane` + `gx-teams spawn`; INST lacks `tmux-pane`  
**Result:** `GATE_M08_OK`

## Command

```bash
SRC=/home/vgpnk/Projects/xbgst/grok-marketplace/plugins/xbgst-stack/skills/xbgst/SKILL.md
INST=$(readlink -f ~/.grok/skills/xbgst/SKILL.md)
rg -n 'tmux-pane|gx-teams spawn' "$SRC"
rg -n 'tmux-pane|gx-teams spawn' "$INST" || true
```

## Actual

```
SRC=/home/vgpnk/Projects/xbgst/grok-marketplace/plugins/xbgst-stack/skills/xbgst/SKILL.md
INST=/home/vgpnk/.grok/installed-plugins/xbgst-stack-abb9323e/skills/xbgst/SKILL.md
--- SRC rg ---
191:Optional `spawn_method: tmux-pane` when `$TMUX` is set and `gx-teams` is on `PATH`; otherwise keep in-process `spawn_subagent` / `fnm-multishell` (or pure-bash-isolated) as fallback. `/xbgst` MAY call `gx-teams spawn --team … --name gx-{role}-{suffix} -- cmd …` (no Claude; no TeamCreate). Record the exact spawn command in the handoff block under `spawn_method:` (`fnm-multishell | pure-bash-isolated | tmux-pane`).
295:spawn_method: fnm-multishell | pure-bash-isolated | tmux-pane
--- INST rg (must lack tmux-pane) ---
INST_LACKS_tmux-pane_OK
SRC_NE_INST_OK
```

## Checks

- Marketplace source edited only under `grok-marketplace/plugins/xbgst-stack/skills/xbgst/SKILL.md`
- `~/.grok/skills/xbgst` / installed-plugins tree not edited this slice
- `docs/model-routing.md` not rewritten
- gx-teams README gains M08 pointer to that source path
- No Claude / TeamCreate wording introduced as required path

## Secrets

None.

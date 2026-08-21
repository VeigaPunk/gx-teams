# ACP live DM M02 — initialize → session/new → session/prompt → kill

**Date:** 2026-08-21
**Host:** grok agent stdio (GROK_SUBAGENTS=0 --no-leader --always-approve)
**Choice:** lead-side Python client (extend `acp-oneshot.py`). Fifo-in-pane deferred (invention risk).
**Transport:** subprocess stdin/stdout JSON-RPC — never tmux key injection. Mailbox JSONL is log only.
**ACP cwd:** `/tmp/gx-acp-livedm` (disposable; avoids 60s tool-tour hang on product tree)
**Teammate:** team `acp` name `gx-labrat-acp` (godspeed on disk; pane = `true; exec sleep infinity`)
**Spawn:** `gx-teams-acp %254 512210`
**Connector:** pending (cdx-connector-r1 may land later)

## Protocol

| Step | Value |
|---|---|
| protocolVersion | `1` |
| session/new sessionId | `01a02648-cb7f-7392-a8b1-94bb41cbbb54` |
| session/prompt | sent (godspeed quote) |
| stopReason | `end_turn` |
| session/update count | `88` |
| elapsed_s: | `3.955` |
| Status: | `ok` |

## Godspeed prompt (quoted)

```
Teammate instruction — quote these Godspeed rules back verbatim, then stop. Do not use tools.
1. Name the axes.
2. Iterate cheap, in parallel.
3. Keep moves that improve any axis and harm none.
4. Don't aim — let the frontier walk itself.
```

## Notes

- Clap order: flags before `stdio` (same as M07).
- Hang budget: 60s → exit 2 / blocked E-acp.
- No canary. No APPROVED. No titanium.


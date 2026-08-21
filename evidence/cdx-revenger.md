# E2 — stock Codex luna (`cdx-revenger-m02`)

**Date:** 2026-08-21  
**Lane:** Exception E2 — stock `codex exec`, not Grok `spawn_subagent`, not `codex-titanium`.

## Command (redacted)

```bash
bin=$(CODEX_BIN= command -v codex)   # Bourne-Again shell script, not ELF
env -u CODEX_BIN timeout 180s "$bin" exec -m gpt-5.6-luna \
  --skip-git-repo-check \
  -C grok-marketplace/plugins/xbgst-stack \
  -s read-only \
  'You are cdx-revenger-m02. RECON scripts/prime-agent-l2.sh (read only). Reply with exactly XBGST_CDX_REVENGER_OK plus one FINDING line.'
```

This host exports `CODEX_BIN=codex-titanium`. The gate **unsets** it. Invoked binary: `/home/vgpnk/.local/bin/codex` (omarchy `@openai/codex` stub, Codex CLI **0.149.0**). Provider reported: `openai`. Model: `gpt-5.6-luna`. Sandbox: read-only.

## Result

- `PIPE_EXIT:0`
- **E2_OK**
- Canary: `XBGST_CDX_REVENGER_OK`
- Session: `01a025e8-c36f-73e1-acc0-b028b9256fd5`

## FINDING (from cdx-revenger-m02)

`scripts/prime-agent-l2.sh` `auth.json` validation only blocks `anthropic|openai|github`, so credentials for other non-xAI providers could bypass the intended provider restriction.

## Must-not (verified this run)

- Did not exec `codex-titanium`
- Did not use `service_tier`
- Did not `spawn_subagent(the-revenger)`
- No secrets in this file

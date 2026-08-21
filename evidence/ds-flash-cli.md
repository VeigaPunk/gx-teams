# ds-flash Codex CLI canary

Date: 2026-08-21
Labrat: gx-labrat-ds-flash
Axes: R routing, K no-wrap, E evidence

## Gate result

- **pass** (attempt 1 / 2)
- Canary: `XBGST_DSFLASH0731_OK` **HIT**
- Exit: `0`
- No curl. No titanium binary. No unversioned deepseek.

## Command shape

```bash
set -euo pipefail
test -f /tmp/xbgst-bailian.env
bin=$(CODEX_BIN= command -v codex)
file "$bin" | grep -qi 'ELF 64' && { echo blocked E-CODEX_BIN; exit 2; }
mkdir -p /tmp/codex-token-plan-smoke
op run --env-file=/tmp/xbgst-bailian.env -- env -u CODEX_BIN timeout 120s "$bin" exec -p ds-flash \
  --skip-git-repo-check --ephemeral \
  -C /tmp/codex-token-plan-smoke \
  -s read-only \
  'Reply with exactly: XBGST_DSFLASH0731_OK' \
  | tee /tmp/xbgst-ds-flash-cli.out
grep -q XBGST_DSFLASH0731_OK /tmp/xbgst-ds-flash-cli.out
```

Attempt 2 (source env) not needed — attempt 1 succeeded.

## Binary / CODEX_BIN

| Check | Value |
|---|---|
| `CODEX_BIN=` `command -v codex` | `/home/vgpnk/.local/share/../bin/codex` → `/home/vgpnk/.local/bin/codex` |
| `file` | Bourne-Again shell script, ASCII text executable (not ELF) |
| Shell ambient `CODEX_BIN` | `/home/vgpnk/.local/bin/codex-titanium` (present in env) |
| Run-time | `env -u CODEX_BIN` applied — titanium not used for this exec |
| Blocked E-CODEX_BIN | no |

## Profile / routing evidence

- Profile: `codex exec -p ds-flash`
- Session banner: `model: deepseek-v4-flash-0731`, `provider: bailian-cli`, Codex `v0.149.0`
- `~/.codex/ds-flash.config.toml`: `model = "deepseek-v4-flash-0731"`, `model_provider = "bailian-cli"`
- Provider `bailian-cli` in `~/.codex/config.toml` has `wire_api = "responses"`
- **Finding:** versioned model id `deepseek-v4-flash-0731` routed; canary completed OK

## Output class

- Success path: model replied exactly `XBGST_DSFLASH0731_OK`
- Error class: none (no HTTP 400 / wire_api failure observed)
- Tokens used (banner): 2,536
- Session id: `01a025ef-ed29-7072-96e0-22f17c06a6f1`

## Secrets

None recorded. Env loaded via `op run --env-file=/tmp/xbgst-bailian.env` only.

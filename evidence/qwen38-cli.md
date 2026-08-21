# qwen38 Codex CLI canary

Date: 2026-08-21
Labrat: gx-labrat-qwen38
Axes: R routing, K no-wrap, E evidence

## Gate result

- **pass** (attempt 1 / 2)
- Canary: `XBGST_QWEN38_OK` **HIT**
- Exit: `0`
- No curl. No titanium binary. No `codex-qwen38` wrapper.

## Command shape

```bash
set -euo pipefail
test -f /tmp/xbgst-bailian.env
bin=$(CODEX_BIN= command -v codex)
file "$bin" | grep -qi 'ELF 64' && { echo blocked E-CODEX_BIN; exit 2; }
mkdir -p /tmp/codex-token-plan-smoke
op run --env-file=/tmp/xbgst-bailian.env -- env -u CODEX_BIN timeout 120s "$bin" exec -p qwen38 \
  --skip-git-repo-check --ephemeral \
  -C /tmp/codex-token-plan-smoke \
  -s read-only \
  'Reply with exactly: XBGST_QWEN38_OK' \
  | tee /tmp/xbgst-qwen38-cli.out
grep -q XBGST_QWEN38_OK /tmp/xbgst-qwen38-cli.out
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

- Profile: `codex exec -p qwen38`
- Session banner: `model: qwen3.8-max`, `provider: bailian-cli`, Codex `v0.149.0`
- `~/.codex/qwen38.config.toml`: `model = "qwen3.8-max"`, `model_provider = "bailian-cli"`
- Provider `bailian-cli` in `~/.codex/config.toml` has `wire_api = "responses"`
- **Finding:** `wire_api=responses` did **not** 400 on this run; canary completed OK

## Output class

- Success path: model replied exactly `XBGST_QWEN38_OK`
- Error class: none (no HTTP 400 / wire_api failure observed)
- Tokens used (banner): 3,455
- Session id: `01a025ec-ddb9-7a60-b092-349462c6cc9c`

## Secrets

None recorded. Env loaded via `op run --env-file=/tmp/xbgst-bailian.env` only.

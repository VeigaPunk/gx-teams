# ds-pro Codex CLI canary

Date: 2026-08-21
Labrat: gx-labrat-ds-pro
Axes: R routing, K no-wrap, E evidence

## Gate result

- **pass** (attempt 1 / 2)
- Canary: `XBGST_DSPRO0813_OK` **HIT**
- Exit: `0`
- No curl. No titanium binary. No unversioned deepseek.

## Command shape

```bash
bin=$(CODEX_BIN= command -v codex)
op run --env-file=/tmp/xbgst-bailian.env -- env -u CODEX_BIN timeout 120s "$bin" exec -p ds-pro \
  --skip-git-repo-check --ephemeral -C /tmp/codex-token-plan-smoke -s read-only \
  'Reply with exactly: XBGST_DSPRO0813_OK'
```

Attempt 2 not needed — attempt 1 succeeded.

## Binary / CODEX_BIN

| Check | Value |
|---|---|
| `CODEX_BIN=` `command -v codex` | `/home/vgpnk/.local/share/../bin/codex` → `/home/vgpnk/.local/bin/codex` |
| `file` | Bourne-Again shell script, ASCII text executable (not ELF) |
| Shell ambient `CODEX_BIN` | `/home/vgpnk/.local/bin/codex-titanium` (present in env) |
| Run-time | `env -u CODEX_BIN` applied — titanium not used for this exec |
| Blocked E-CODEX_BIN | no |

## Profile / routing evidence

- Profile: `codex exec -p ds-pro`
- Session banner: `model: deepseek-v4-pro-0813`, `provider: bailian-cli`, Codex `v0.149.0`
- `~/.codex/ds-pro.config.toml`: `model = "deepseek-v4-pro-0813"`, `model_provider = "bailian-cli"`
- Provider `bailian-cli` in `~/.codex/config.toml` has `wire_api = "responses"`
- **Finding:** `wire_api=responses` did **not** 400 on this run; canary completed OK

## Output class

- Success path: model replied exactly `XBGST_DSPRO0813_OK`
- Error class: none (no HTTP 400 / wire_api failure observed)
- Tokens used (banner): 38,430
- Session id: `01a025ef-e610-7213-b5f8-c82b6c5ce1f8`

## Secrets

None recorded. Env loaded via `op run --env-file=/tmp/xbgst-bailian.env` only.

# Codex default = ChatGPT sub; Token Plan is `-p` opt-in

Date: 2026-08-21
Host-only change (not a git path): `~/.codex/config.toml`
gx-teams records the convention. Do not commit `~/.codex`.

## What pinned the picker to qwen

`model_catalog_json` in **base** `~/.codex/config.toml` overrode the model list with only the three Token Plan models. ChatGPT `auth_mode=chatgpt` was already the normal sub — it was unused by the picker.

## After the user switch (cite, do not re-exec)

- Base `config.toml`: **no** `model_catalog_json` assignment. Default stock `codex exec` (no `-p`) = ChatGPT sub.
- Profiles `qwen38` / `ds-flash` / `ds-pro` layer Token Plan catalog **back in** so those entries exist when opted in.
- Desktop Codex app restarted. Old threads may keep per-thread models; new threads get the sub default.
- Ambient Grok panes often export `CODEX_BIN=codex-titanium`. Stock Codex and Token Plan lanes **unset** it. Titanium stays sekhmet L3.

User live smokes (already run; do not redo):

| Check | Session jsonl (host path, not committed) | Result |
|---|---|---|
| Default `env -u CODEX_BIN codex exec` | `~/.codex/sessions/2026/08/21/rollout-2026-08-21T18-13-21-01a0262b-d2b3-7f61-a4b5-96413487dfe5.jsonl` | `SUB_SWITCH_OK` |
| Opt-in `codex exec -p qwen38` | `~/.codex/sessions/2026/08/21/rollout-2026-08-21T18-13-26-01a0262b-e52b-76e0-976b-37d9c1d3049f.jsonl` | `QWEN_STILL_OK` |

## How to use it from gx-teams

```bash
env -u CODEX_BIN codex exec                 # ChatGPT sub (no -p, no -m)
env -u CODEX_BIN codex exec -p qwen38       # Token Plan qwen3.8-max
env -u CODEX_BIN codex exec -p ds-flash     # Token Plan deepseek-v4-flash-0731
env -u CODEX_BIN codex exec -p ds-pro       # Token Plan deepseek-v4-pro-0813
env -u CODEX_BIN codex exec -m gpt-5.6-luna # Exception E2 revenger only
```

Needs `BAILIAN_TOKEN_PLAN_API_KEY` in env for `-p` Token Plan lanes (via `op run` / env-file). Never commit the key.

## Rollback (do not execute from this repo)

```
cp ~/.codex/config.toml.bak.pre-sub-switch ~/.codex/config.toml
cp ~/.codex/qwen38.config.toml.bak ~/.codex/qwen38.config.toml
cp ~/.codex/ds-flash.config.toml.bak ~/.codex/ds-flash.config.toml
cp ~/.codex/ds-pro.config.toml.bak ~/.codex/ds-pro.config.toml
```

Backups are host files. gx-teams never owns them.

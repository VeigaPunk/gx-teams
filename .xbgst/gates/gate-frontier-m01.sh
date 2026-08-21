#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
test -s "$ROOT/evidence/codex-sub-switch.md"
grep -q SUB_SWITCH_OK "$ROOT/evidence/codex-sub-switch.md"
grep -q QWEN_STILL_OK "$ROOT/evidence/codex-sub-switch.md"
grep -q 'config.toml.bak.pre-sub-switch' "$ROOT/evidence/codex-sub-switch.md"
grep -q -- '-p qwen38' "$ROOT/README.md"
grep -qE 'ChatGPT sub|subscription' "$ROOT/README.md"
grep -q 'ds-flash' "$ROOT/README.md"
grep -q 'ds-pro' "$ROOT/README.md"
grep -q 'env -u CODEX_BIN' "$ROOT/README.md"
test -f "$HOME/.codex/qwen38.config.toml"
test -f "$HOME/.codex/ds-flash.config.toml"
test -f "$HOME/.codex/ds-pro.config.toml"
! grep -q '^model_catalog_json' "$HOME/.codex/config.toml"
env -u CODEX_BIN timeout 15s "$(CODEX_BIN= command -v codex)" exec --help | grep -q -- '--profile'
if file "$(CODEX_BIN= command -v codex)" | grep -qi 'ELF 64'; then
  echo blocked E-CODEX_BIN >&2
  exit 2
fi
! grep -qiE 'sk-|api_key=|op://|BAILIAN_TOKEN_PLAN_API_KEY=' "$ROOT/evidence/codex-sub-switch.md" "$ROOT/README.md"
echo GATE_FRONTIER_M01_OK

#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
D="$ROOT/.xbgst/inner/delegation.md"
test -s "$D"
grep -q 'cdx-connector' "$D"
grep -q 'qwen3.8-max' "$D"
grep -q 'deepseek-v4-flash-0731' "$D"
grep -q 'deepseek-v4-pro-0813' "$D"
grep -q 'gpt-5.6-luna' "$D"
grep -q 'openai-codex' "$D"
grep -q 'NOT marketplace SSoT' "$D"
git -C /home/vgpnk/Projects/xbgst/grok-marketplace diff --exit-code -- \
  plugins/xbgst-stack/docs/model-routing.md \
  plugins/xbgst-stack/agents/connector.md \
  plugins/xbgst-stack/commands/references/xbreed-shared.md
echo GATE_INTERMODEL_M04_OK

#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
bash "$ROOT/scripts/gate-m04.sh"
test -s "$ROOT/evidence/acp-live-dm-m04.md"
grep -q '"type":"dm"' "$ROOT/evidence/acp-live-dm-m04.md"
grep -q 'session/prompt' "$ROOT/evidence/acp-live-dm-m04.md"
grep -qE 'log only|JSONL' "$ROOT/README.md"
grep -q 'mailbox JSONL is the log only' "$ROOT/README.md" || grep -q 'JSONL' "$ROOT/README.md"
bash "$ROOT/scripts/gate-all.sh"
echo GATE_FRONTIER_M04_OK

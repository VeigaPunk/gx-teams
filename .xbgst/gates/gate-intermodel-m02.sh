#!/usr/bin/env bash
# M02 overfit: inner r0+r1 with live inner qwen38 connector executed by PrimeAgent.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
I="$ROOT/.xbgst/inner"
EV="$ROOT/evidence/pure-intermodel-m02.md"

test -s "$I/r0-plan.md"
grep -q WWKD "$I/r0-plan.md"
grep -q 'evidence: none — planning artifact' "$I/r0-plan.md"

test -s "$I/r1-propose.md"
grep -q PROPOSE "$I/r1-propose.md"
grep -q cdx-connector "$I/r1-propose.md"

# L1 pre-flight baseline (V control) — must still exist
test -s "$I/r1-connector.md"
grep -q cdx-connector-r1 "$I/r1-connector.md"
grep -q XBGST_CDX_CONNECTOR_R1_OK "$I/r1-connector.md"

# Inner live exec (H1 falsifier) — must be a separate artifact
test -s "$I/r1-inner-connector.md"
grep -q cdx-connector-r1-inner "$I/r1-inner-connector.md"
grep -q XBGST_CDX_CONNECTOR_R1_OK "$I/r1-inner-connector.md"
grep -q 'qwen3.8-max' "$I/r1-inner-connector.md"

test -s "$EV"
grep -q 'qwen3.8-max' "$EV"
grep -q 'env -u CODEX_BIN' "$EV"
grep -q 'inner_exec: yes' "$EV"
! grep -qiE 'codex-titanium|^APPROVED:' "$EV" "$I/r0-plan.md" "$I/r1-propose.md" "$I/r1-inner-connector.md"

bin=$(CODEX_BIN= command -v codex)
if file "$bin" | grep -qi 'ELF 64'; then
  echo blocked E-CODEX_BIN >&2
  exit 2
fi

git -C /home/vgpnk/Projects/xbgst/grok-marketplace diff --exit-code -- plugins/xbgst-stack
git -C "$ROOT" diff --exit-code -- gx-teams.sh scripts README.md

echo GATE_INTERMODEL_M02_OK

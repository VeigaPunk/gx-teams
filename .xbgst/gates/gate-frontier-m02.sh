#!/usr/bin/env bash
# M02 overfit: one ACP live DM (init → session/new → session/prompt → kill).
# Expects evidence already written by scripts/acp-live-dm.py.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
bash scripts/gate-m07.sh   # still GATE_M07_OK
# clap-reject remains
if grok agent stdio --no-leader </dev/null >/dev/null 2>&1; then
  echo FAIL clap >&2
  exit 1
fi

GT="$ROOT/gx-teams.sh"
"$GT" nuke --team acp >/dev/null 2>&1 || true
before0=$(tmux list-panes -s -t '=0' -F '#{pane_id}:#{pane_pid}' | sort)
before1=$(tmux list-panes -s -t '=1' -F '#{pane_id}:#{pane_pid}' | sort)

test -s "$ROOT/evidence/acp-live-dm-m02.md"
grep -q 'protocolVersion' "$ROOT/evidence/acp-live-dm-m02.md"
grep -qE 'session/new|sessionId' "$ROOT/evidence/acp-live-dm-m02.md"
grep -q 'session/prompt' "$ROOT/evidence/acp-live-dm-m02.md"
grep -qE 'Name the axes|godspeed' "$ROOT/evidence/acp-live-dm-m02.md"
! grep -qi 'send-keys' "$ROOT/scripts/acp-live-dm.py" "$ROOT/gx-teams.sh"
! grep -qiE 'codex-titanium|^APPROVED:' "$ROOT/evidence/acp-live-dm-m02.md"

# hang → blocked; live client budget 60s; evidence records elapsed_s or E-acp
grep -qE 'elapsed_s:|blocked E-acp' "$ROOT/evidence/acp-live-dm-m02.md"

"$GT" nuke --team acp >/dev/null
after0=$(tmux list-panes -s -t '=0' -F '#{pane_id}:#{pane_pid}' | sort)
after1=$(tmux list-panes -s -t '=1' -F '#{pane_id}:#{pane_pid}' | sort)
[[ "$before0" == "$after0" && "$before1" == "$after1" ]]

# connector analysis present (real, not canary) — may still be pending body
test -s "$ROOT/.xbgst/inner/live-dm/r1-connector.md"
grep -q cdx-connector "$ROOT/.xbgst/inner/live-dm/r1-connector.md"
grep -qE 'session/prompt|fifo|hang' "$ROOT/.xbgst/inner/live-dm/r1-connector.md"

# Protocol Status row only (notes may mention the hang label)
if grep -qE '^\| Status: \| `blocked E-acp`' "$ROOT/evidence/acp-live-dm-m02.md"; then
  echo "Status: blocked E-acp (see evidence/acp-live-dm-m02.md)" >&2
  exit 2
fi

echo GATE_FRONTIER_M02_OK

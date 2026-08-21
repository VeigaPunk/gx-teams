#!/usr/bin/env bash
# Launch bounded PrimeAgent M02 overfit. Route owner: gx-executor-inner-r01.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SESSION_DIR="${PRIME_AGENT_SESSION_DIR:-$HOME/.xbgst/prime-agent/sessions}"
ROUTE_CWD=$(mktemp -d /tmp/xbgst-prime-XXXX)
mkdir -p "$SESSION_DIR" /tmp/xbgst-prime-conn-m02
case "$ROUTE_CWD" in
  /tmp/xbgst-prime-*) ;;
  *) echo blocked E-cwd >&2; exit 2 ;;
esac

PA=$(command -v prime-agent)
test "$(basename "$PA")" = prime-agent
VER=$(prime-agent --version 2>&1)
test "$VER" = 0.7.4

bin=$(CODEX_BIN= command -v codex)
if file "$bin" | grep -qi 'ELF 64'; then echo blocked E-CODEX_BIN >&2; exit 2; fi

# Token Plan for child shells; do not echo values.
set -a
# shellcheck disable=SC1091
. /tmp/xbgst-bailian.env
set +a
unset CODEX_BIN

export PRIME_AGENT_TELEMETRY=0 DO_NOT_TRACK=1 PI_SKIP_VERSION_CHECK=1
BOUNDARY='L2-loop only. L1 xbgst is the sole scheduler, Pareto judge, APPROVED authority, integrator, and shipper. Follow the supplied route envelope. Return evidence, not decisions. Child fan-out is shell-only stock Codex with env -u CODEX_BIN. Never act as xbrd-selector or sekhmet. Never spawn general-purpose or explore. Never invoke codex-titanium. Never APPROVED, commit, or push.'

echo "M02 ROUTE_CWD=$ROUTE_CWD" | tee /tmp/xbgst-pure-intermodel-m02-launch.txt

# M02 is a single tool-enabled print tick, not --autonomous (distiller/critic: autonomous ≈ scheduler).
# Generous Codex wall; stdin closed so nested `codex exec` is the only reader.
timeout 900s prime-agent --provider openai-codex --model gpt-5.4 --thinking medium \
  --cwd "$ROUTE_CWD" --session-dir "$SESSION_DIR" \
  --append-system-prompt "$BOUNDARY" \
  --goal "Overfit inner xbgst r0+r1; live cdx-connector-r1-inner via qwen38; write required files; stop. Not the L1 judge." \
  --goal-token-budget 400000 \
  -p -- "$(cat "$ROOT/.xbgst/envelopes/m02-prompt.md")" \
  > /tmp/xbgst-pure-intermodel-m02.out \
  2> /tmp/xbgst-pure-intermodel-m02.err
echo "M02 prime-agent exit:$?" | tee -a /tmp/xbgst-pure-intermodel-m02-launch.txt

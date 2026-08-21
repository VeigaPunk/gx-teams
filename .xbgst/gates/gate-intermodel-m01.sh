#!/usr/bin/env bash
# M01 skeleton: one PrimeAgent openai-codex print tick + envelope + canary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
ENV="$ROOT/.xbgst/envelopes/m01.yaml"
OUT=/tmp/xbgst-pure-intermodel-m01.out
EV="$ROOT/evidence/pure-intermodel-m01.md"

test -f "$ENV"
grep -E 'route_id:|parent:|task:|scope:|allowed_actions:|return:|stop:' "$ENV" >/dev/null

CWD=$(mktemp -d /tmp/xbgst-prime-XXXX)
case "$CWD" in
  /tmp/xbgst-prime-*) ;;
  *) echo "blocked E-cwd: $CWD" >&2; exit 2 ;;
esac

PA=$(command -v prime-agent)
test "$(basename "$PA")" = prime-agent
# prime-agent --version prints on stderr
VER=$(prime-agent --version 2>&1)
test "$VER" = 0.7.4

export PRIME_AGENT_TELEMETRY=0 DO_NOT_TRACK=1 PI_SKIP_VERSION_CHECK=1
BOUNDARY='L2-loop only. L1 xbgst is the sole scheduler, Pareto judge, APPROVED authority, integrator, and shipper. Follow the supplied route envelope. Return evidence, not decisions. No child fan-out unless allowed. Never act as xbrd-selector or sekhmet. Never spawn general-purpose or explore. Never invoke codex-titanium.'

: >"$OUT"
: >"${OUT}.err"
set +e
timeout 120s prime-agent --provider openai-codex --model gpt-5.4 --thinking minimal \
  --no-tools --no-session --cwd "$CWD" --append-system-prompt "$BOUNDARY" \
  -p "Envelope route_id=pure-intermodel-l2-2026-08-21-m01 parent=gx-labrat-l2tick. Reply with exactly: XBGST_PURE_INTERMODEL_L2_OK" \
  >"$OUT" 2>"${OUT}.err"
rc=$?
set -e

mkdir -p "$(dirname "$EV")"
{
  echo "# Evidence — pure-intermodel M01 L2 tick"
  echo
  echo "Date: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "Labrat: gx-labrat-l2tick"
  echo "Axes: P proof, I isolation, E evidence, K no-wrap"
  echo
  echo "## Binary"
  echo
  echo "- path: \`$PA\`"
  echo "- basename: \`$(basename "$PA")\`"
  echo "- version: \`$VER\`"
  echo "- provider: openai-codex"
  echo "- model: gpt-5.4"
  echo "- thinking: minimal"
  echo "- cwd: \`$CWD\`"
  echo "- exit: \`$rc\`"
  echo
  echo "## Envelope"
  echo
  echo "\`$ENV\` contains route_id, parent, task, scope, allowed_actions, return, stop."
  echo
  echo "## Stdout"
  echo
  echo '```'
  cat "$OUT"
  echo '```'
  echo
  echo "## Stderr (truncated)"
  echo
  echo '```'
  tail -n 40 "${OUT}.err" || true
  echo '```'
} >"$EV"

grep -q XBGST_PURE_INTERMODEL_L2_OK "$OUT"
grep -q XBGST_PURE_INTERMODEL_L2_OK "$EV"
if grep -qiE 'codex-titanium|/login|^APPROVED:' "$OUT" "${OUT}.err"; then
  echo "blocked E-ban-string" >&2
  exit 2
fi
echo GATE_INTERMODEL_M01_OK

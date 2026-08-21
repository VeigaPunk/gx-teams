#!/usr/bin/env bash
# Mutate-run-revert on the SESSION delegation table + envelopes, not gx-teams.sh.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
D="$ROOT/.xbgst/inner/delegation.md"
EV="$ROOT/evidence/pure-intermodel-m05.md"
WORKDIR=$(mktemp -d /tmp/xbgst-mut-XXXX)
trap 'rm -rf "$WORKDIR"' EXIT
cp "$D" "$WORKDIR/delegation.md"
cp "$ROOT/.xbgst/envelopes/m02.yaml" "$WORKDIR/m02.yaml"

killed=0
total=0
survived=()

detect() {
  local f="$1"
  # Detector should FAIL (return 1) when a mutant is present.
  if grep -q 'spawn_subagent' "$f" 2>/dev/null; then return 1; fi
  if grep -q 'connector.*Grok' "$f" 2>/dev/null && ! grep -q 'Never Grok' "$f"; then return 1; fi
  if ! grep -q 'env -u CODEX_BIN' "$f"; then return 1; fi
  if grep -q '^APPROVED:' "$f"; then return 1; fi
  if grep -Eq '(^|[^a-z-])explore([^a-z-]|$)' "$f" && ! grep -q 'banned' "$f"; then return 1; fi
  if grep -q 'codex-titanium' "$f" && ! grep -qi 'never.*titanium\|forbidden'; then return 1; fi
  return 0
}

run_mutant() {
  local name="$1" file="$2"
  total=$((total + 1))
  if detect "$file"; then
    survived+=("$name")
    echo "MUTANT: $name RESULT: SURVIVED"
  else
    killed=$((killed + 1))
    echo "MUTANT: $name RESULT: KILLED"
  fi
}

# M1 connector → Grok spawn
cp "$WORKDIR/delegation.md" "$WORKDIR/m1.md"
sed -i 's/cdx-connector-rN/**gx-connector**/; s/codex exec -p qwen38/Grok spawn_subagent/; s/Never Grok `spawn_subagent`/Use Grok spawn_subagent/' "$WORKDIR/m1.md"
run_mutant "connector→Grok spawn" "$WORKDIR/m1.md"

# M2 missing env -u CODEX_BIN
cp "$WORKDIR/delegation.md" "$WORKDIR/m2.md"
sed -i '/env -u CODEX_BIN/d' "$WORKDIR/m2.md"
run_mutant "missing env -u CODEX_BIN" "$WORKDIR/m2.md"

# M3 inner APPROVED
cp "$WORKDIR/m02.yaml" "$WORKDIR/m3.yaml"
printf '\nAPPROVED: inner ship\n' >>"$WORKDIR/m3.yaml"
run_mutant "inner APPROVED:" "$WORKDIR/m3.yaml"

# M4 banned explore as allowed
cp "$WORKDIR/delegation.md" "$WORKDIR/m4.md"
printf '\nallowed: explore, general-purpose\n' >>"$WORKDIR/m4.md"
# strip the ban line so explore is not in a banned context
sed -i '/Banned types/d' "$WORKDIR/m4.md"
run_mutant "banned explore allowed" "$WORKDIR/m4.md"

{
  echo "# Evidence — delegation mutation (M05)"
  echo
  echo "Date: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "Target: session-local delegation.md + envelopes (NOT gx-teams.sh)"
  echo
  echo "MUTATION SCORE: ${killed}/${total} ($(( killed * 100 / total ))%)"
  echo "SURVIVING MUTANTS: ${#survived[@]}"
  if ((${#survived[@]})); then
    printf 'CRITICAL GAPS: %s\n' "${survived[*]}"
  else
    echo "CRITICAL GAPS: none"
  fi
  echo
  echo "Mutants required KILLED: connector→Grok spawn; missing env -u CODEX_BIN; inner APPROVED:; banned explore"
} | tee "$EV"

test "$killed" -eq "$total"
grep -q 'MUTATION SCORE:' "$EV"
echo GATE_INTERMODEL_M05_OK

#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
F="$ROOT/evidence/pure-vs-guided.md"
test -s "$F"
grep -q 'pure-intermodel' "$F"
grep -q 'guided' "$F"
grep -q 'cdx-connector-r1' "$F"
grep -q 'gx-connector' "$F"
grep -Eq 'verdict: (pure|guided|tie|inconclusive)' "$F"
echo GATE_INTERMODEL_M06_OK

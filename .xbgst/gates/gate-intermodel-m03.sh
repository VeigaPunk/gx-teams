#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
I="$ROOT/.xbgst/inner"
for f in r1-propose.md r1-critique.md r1-pareto.md r1-compile.md r1-connector.md; do
  test -s "$I/$f"
done
grep -q cdx-connector "$I/r1-propose.md"
grep -q inner-pareto "$I/r1-pareto.md"
grep -q COMPILE "$I/r1-compile.md"
! grep -q '^APPROVED:' "$I/r1-compile.md"
git -C "$ROOT" diff --exit-code -- gx-teams.sh scripts README.md
echo GATE_INTERMODEL_M03_OK

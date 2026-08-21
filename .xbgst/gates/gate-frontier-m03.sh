#!/usr/bin/env bash
set -euo pipefail
I=/home/vgpnk/Projects/xbgst/gx-teams/.xbgst/inner/live-dm
for f in r0-plan.md r1-propose.md r1-critique.md r1-pareto.md r1-compile.md r1-connector.md; do
  test -s "$I/$f"
done
grep -q WWKD "$I/r0-plan.md"
grep -q PROPOSE "$I/r1-propose.md"
grep -q cdx-connector "$I/r1-propose.md"
grep -q inner-pareto "$I/r1-pareto.md"
grep -q COMPILE "$I/r1-compile.md"
! grep -q '^APPROVED:' "$I/r1-compile.md"
! grep -qiE 'Reply with exactly|MUTATION SCORE' "$I"/r1-*.md
test -f /home/vgpnk/Projects/xbgst/gx-teams/scripts/acp-live-dm.py
git -C /home/vgpnk/Projects/xbgst/grok-marketplace diff --exit-code -- plugins/xbgst-stack
echo GATE_FRONTIER_M03_OK

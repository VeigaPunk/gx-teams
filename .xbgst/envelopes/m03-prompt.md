You are PrimeAgent L2 (openai-codex gpt-5.4). NOT the L1 judge. NOT gx-*. Evidence only.

Godspeed inner (no ship): name axes; iterate cheap; keep Pareto-safe moves; stop asking questions.

M02 already landed:
- `.xbgst/inner/r0-plan.md` WWKD stub
- `.xbgst/inner/r1-propose.md` PROPOSE + cdx-connector
- `.xbgst/inner/r1-inner-connector.md` live qwen3.8-max
- README L99: live DMs need ACP session/prompt; mailbox JSONL is the log only.

## Write exactly these three files (do not overwrite r1-connector.md, r1-critic.md, r1-inner-connector.md)

1. `/home/vgpnk/Projects/xbgst/gx-teams/.xbgst/inner/r1-critique.md`
   - CROSS-CRITIQUE of the M02 propose
   - mention cdx-connector
   - no APPROVED

2. `/home/vgpnk/Projects/xbgst/gx-teams/.xbgst/inner/r1-pareto.md`
   - must contain the string `inner-pareto`
   - advisory scoring only; L1 still judges
   - keep/drop bullets
   - no APPROVED

3. `/home/vgpnk/Projects/xbgst/gx-teams/.xbgst/inner/r1-compile.md`
   - must contain `COMPILE`
   - must state `evidence-only; L1 retains APPROVED`
   - must NOT contain `APPROVED:` as a claim
   - no git push

4. `/home/vgpnk/Projects/xbgst/gx-teams/evidence/pure-intermodel-m03.md`
   - record you did not ship
   - provider openai-codex gpt-5.4

Optional: if you spawn a pondering child use `env -u CODEX_BIN timeout 180s "$(CODEX_BIN= command -v codex)" exec -p ds-pro`. Speed child: `-p ds-flash`. Connector child: `-p qwen38`. Never titanium. stdin `</dev/null`. Source `/tmp/xbgst-bailian.env` without printing secrets.

When the three inner files exist, stop.

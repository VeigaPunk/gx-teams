# live-dm r1-connector — cdx-connector-r1 (qwen3.8-max)

spawn_method: cdx-cli qwen38
cwd: /tmp/xbgst-cdx-livedm-r1
CODEX_BIN unset: yes
banner: model: qwen3.8-max / provider: bailian-cli
exit: 0
note: model stdout was empty; analysis recovered from live exec transcript (`/tmp/xbgst-cdx-livedm-r1.err`). Not a canary.

# State
- inf: hang modes are H1 handshake stall, H2 session/new stall, H3 prompt with no result, H4 session/update past cap, H5 inbound fs/tool request deadlock, H6 child EOF, H7 nuke/SIGHUP mid-prompt. Clap order is load-bearing (`flags` before `stdio`). Fifo is the live bus; JSONL mailbox is log only [strong] — axes: L, I, K
- risk: lead-side M02 client already shipped (elapsed_s 5.730, disposable `/tmp` cwd). A fifo-in-pane bridge is additive; patching `gx-teams.sh dm` now would harm M04/gate-all. Product-tree cwd on `session/prompt` tool-tours past 60s.

# Dissent
- Per-DM oneshot reuses M07 path but loses session continuity — reject as the live bus; keep its initialize argv identical.
- Dual-write `dm` to fifo this slice — reject (harness diff). Additive `acp-live-dm.py serve|send` instead.
- send-keys — banned.

# Rationale
Axes: continuity (one ACP session), hang safety (60s → E-acp), gate safety (zero diff to M07), forensics (JSONL log), simplicity (one file).

# PROPOSE
1. Keep M02 lead-side client as the overfit that already greened `GATE_FRONTIER_M02_OK`.
2. M03 additive: `python3 scripts/acp-live-dm.py serve` in the teammate pane (fifo under `~/.gx-teams/acp/…`, O_RDWR hold, `--cap 60`, `--rules` quotes godspeed). `send` ENXIO if no listener. Never send-keys.
3. Honor inbound `fs/readTextFile` only inside disposable cwd; error writes — avoids H5 deadlock.
4. Do not dual-write `gx-teams.sh dm` until M04.

session/prompt hang fifo
cdx-connector-r1

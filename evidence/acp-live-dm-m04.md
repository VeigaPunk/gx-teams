# ACP pairing with mailbox log — M04

Date: 2026-08-21
JSONL mailbox remains the log (`gx-teams.sh dm` O_APPEND). Live path is ACP `session/prompt`.

## Pairing

After a successful JSONL write, `dm` best-effort fires `scripts/acp-live-dm.py send` **only if** `~/.gx-teams/<team>/live-dm/<name>.fifo` exists (named pipe). Missing fifo does not fail `dm` — `gate-m04.sh` still `GATE_M04_OK`.

`send` is O_NONBLOCK: no listener → ENXIO, ignored by `dm`. The JSONL record still has `"type":"dm"`.

## Fail-fast send (no listener)

```
python3 scripts/acp-live-dm.py send --text hi
```

Expected: nonzero, "no live listener" / missing fifo. Not a hang.

## Live ACP

`serve` holds initialize → session/new then one `session/prompt` per fifo line (60s cap). M02 lead-side client remains the overfit (`GATE_FRONTIER_M02_OK`, elapsed_s 5.730).

No send-keys. No canary. No APPROVED.

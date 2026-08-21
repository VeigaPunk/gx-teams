# ACP live DM M03 — additive FIFO serve/send

**Date:** 2026-08-21  
**Scope:** `scripts/acp-live-dm.py` only. No `gx-teams.sh dm` patch. Stdlib only.

## Change

Added additive FIFO modes to `scripts/acp-live-dm.py`:
- `serve`: bootstrap one ACP session with `initialize` → `session/new`, then accept FIFO prompts and call `session/prompt` on the same session.
- `send`: write one single-line prompt into the FIFO.

Kept default no-arg mode as the M02 lead probe.

## Static evidence

- `python3 -m py_compile scripts/acp-live-dm.py` → pass.
- The script still contains `initialize`, `session/new`, and `session/prompt` in the no-arg lead path and in `serve` bootstrap.
- `send` rejects multiline `--text` to keep one-send/one-prompt framing explicit.
- ACP server requests are handled additively: `fs/readTextFile` is limited to the disposable cwd; `fs/writeTextFile` returns an error.

## Dynamic evidence

### ENXIO guard

Command:

```bash
mkfifo /tmp/test-enxio.fifo
python3 scripts/acp-live-dm.py send --fifo /tmp/test-enxio.fifo --text 'ping'
```

Observed:

```text
no live listener on fifo: /tmp/test-enxio.fifo
```

### FIFO smoke

Command shape:

```bash
python3 scripts/acp-live-dm.py serve   --fifo /tmp/test.fifo   --log /tmp/test.jsonl   --cwd /tmp/test-acp   --cap 10   --once &
python3 scripts/acp-live-dm.py send --fifo /tmp/test.fifo --text 'Reply with FIFO-OK and stop.'
wait
```

Observed serve stdout:

```text
fifo=/tmp/test.fifo
log=/tmp/test.jsonl
sessionId=01a02648-bd3e-7440-b3a4-4f420238f977
Status: serving
{"ts": "2026-08-21T21:44:59Z", "fifo": "/tmp/test.fifo", "sessionId": "01a02648-bd3e-7440-b3a4-4f420238f977", "prompt": "Reply with FIFO-OK and stop.", "rules": false, "stopReason": "end_turn", "status": "ok", "elapsed_s": 2.613, "sessionUpdateCount": 51}
```

Observed send stdout:

```text
sent
```

Observed JSONL log:

```json
{"ts": "2026-08-21T21:44:59Z", "fifo": "/tmp/test.fifo", "sessionId": "01a02648-bd3e-7440-b3a4-4f420238f977", "prompt": "Reply with FIFO-OK and stop.", "rules": false, "stopReason": "end_turn", "status": "ok", "elapsed_s": 2.613, "sessionUpdateCount": 51}
```

### M02 no-arg path still green after patch

Command:

```bash
python3 scripts/acp-live-dm.py
```

Observed:

```text
protocolVersion=1
sessionId=01a02648-cb7f-7392-a8b1-94bb41cbbb54
session/prompt stopReason=end_turn
elapsed_s: 3.955
Status: ok
evidence: /home/vgpnk/Projects/xbgst/gx-teams/evidence/acp-live-dm-m02.md
```

## Optional stock Codex review

Command used stock `codex exec` with `env -u CODEX_BIN`, after sourcing `/tmp/xbgst-bailian.env` without printing secrets, stdin `</dev/null`.

Review reply:

```text
- **Kept:** Yes—the default lead path remains `initialize → session/new → session/prompt`, while FIFO prompts reuse the serve session ID.
- **Risk:** A malformed `initialize` now aborts before `session/new`, and its error text changed; only failure-path expectations may break.
- **Test:** Static checks pass. Add a mocked `serve --once`/`send` test asserting exact request order, session-ID reuse, and both validation cutoffs.
```

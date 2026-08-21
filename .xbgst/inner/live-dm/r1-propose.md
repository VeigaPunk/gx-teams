# live-dm r1-propose

PROPOSE
- Keep default `python3 scripts/acp-live-dm.py` as the M02 lead probe.
- Add `serve` to hold one ACP session behind a FIFO and append JSONL results.
- Add `send` to write one single-line prompt into that FIFO and fail fast when no listener exists.
- Reuse the same `initialize` → `session/new` bootstrap in both default and `serve`.
- Honor inbound `fs/readTextFile` only inside the disposable cwd; reject writes.

Connector input
- cdx-connector-r1 says additive fifo `serve|send` is safer than patching `gx-teams.sh dm` now.

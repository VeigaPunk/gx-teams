# live-dm r1-compile

COMPILE
- Implemented additive `serve` / `send` FIFO support in `scripts/acp-live-dm.py`.
- Kept the existing no-arg lead path with `initialize`, `session/new`, and `session/prompt`.
- Added bounded ACP request handling for `fs/readTextFile` under the disposable cwd and rejected writes.
- Added FIFO log append and fast `send` failure when no listener exists.
- Evidence-only; L1 retains APPROVED.

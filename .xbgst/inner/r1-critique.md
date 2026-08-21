# r1 critique

CROSS-CRITIQUE of M02 propose

Evidence reviewed
- README L99: "Live DMs still need ACP `session/prompt` — mailbox JSONL is the log only."
- README L90: M07 is optional ACP one-shot and not an M_final blocker.
- `.xbgst/inner/r1-inner-connector.md` from cdx-connector-r1-inner corroborates the same split.

Axes
- Scope axis: the propose stays on the next unshipped slice and does not drift into implementation.
- Evidence axis: the main claim is anchored to README L99, which is the strongest local source.
- Boundary axis: mailbox JSONL is treated as logging evidence only, not live transport.
- Risk axis: the propose is directionally right, but it compresses optional M07 ACP handshake context that can confuse readers.

Critique
- Keep the core claim. It matches README L99 and the cdx-connector evidence.
- Tighten wording around "next unshipped slice" so readers do not mistake optional M07 `initialize` for live DM delivery.
- Add one explicit boundary sentence: M07 proves only a one-shot ACP handshake path, not `session/prompt` live DMs.
- Preserve the no-implementation stance. That keeps this pass cheap and Pareto-safe.

Net
- M02 propose is supported.
- Best cheap improvement is precision, not scope expansion.

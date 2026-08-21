name: cdx-connector-r1-inner
model: qwen3.8-max

Evidence note (verified on disk, `/tmp/gx-teams-README.wip.md`):

- **State corroborated.** README L86 (verbatim): "Live DMs still need ACP `session/prompt` — mailbox JSONL is the log only." M06 is marked "(shipped)" with mailbox `dm` only, so ACP `session/prompt` live DM is the remaining unshipped slice.
- **Dissent corroborated.** README L77: "## M07 (optional ACP one-shot; not an M_final blocker)". M07 scope is `initialize` (`protocolVersion: 1`) then kill — no `session/prompt`. Probe evidence `/tmp/gx-acp-oneshot.out` shows only `protocolVersion=1`.
- **Resolution:** claims are compatible — M07 one-shot is an optional handshake probe, not live DM shipping; the actual next slice is ACP `session/prompt`.

XBGST_CDX_CONNECTOR_R1_OK

XBGST_CDX_CONNECTOR_R1_OK

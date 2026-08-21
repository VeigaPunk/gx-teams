provider: openai-codex
model: gpt-5.4
env: env -u CODEX_BIN
inner_exec: yes
connector_model: qwen3.8-max
binary: /home/vgpnk/.local/bin/codex
file: /home/vgpnk/.local/bin/codex: Bourne-Again shell script, ASCII text executable
exit_codes: 0
banner: model: qwen3.8-max
artifacts:
  - /home/vgpnk/Projects/xbgst/gx-teams/.xbgst/inner/r0-plan.md
  - /home/vgpnk/Projects/xbgst/gx-teams/.xbgst/inner/r1-propose.md
  - /home/vgpnk/Projects/xbgst/gx-teams/.xbgst/inner/r1-inner-connector.md
readme_citation: README.md:99 "Live DMs still need ACP `session/prompt` — mailbox JSONL is the log only."

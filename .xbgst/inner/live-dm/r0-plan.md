# live-dm r0-plan

evidence: none — planning artifact

WWKD
- Keep the M02 lead-side path intact.
- Add the fifo path in `scripts/acp-live-dm.py`, not `gx-teams.sh dm`.
- Use cheap proof: py_compile, live fifo smoke, and grep for `initialize` / `session/new` / `session/prompt`.
- Stay Pareto-safe: stdlib only, flags before `stdio`, 60s cap, no send-keys.

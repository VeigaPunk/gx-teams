# live-dm r2-connector — cdx-connector-r2 (qwen3.8-max)

State: REVIEWED-COLD. Read acp-live-dm.py (8403 B) + acp-live-dm-m02.md line by line; ran no writes, no spawn. M02 green at 5.730s is credible: deadline-shared budget, select/os.read loop avoids Python buffering trap, clean exit-2 on budget burn.

Dissent: three real defects before any product-tree cwd or fifo work:
1. **EOF path hangs unbounded**: `_readline` EOF branch calls `self.proc.stderr.read()` — blocking, no deadline. Child (or its orphans) holding stderr open after stdout EOF = permanent hang, budget never fires. Fix: `os.read(stderr_fd, 4096)` under select with ~1s cap, or skip stderr capture entirely.
2. **Server→client requests swallowed**: client advertises `fs.readTextFile/writeTextFile` + `terminal` capabilities, but `request()` appends any `method`-bearing frame to `updates` and never answers. An ACP agent issuing `fs/readTextFile` waits on our reply → we burn the 60s and gate goes exit 2. The 5.730s run dodged this only because the prompt forbade tools.
3. **Pre-ACP phase unbudgeted**: both `subprocess.run` calls to gx-teams.sh (nuke/spawn) have no `timeout=` — wedged tmux server hangs before the ACP clock even starts. Minor: blocking `stdin.write` to a wedged child; `parents[1]` makes script location part of the contract (in this r2 copy it resolves ROOT=/tmp, so GT is a dead path — fine for review, fatal if run in place).

Rationale: on cwd survival — the client itself is cwd-independent: all paths absolute (ROOT from `__file__`, STATE_ROOT env/home, EVIDENCE under ROOT), `acp_cwd` is just a string in session/new. The product-tree risk is behavioral (agent tool-tours the tree inside 60s) plus defect #2, not path logic. On fifo: M02's transport is stdio-only; the pane (`true; exec sleep infinity`) is never touched after spawn, so a serve/send fifo is orthogonal and cannot break gate-m02 if it lands as a separate script with m02 frozen. Fifo-specific hang modes to pre-kill: blocking `open(fifo,'w')` with no reader (sender hangs forever — use O_NONBLOCK, fail fast E-noserve), reader EOF spin after all writers close (serve must blocking-reopen, not busy-loop), and >PIPE_BUF (4096 B) writes tearing frames from concurrent senders (one JSON line ≤ 4096 B per message). Keep the fifo under STATE_ROOT, never in the tree.

PROPOSE:
1. Patch acp-live-dm.py in place, 3 lines-class fixes: bounded stderr capture on EOF; catch-all JSON-RPC error response for inbound server requests with an id (or drop fs/terminal capabilities to empty); `timeout=30` on both gx-teams.sh calls, counted outside the 60s ACP budget.
2. Re-run gate-m02 with disposable cwd to confirm still green; then one probe run with product-tree cwd as a separate evidence file (m02b) — do not move the frozen gate's cwd yet.
3. Land serve/send fifo next as its own gate (m03): STATE_ROOT fifo, O_NONBLOCK sender, blocking-reopen serve loop, ≤4096 B frames, `gx-teams.sh nuke` documented as destroying any live serve (senders must fail fast, not hang).
4. Known accepted residue: sleep-infinity pane leaks until next nuke; elapsed_s includes tmux spawn, so split phase timers when comparing gates.
EXIT:0

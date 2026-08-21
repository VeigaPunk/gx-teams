# live-dm r1-pareto

inner-pareto
- Best kept: one-file stdlib patch in `scripts/acp-live-dm.py`.
- Best avoided: any edit to `gx-teams.sh dm`, tmux injection, or product-tree cwd probing.
- Cheap evidence: py_compile, ENXIO send failure, one `serve --once` + `send` smoke, and a no-arg M02 rerun.
- Residual tradeoff: FIFO is single-line by contract; that is explicit now.

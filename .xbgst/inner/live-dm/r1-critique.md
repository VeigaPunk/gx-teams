# live-dm r1-critique

- FIFO framing can hide edge cases if one write carries multiple prompts; drain logic must not stall on buffered lines.
- `send` newline payloads would split prompts, so single-line enforcement is safer than pretending multiline works.
- `serve` must not replace the green M02 path; the no-arg path stays the overfit gate proof.
- ACP server requests can deadlock the session if the client ignores request/response IDs.

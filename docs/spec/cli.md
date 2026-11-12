# CLI

bash 5 over `git`, `gh` and `jq`. Git-style dispatch: `mandate <cmd>` runs `mandate-<cmd>` from `PATH`, so each command is one small script.

| Command | Effect |
|---|---|
| `mandate init <profile>` | Scaffold from the template; create labels, CODEOWNERS, rulesets, topic `mandate`; status inception |
| `mandate sync [--upgrade]` | Reapply template-managed files, labels and rulesets at the pinned version; `--upgrade` opens a gated PR bumping `.mandate/version` |
| `mandate status [repo...]` | State, stalled ([workflow](workflow.md#reporting)), active milestone progress, open gates, blocked issues |
| `mandate next [--claim]` | Next workable issue; `--claim` labels it `wip` and comments the session id |
| `mandate adr new <title>` | ADR file from template with the next number, on a new branch |
| `mandate rfc new <title>` | Same, for an RFC |
| `mandate milestone new <title>` | Same, for a milestone proposal |
| `mandate handoff <file>` | Commit a design-session document as a gated PR |
| `mandate block <issue> <question>` | Label `blocked`, assign the BDFL, comment |
| `mandate closeout` | Verify the milestone is done; scaffold Review and next proposal; close the GitHub milestone |
| `mandate release <version>` | Open the release PR |
| `mandate digest [--since <date>] [--post]` | Cross-project summary to stdout; `--post` opens the digest issue |
| `mandate check` | Lint ([enforcement](enforcement.md#mandate-check)); CI entry point |

## `mandate next`

Picks from the active milestone, skipping issues labeled `wip` or `blocked` and issues whose `Depends on #N` targets are open. Lowest issue number first, so creation order is priority order.

`--claim` writes the label, then re-reads the issue; if another session's claim comment precedes its own, it releases and picks again.

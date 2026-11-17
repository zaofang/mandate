# CLI

bash 5 over `git`, `gh`, `jq` and `yq` ([ADR-0016](../adr/0016-yq.md)). Git-style dispatch: `mandate <cmd>` runs `mandate-<cmd>` from `PATH`, so each command is one small script.

Output is plain text, one line per item, no banners or colour; success prints only the result. Output is read by agents, so every line costs tokens.

| Command | Effect |
|---|---|
| `mandate init <profile>` | Scaffold from the template, replacing `@BDFL` in CODEOWNERS and the App id in `tags.json`; create labels, rulesets, topic `mandate`; status inception |
| `mandate sync [--upgrade]` | Reapply template-managed files, labels and rulesets at the pinned version; `--upgrade` opens a gated PR bumping `.mandate/version`. Refuses a ruleset whose required checks fail `mandate check` |
| `mandate status [repo...]` | State and whether agents may work in it ([lifecycle](overview.md#lifecycle)), stalled ([workflow](workflow.md#reporting)), active milestone progress, open gates, blocked issues |
| `mandate next [--claim]` | Next workable issue: number, title, body; `--claim` labels it `wip` and comments the session id |
| `mandate new <adr\|milestone> <title>` | Document from its template, numbered `NNNN` or `NNN`, on a new branch |
| `mandate number` | Replace `NNNN`/`NNN` placeholders with the next free numbers; run as the final commit after merging main |
| `mandate handoff <file>` | Commit a design-session document as a gated PR |
| `mandate block <issue> <question>` | Label `blocked`, assign the BDFL, comment |
| `mandate closeout` | Verify the milestone is done; scaffold Review and next proposal; close the GitHub milestone |
| `mandate release <version>` | Open the release PR |
| `mandate digest [--since <date>] [--post]` | Cross-project summary to stdout; `--post` opens the digest issue |
| `mandate check` | Lint ([enforcement](enforcement.md#mandate-check)); CI entry point |

## `mandate next`

Picks from the active milestone, skipping issues labeled `wip` or `blocked` and issues whose `Depends on #N` targets are open. Order:

1. the session's own open PR with failing checks or requested changes;
2. the session's own gated PR that is no longer mergeable;
3. the workable issue with the most open issues depending on it;
4. lowest issue number, so creation order breaks ties.

`--claim` writes the label, then re-reads the issue; if another session's claim comment precedes its own, it releases and picks again.

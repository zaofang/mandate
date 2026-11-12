# Workflow

## Milestone loop

1. **Approve.** The BDFL merges a milestone proposal. An agent creates the GitHub milestone `NNN <title>` and decomposes Scope into task issues in it.
2. **Execute.** Agents pull issues ([agents](agents.md)); one PR per issue.
3. **Discover.** In-scope work found along the way becomes a new issue in the milestone. Out-of-scope work becomes an issue with no milestone, labeled `triage`.
4. **Close out.** When every milestone issue is closed, an agent opens one gated PR that:
   - fills the milestone's Review and sets status `done`;
   - proposes the next milestone, drawn from ROADMAP Next and `triage` issues;
   - updates `ROADMAP.md`;
   - recommends a release if one is due.

   It then closes the GitHub milestone. The project is now awaiting.
5. **Decide.** The BDFL merges (back to step 1), requests changes (agents revise the PR), or closes it with a comment saying what happens instead.

## Labels

| Label | Meaning | Set by |
|---|---|---|
| `gate` | Needs a BDFL decision | agents, CI |
| `blocked` | Agent cannot continue; issue assigned to the BDFL | agents |
| `wip` | Claimed by an agent session | agents |
| `triage` | Out-of-scope discovery, considered at the next close-out | agents |
| `bdfl` | Work only the BDFL can do: accounts, purchases, taste calls | anyone |
| `bug` | Defect | anyone |
| `release` | Release PR | agents |
| `handoff` | Issue carrying a design-session document | BDFL |
| `process` | Framework repo only: request to change Mandate | agents |
| `digest` | Framework repo only: weekly digest | agent runner |

PR kind is carried by the title, not labels.

## Branches and PRs

- Agent branches: `agent/<issue>-<slug>`.
- One issue per PR. Body: `Closes #N`, summary, non-obvious decisions, how it was verified.
- Titles follow Conventional Commits (`feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`; `!` marks breaking).
- Squash merge only; linear history.
- A PR is either gated or ungated, never both. An implementation that needs a gated change waits for that change's PR to merge.
- Ungated PRs auto-merge on green CI. Gated PRs get the `gate` label and a review request to the BDFL.

## Releases

Opened by an agent when the BDFL asks, or after a close-out PR that recommended one merges.

1. `mandate release <version>`: one PR with the version bump and the Unreleased section moved under the version. Labeled `release`; gated.
2. On merge, the release workflow tags `v<version>` and creates the GitHub release from the changelog section.

Versioning is SemVer.

## Handoff

Design sessions in claude.ai produce gated documents; handoff gets them into the repo unchanged.

A design session ends with one or more complete documents in [artifact](artifacts.md) formats, each preceded by its target path. The claude.ai project instructions, shipped by the template, require this ending. Numbers may be left as `NNNN`.

Delivery, either way:

- **Phone:** open an issue labeled `handoff`, paste the documents. An agent commits them verbatim as a gated PR, assigning numbers, and flags any problems as review comments on its own PR.
- **Desktop:** `mandate handoff <file>` opens the PR directly.

Approving the PR confirms the transcription. The claude.ai project carries `VISION.md`, `ROADMAP.md`, `docs/architecture.md` and the ADRs as knowledge so design sessions start from the current state.

## Reporting

| Event | Channel |
|---|---|
| Gated PR opened | Review request from CODEOWNERS; GitHub Mobile push |
| Agent blocked | Issue assigned to the BDFL; GitHub Mobile push |
| Weekly | Digest issue in the Mandate repository, mentioning the BDFL; GitHub Mobile push |

A project is **stalled** when it is active, `mandate next` has an issue, and the last agent activity (claim comment, push, PR event) is older than 2 hours. `mandate status` and the digest report it.

`mandate digest` reports per project: state, stalled, active milestone progress, open gates with age, blocked issues, `triage` count, PRs merged in the period. Stalled projects, gates and blocks come first. The agent runner runs `mandate digest --post` weekly; it opens a new issue labeled `digest` and closes the previous one.

Projects are found by the GitHub topic `mandate` on the owners listed in `~/.config/mandate/owners`.

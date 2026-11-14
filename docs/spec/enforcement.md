# Enforcement

Gates hold because GitHub refuses the merge, not because the contract asks. Three layers: identity, path gates, semantic gates.

## Identity

One private GitHub App per owner (zaofang, animal-spirits, the BDFL's account), installed on Mandate repositories ([ADR-0012](../adr/0012-agent-identity.md)).

| Permission | Level |
|---|---|
| Contents | write |
| Pull requests | write |
| Issues | write |
| Workflows | none |
| Administration | none |

Without the workflows permission GitHub rejects any push from the App that changes `.github/workflows/`. Runners that can use the App push with its installation tokens. Runners that act through the BDFL's account (claude.ai sessions) push as the BDFL; for them CODEOWNERS on `.github/` is the only workflow gate.

## Agent PRs

Agents push branches; they never open PRs or submit reviews. The `agent-pr` workflow runs on every push to `agent/**` and `claude/**`, mints an App installation token from the `APP_ID` variable and `APP_PRIVATE_KEY` secret, and opens a PR for the branch if none is open. Every PR is therefore authored by `<app>[bot]`, which lets the BDFL approve it. Agents may edit the PR body. The BDFL's own changes take the same path.

## Path gates

`.github/CODEOWNERS` assigns gated paths to the BDFL. No catch-all pattern.

```
/VISION.md        @<bdfl>
/ROADMAP.md       @<bdfl>
/AGENTS.md        @<bdfl>
/CLAUDE.md        @<bdfl>
/docs/adr/        @<bdfl>
/docs/rfc/        @<bdfl>
/docs/milestones/ @<bdfl>
/.mandate/        @<bdfl>
/.github/         @<bdfl>
# profile entries follow
```

Default-branch ruleset, committed as JSON in `.github/rulesets/`:

- Pull request required; required approvals 0; review from code owners required.
- Required checks: `mandate-check`, `mandate-gate`, `ci` (project CI's aggregate job).
- Squash only; linear history; no force push; no deletion.
- Stale approvals dismissed on push.
- No bypass actors ([ADR-0015](../adr/0015-agent-prs-opened-by-app.md)).

Result: an agent PR touching a CODEOWNERS path waits for BDFL approval; any other PR merges on green.

Tag ruleset: creating, updating or deleting `v*` tags is refused to everyone except the owner's App, which is its only bypass actor (GitHub does not accept the Actions app as a bypass actor on repository rulesets). The release workflow pushes the tag with an App installation token.

## Semantic gates

Some gates are not paths: a breaking API change can land in any source file. The `mandate-gate` workflow runs on `pull_request` and `pull_request_review`, runs the profile's detectors, and:

- labels the PR `gate` and requests BDFL review when a detector fires;
- fails until the BDFL has approved the latest commit.

Detectors common to all profiles: a change to a released section of `CHANGELOG.md`; the `release` label.

## `mandate-check`

Run in CI on every PR:

- required files exist; front matter parses; status values are valid;
- ADR, RFC and milestone numbers are unique and contiguous;
- an accepted ADR's Decision section is unchanged unless the same PR supersedes it;
- `CLAUDE.md` imports `.mandate/agents.md` and `AGENTS.md`;
- `.mandate/agents.md` matches the pinned framework version;
- every required check in the committed ruleset JSON names a job that runs on every `pull_request` with no path or branch filter;
- an ADR's optional `revisit` is a date or a condition;
- a relative link in `docs/` resolves to a file in the repository; links to local paths (`file:`, `/`, `~`) fail;
- task issue templates give every Acceptance box a `Verify:`;
- every bullet under `Never` in the agent contract has a row in the rule ledger below;
- profile checks ([profiles](profiles.md)).

## Rule ledger

What holds each rule of the [agent contract](agents.md). Enforced: GitHub refuses the violation. Partial: refused for some runners or paths. Contract: only the contract asks.

| Rule | Mechanism | Status | Hole |
|---|---|---|---|
| Act as the BDFL | `agent-pr` opens PRs as the App; cloud proxies refuse ruleset and secret writes | Partial | A runner acting through the BDFL's account can approve a PR or, on the Mac, change rulesets ([ADR-0015](../adr/0015-agent-prs-opened-by-app.md)) |
| Push to the default branch, force-push a branch with an open PR, or rewrite published history | Default-branch ruleset: PR required, no force push, no deletion, no bypass | Partial | Force-pushing an agent branch with an open PR is not refused |
| Create tags or releases except through the release procedure | Tag ruleset: `v*` only by the App | Partial | A GitHub release on an existing tag is not refused |
| Weaken enforcement | CODEOWNERS on `.github/`, `.mandate/`, `AGENTS.md`, `CLAUDE.md`; App has no workflows permission; profile oracle paths | Partial | Tests outside oracle paths are ungated |
| Change another repository except by opening issues there | App installed only on Mandate repositories | Partial | Runners acting as the BDFL reach every repository he can |
| Delete issues, docs, or branches with open PRs | Docs change only by PR; App has no administration permission | Partial | Branch deletion is not refused |
| Gated paths merge only with BDFL approval | Code-owner review, stale approvals dismissed | Enforced | Approval from the BDFL's account by an agent acting as him |
| Semantic gates (API break, release, size) | `mandate-gate` required check | Enforced | Detectors cover only what they test for |
| An accepted ADR's Decision is never edited | `mandate-check` | Enforced | |
| One issue per PR, stay inside the milestone | | Contract | |

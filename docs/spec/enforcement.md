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

Without the workflows permission GitHub rejects any push from the App that changes `.github/workflows/`. Agent runners mint short-lived installation tokens; commits and PRs appear as `<app>[bot]`, which lets the BDFL approve them.

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
- Bypass: repository admin only, so the BDFL's own PRs merge without the self-approval GitHub forbids. The App has no bypass.

Result: an agent PR touching a CODEOWNERS path waits for BDFL approval; any other PR merges on green.

Tag ruleset: `v*` tags can be created only by the release workflow and the BDFL.

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
- profile checks ([profiles](profiles.md)).

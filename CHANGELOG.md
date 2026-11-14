# Changelog

## Unreleased

### Added
- Template CODEOWNERS and ruleset JSON in `template/.github/`.
- Spec draft: overview, artifacts, workflow, agent contract, enforcement, profiles, CLI.
- ADRs 0001 to 0013.
- Identity: 命 + mandate lockup, turquoise inlay colours, icons, social preview, `docs/brand.md`.
- MIT licence; the marks in `assets/brand/` are excluded.
- Template core files in `template/`.
- Design-session instructions for claude.ai projects in `template/.mandate/design-session.md`.
- `mandate check` (`bin/mandate-check`) and the `mandate-check` workflow in the template.
- `mandate-gate` (`bin/mandate-gate`) and its workflow in the template.
- `agent-pr` workflow in the template.
- Mandate runs under its own template: `.mandate/`, CODEOWNERS, rulesets, `mandate-check`, `mandate-gate`, `ci`, `agent-pr`.
- Profile additions in `profiles/tooling/` and `profiles/game/`.

### Changed
- Agent contract: finish before starting; `Handoff` comment when a session stops mid-issue; what counts as BDFL approval; block questions as cards, ungated ones default after 24 hours; never weaken a check, block instead; two fix attempts plus one infra rerun; at most three open gates, each opening with a decision card and kept mergeable.
- `mandate next` picks own red PRs, then unmergeable gates, then the issue that unblocks most.
- Labels: `bdfl` folded into `blocked`. Branch names are free; issues link by `Closes #N`.
- Milestones carry an `appetite`; Risks is written as a pre-mortem. The BDFL pulls `triage` issues in by setting their milestone.
- Profiles gate oracle paths; `mandate-gate` fails gated PRs over 400 lines unless labeled `large`.
- Spec: `v*` tags are pushed by the release workflow with an App token; the App is the tag ruleset's only bypass.
- Spec: required checks must run on every PR; project CI exposes one aggregate `ci` job.
- Spec: agents keep taking issues after reporting; idle active projects are reported stalled.
- Agents push branches; the `agent-pr` workflow opens PRs as the App. Rulesets have no bypass (ADR-0015, supersedes ADR-0013).
- Identity: ink olive ground (`#191a15`, light `#dee0d6`); the word takes the text colour, so 命 is the only colour in the lockup; dark 命 is `#2fa89a`.

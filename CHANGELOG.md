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
- Profile additions in `profiles/tooling/` and `profiles/game/`.

### Changed
- Spec: `v*` tags are pushed by the release workflow with an App token; the App is the tag ruleset's only bypass.
- Spec: required checks must run on every PR; project CI exposes one aggregate `ci` job.
- Spec: agents keep taking issues after reporting; idle active projects are reported stalled.
- Agents push branches; the `agent-pr` workflow opens PRs as the App. Rulesets have no bypass (ADR-0015, supersedes ADR-0013).

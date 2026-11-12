# Changelog

## Unreleased

### Added
- Spec draft: overview, artifacts, workflow, agent contract, enforcement, profiles, CLI.
- ADRs 0001 to 0013.
- Identity: 命 + mandate lockup, turquoise inlay colours, icons, social preview, `docs/brand.md`.
- MIT licence; the marks in `assets/brand/` are excluded.
- Template core files in `template/`.

### Changed
- Spec: required checks must run on every PR; project CI exposes one aggregate `ci` job.
- Spec: agents keep taking issues after reporting; idle active projects are reported stalled.
- Agents push branches; the `agent-pr` workflow opens PRs as the App. Rulesets have no bypass (ADR-0015, supersedes ADR-0013).

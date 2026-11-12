---
id: 002
title: Template
status: active
---
## Goal
A repository template that encodes the spec, with its enforcement verified on a scratch repository.

## Scope
- Verification on a scratch repository, each result recorded in the issue that tested it:
  - code-owner review with zero required approvals blocks an App PR touching a CODEOWNERS path, and lets other PRs merge;
  - `mandate-gate` re-runs on `pull_request_review` and passes once the BDFL approves the latest commit;
  - a tag ruleset limits `v*` to the release workflow and the BDFL;
  - an App without the workflows permission is refused pushes to `.github/workflows/`.
- An ADR fixing where the template lives (a directory in this repository or a separate template repository).
- Template files for the core: `VISION.md`, `ROADMAP.md`, `AGENTS.md`, `CLAUDE.md`, `README.md`, `CHANGELOG.md`, `docs/architecture.md`, ADR, RFC and milestone templates, `.mandate/agents.md`, `.mandate/version`.
- Profile additions for tooling and game: CODEOWNERS entries, `VISION.md` section names, profile `AGENTS.md` notes.
- `.github/CODEOWNERS` with no catch-all, and ruleset definitions as JSON importable through the GitHub API.
- `mandate-check` and `mandate-gate` workflows implementing `docs/spec/enforcement.md`, with tests.
- claude.ai project instructions requiring the handoff ending from `workflow.md`.
- Bootstrap of a new repository (initial commit, labels, topic) stated in the spec.
- This repository adopts the template: `.mandate/agents.md` replaces the `docs/spec/agents.md` stand-in, CODEOWNERS and rulesets applied.

## Out of scope
- The CLI. Template files are applied by hand or by `gh` in this milestone.
- Creating the GitHub Apps and storing their keys: `bdfl` tasks, with key storage and token minting in infra.
- Pilots on yan, db or animal-spirits projects.

## Acceptance
- Every verification item passes on the scratch repository, or the spec is amended by ADR where GitHub behaves differently.
- A new repository created from the template passes `mandate-check` and enforces the gated paths.
- This repository runs under its own template: an agent PR touching a gated path cannot merge without BDFL approval.

## Risks
- GitHub may not re-run a required check on review events in a way that satisfies branch rules; `mandate-gate` may need a different trigger.
- The scratch repository needs the zaofang App, which waits on the BDFL.

## Review

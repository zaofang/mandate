---
id: 002
title: Template
status: done
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

### Shipped
- Enforcement verified on `zaofang/mandate-scratch` (#7 to #10), results recorded in each issue.
- ADR-0014 (template is a directory), ADR-0015 (agent PRs opened by the App, no bypass; supersedes ADR-0013), ADR-0016 (yq).
- `template/`: core files, `.mandate/agents.md`, ADR, RFC and milestone templates, CODEOWNERS and ruleset JSON, `mandate-check`, `mandate-gate`, `ci` and `agent-pr` workflows.
- Profile additions in `profiles/tooling/` and `profiles/game/`.
- `mandate-check` and `mandate-gate` in `bin/`, with tests.
- Design-session instructions in `template/.mandate/design-session.md`.
- Spec: repository bootstrap, liveness and the stalled flag, required checks on every PR, App-pushed `v*` tags.
- This repository runs under its own template (#55). `APP_ID`, `APP_PRIVATE_KEY` and the `main` and `tags` rulesets were applied on 2026-11-13.

### Deviations
- #16 moved to milestone 003: the instructions shipped, but no real design session has used them yet. Closed early by BDFL decision.
- #24, #25 and #26 were added mid-milestone from the ceteris and yan feedback (BDFL decision, 2026-11-12).
- No fresh repository was created from the template. Mandate's own adoption (#55, `mandate-check` green) stands in for "a new repository created from the template"; `mandate init` will exercise it.
- `v*` tags: GitHub refuses the Actions app as a bypass actor on an org repository ruleset (#9). The zaofang-agent App is the only bypass and the release workflow pushes tags with an App token; the BDFL has no direct tag push.
- `mandate-gate` cannot clear by its own new run on review: each run is its own check suite, so it re-runs the latest failed gate run for the head SHA (#8, #15).
- #55 merged from the BDFL's account before the App key and rulesets were set, with the red `agent-pr` check ignored once (BDFL decision).
- The scratch rulesets require only `mandate-gate`; this repository also requires `ci` and `mandate-check`.

### Process notes
- The App key lives only on the BDFL's Mac, so App setup waits on the BDFL being at that machine. Agent sessions there are blocked from writing secrets and rulesets without an explicit approval naming the action and target.
- A PR opened from the BDFL's account cannot be approved by the BDFL. Agent PRs must go through `agent-pr` once the App is set; before that, a gated PR cannot satisfy code-owner review.
- Triage carried forward: #18 and #27 to #42, mostly spec amendments from the yan and ceteris feedback.


---
id: 001
title: Spec
status: done
---
## Goal
A normative spec the BDFL approves as the basis for the template and CLI.

## Scope
- `docs/spec/`: overview, artifacts, workflow, agents, enforcement, profiles, cli.
- ADRs recording the founding design session's decisions.
- This repository's own `VISION.md`, `ROADMAP.md`, `AGENTS.md`, `CLAUDE.md`, `docs/architecture.md`.
- Identity, decided in the design session: `docs/brand.md`, `assets/brand/`.

## Out of scope
- Template files, CLI code, GitHub App and ruleset setup.

## Acceptance
- The BDFL approves the PR.
- Every open decision is resolved in the spec (recorded below).
- ADR-0012 and ADR-0013 reviewed specifically: they were proposed by the agent, not decided in the design session.

## Decisions taken during the milestone
Name: Mandate (`mandate`). Weekly digest as an issue in the Mandate repository; GitHub Mobile for block pushes; bash 5; only breaking public API changes gated. Repository description: "A project management framework for agent-built software." Social preview carries no tagline.

## Risks
- The spec assumes GitHub behaviour not yet tested here: code-owner review with zero required approvals, `mandate-gate` re-running on review events, tag rulesets for the release workflow. Verified in the template milestone on a scratch repo.

## Review

### Shipped
- Spec: `docs/spec/` overview, artifacts, workflow, agents, enforcement, profiles, cli.
- ADRs 0001 to 0013.
- `VISION.md`, `ROADMAP.md`, `AGENTS.md`, `CLAUDE.md`, `README.md`, `CHANGELOG.md`, `docs/architecture.md`.
- Identity: `docs/brand.md`, `assets/brand/`.
- Labels from `workflow.md`.
- `LICENSE` (MIT).

### Deviations
- Identity was added to scope mid-milestone, in the design session.
- No GitHub milestone or task issues: the scope arrived as one handoff bundle and merged as one PR (#1). There was nothing to decompose.
- PR #1 was opened and merged from the BDFL's account, not an agent identity. No App exists yet (milestone 002).
- The licence was not decided in the design session; MIT was chosen at close-out.
- The BDFL handle is `amteb` (renamed from `atbraz`); CODEOWNERS in milestone 002 uses it.

### Process notes
- The handoff flow assumes the repository exists. Bootstrapping a new repository (initial commit on `main`, labels, topic) is not in the spec; `mandate init` will own it, but the template milestone should state it.
- Agent sessions without the App cannot set the repository topic (no administration access, by design). `mandate init` either runs as the BDFL or leaves the topic as a `bdfl` task.
- Agent sessions may be pinned to a branch name by their runner; the `agent/<issue>-<slug>` convention needs either runner support or an allowed alternative.

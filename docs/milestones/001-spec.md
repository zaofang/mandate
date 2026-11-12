---
id: 001
title: Spec
status: active
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

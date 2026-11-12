---
id: 0004
title: Vision, ADRs, milestone scope, public API, dependencies and releases require BDFL approval
status: accepted
date: 2026-11-10
---
## Context
Agents may auto-merge. Some decisions are too consequential or too much a matter of intent to delegate.

## Decision
These changes merge only with BDFL approval: vision and non-goals; architecture decisions; milestone scope; public API; dependencies; releases. Everything else agents decide.

## Consequences
Files that define the rules or enforce them (`AGENTS.md`, `CLAUDE.md`, `.mandate/`, `.github/`) are gated too, or agents could unpick the gates. Agents need a way to propose gated changes without blocking: they draft them as separate PRs and move on.

## Alternatives
Fewer gates (agents could redirect a project). Gating every PR (the BDFL becomes the bottleneck).

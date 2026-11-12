---
id: 0003
title: The repository holds design state; GitHub Issues hold work
status: accepted
date: 2026-11-10
---
## Context
Agents read files natively; GitHub's tracker gives assignment, milestones, notifications and a phone UI.

## Decision
Vision, roadmap, ADRs, RFCs, milestone scope and reviews are markdown in the repository. Tasks, claims, blocks and milestone progress are GitHub Issues and Milestones.

## Consequences
Milestone scope exists twice: the file (approved) and the GitHub milestone (executed). The file wins; close-out compares them. The Obsidian vault is not a source of truth.

## Alternatives
Repo only (no notifications or mobile triage). Issues only (decisions buried in threads). Obsidian (invisible to agents and CI).

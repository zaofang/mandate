---
id: 0013
title: Gates are enforced by CODEOWNERS, rulesets and a gate check
status: superseded by 0015
date: 2026-11-10
---
## Context
Agents auto-merge, so a gate that relies on agents following instructions is not a gate.

## Decision
CODEOWNERS assigns gated paths to the BDFL; the default-branch ruleset requires code-owner review with zero general approvals, admin-only bypass. The `mandate-gate` required check covers gates that are not paths (breaking API changes, releases) and fails until the BDFL approves.

## Consequences
Ungated PRs merge on green with no human. The BDFL's own gated PRs merge through admin bypass. `mandate-gate` behaviour on review events must be verified on a scratch repo before relying on it.

## Alternatives
Labels and contract only (unenforced). Require approval on every PR (gates everything).

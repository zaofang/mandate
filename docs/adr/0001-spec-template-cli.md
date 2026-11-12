---
id: 0001
title: Deliver Mandate as a spec, a template repository and a CLI
status: accepted
date: 2026-11-10
---
## Context
Projects need a repeatable structure that agents can follow and the BDFL can rely on.

## Decision
Mandate consists of a normative spec, a template repository that encodes it, and a CLI that scaffolds and maintains project state. Built in that order.

## Consequences
The spec is the source of truth; template and CLI must conform to it. Three things to keep in sync.

## Alternatives
Spec only (applied by hand, drifts). Template only (conventions undocumented). Spec then template, no CLI (repetitive `gh` work left to agents).

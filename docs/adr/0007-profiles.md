---
id: 0007
title: One core with tooling and game profiles
status: accepted
date: 2026-11-10
---
## Context
zaofang projects are spec-driven Rust tools; animal-spirits projects are design-driven games judged partly by feel.

## Decision
Lifecycle, artifacts, gates and the agent contract are shared. A profile adds gated paths, detectors and acceptance rules.

## Consequences
New project kinds become new profiles, not forks.

## Alternatives
One undifferentiated framework (games lack playtest acceptance; tools lack API detection). Separate frameworks (duplicate maintenance).

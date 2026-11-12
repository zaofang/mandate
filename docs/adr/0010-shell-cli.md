---
id: 0010
title: The CLI is bash 5 over git, gh and jq
status: accepted
date: 2026-11-10
---
## Context
Most CLI work is calling `gh` and editing small text files.

## Decision
Mandate commands are bash 5 scripts, one per command, dispatched git-style.

## Consequences
No build step. macOS needs bash from Nix or Homebrew; its stock 3.2 is unsupported. Logic that outgrows shell is a signal to split the command, not to rewrite.

## Alternatives
POSIX sh (portable, no arrays). Rust (consistent with zaofang, heavy for glue). Python with uv (adds a runtime).

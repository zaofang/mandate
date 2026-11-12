---
id: 0012
title: Agents act as a private GitHub App per owner
status: accepted
date: 2026-11-10
---
## Context
GitHub forbids approving your own PR. If agents pushed as the BDFL, he could not approve their gated PRs, and gates could not be enforced.

## Decision
Each owner (zaofang, animal-spirits, the BDFL's account) has a private GitHub App with contents, pull request and issue write access, and no workflows or administration access. Agent runners use its installation tokens.

## Consequences
Agent work is attributable to `<app>[bot]`. Agents cannot change workflows even by mistake. Key storage and token minting live in infra.

## Alternatives
Machine user account (a second account to secure; long-lived token). One public App across owners (installable by anyone).

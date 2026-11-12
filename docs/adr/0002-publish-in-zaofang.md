---
id: 0002
title: Publish Mandate in the zaofang organization
status: accepted
date: 2026-11-10
---
## Context
Mandate governs projects in zaofang and animal-spirits, all open source. Private infrastructure lives in the BDFL's private infra repo.

## Decision
Mandate is a public repository in zaofang.

## Consequences
Nothing in Mandate may contain secrets, private hostnames or infra details. Runner and host setup stay in infra.

## Alternatives
Private infra repo (hides a reusable tool). Spec private, template public (splits one project across two repos).

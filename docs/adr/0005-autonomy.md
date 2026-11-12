---
id: 0005
title: Agents run unattended within an approved milestone and pause at its end
status: accepted
date: 2026-11-10
---
## Context
Agents should work without the BDFL starting sessions, but milestone scope is gated.

## Decision
Agents pull work continuously within the active milestone. When it is done they open a close-out PR containing the review and the next proposal, then pause that project until the BDFL merges it. Other projects keep running.

## Consequences
BDFL attention is spent at milestone boundaries and on blocks. Milestones must be sized so a pause is cheap. Starting and scheduling sessions belongs to infra.

## Alternatives
BDFL starts every session (defeats unattended work). A queue of pre-approved milestones (approves scope before the previous milestone's lessons exist). Agents self-approving small milestones (scope drift).

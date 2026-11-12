---
id: 0009
title: Report through review requests, push on block, and a periodic digest
status: accepted
date: 2026-11-10
---
## Context
The BDFL is not watching agents and needs to know when something waits on him.

## Decision
Gated PRs request the BDFL's review. Blocks assign the issue to him. Both push through GitHub Mobile. A weekly digest issue in the Mandate repository summarizes every project.

## Consequences
No notification infrastructure beyond GitHub. Block pushes compete with other GitHub notifications.

## Alternatives
ntfy or Pushover for blocks (separate channel, extra infrastructure). Daily digest (redundant with immediate pushes). Email or Obsidian delivery (Obsidian depends on the logging connector project).

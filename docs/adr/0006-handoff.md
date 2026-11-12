---
id: 0006
title: Design sessions hand off complete documents that are committed as gated PRs
status: accepted
date: 2026-11-10
---
## Context
Vision and architecture are often worked out in claude.ai chats, which agents cannot see.

## Decision
A design session ends with complete documents in Mandate formats. They reach the repo through a `handoff` issue (agents commit them verbatim) or `mandate handoff`, always as a gated PR.

## Consequences
Chat history is never a source of truth. The template ships claude.ai project instructions that enforce the ending.

## Alternatives
Manual copying with no format (lossy, inconsistent). Doing all design in Claude Code (loses phone-friendly chat design).

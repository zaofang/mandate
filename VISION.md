---
name: mandate
profile: tooling
status: active
---
# Mandate 命

## Premise
One architect, many repositories, AI agents doing the execution. Without a fixed process, project state lives in chat history and decisions get remade. Mandate fixes where state lives, who decides what, and how work flows, so agents run unattended and the architect steps in only at gates.

## Goals
- Every zaofang and animal-spirits project is started, run and released under one process.
- Agents work unattended between gates.
- The BDFL can see every project's state and pending decisions from a phone.
- Every consequential decision is recorded once, in the repository it governs.

## Non-goals
- Teams, permission models, or roles beyond BDFL and agent.
- Running agents: scheduling, hosting and sandboxing belong to infra.
- A general product for others. Published openly, built for one user.
- Estimates, velocity, burndown.

## Success criteria
- A new project goes from idea to an approved first milestone in one design session and one handoff.
- Over a month of operation, no gated change merges without BDFL approval.
- The BDFL never reconstructs project state from chat history.
- Gate turnaround is limited by the BDFL's availability, not by missing context in the PR.

## Principles
- Files over tools: state is plain text in git; GitHub is the work queue, not the record.
- Gates are enforced by GitHub, not by trust.
- The least ceremony that keeps agents safe and the BDFL informed.
- Small commands over `git` and `gh`.

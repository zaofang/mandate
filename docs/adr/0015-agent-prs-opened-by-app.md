---
id: 0015
title: Agent PRs are opened by the App; rulesets have no bypass
status: accepted
date: 2026-11-12
---
## Context
claude.ai sessions, the main agent runner, act on GitHub through the BDFL's own connection and cannot use App tokens. Their PRs were authored by the BDFL's account, so the BDFL could not approve them as code owner, and the admin bypass of ADR-0013 reached every agent holding his token. No check can tell the BDFL's actions from an agent's when both use one account.

## Decision
CODEOWNERS assigns gated paths to the BDFL; the default-branch ruleset requires code-owner review with zero general approvals, dismisses stale approvals on push, and has no bypass actors. The `mandate-gate` required check covers gates that are not paths and fails until the BDFL approves.

Agents push branches and never open PRs. The `agent-pr` workflow opens a PR for every push to an agent branch, authenticated as the owner's App (ADR-0012) with its key held as an Actions secret, so every agent PR is authored by `<app>[bot]` and the BDFL can approve it. The BDFL's own changes take the same path. Agents never submit reviews.

## Consequences
Gates hold for runners that act as the BDFL, verified on a scratch repository on 2026-11-12 (#7). Admin bypass is gone, so the BDFL's own gated changes also need his approval on an App-opened PR. Remaining holes are contract-only: an agent acting as the BDFL could approve a PR or edit rulesets; cloud runners are refused ruleset writes by their proxy. The App key is stored in each repository's Actions secrets, set by the BDFL.

## Alternatives
Admin-only bypass (ADR-0013; reaches agents using the BDFL's token). A guard check on the BDFL's review (cannot tell the BDFL from an agent, and he cannot approve his own account's PRs). App-only runners (excludes claude.ai sessions).

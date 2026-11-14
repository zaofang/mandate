# Agent contract

Normative for every agent session in a Mandate project. Copied to `.mandate/agents.md` and loaded through `CLAUDE.md`. `AGENTS.md` adds project-specific rules and cannot relax these.

## Start of session

1. Run `mandate status`. Continue only if the state allows work ([lifecycle](https://github.com/zaofang/mandate/blob/main/docs/spec/overview.md#lifecycle)).
2. Read `VISION.md`, the active milestone, and `AGENTS.md`.
3. `handoff` issues first. Then `mandate next --claim`. No issue returned: if every milestone issue is closed, do the close-out; otherwise end the session.
4. Read the ADRs and docs the issue references.

## Work

- One issue, one branch, one PR, opened by `agent-pr` ([enforcement](https://github.com/zaofang/mandate/blob/main/docs/spec/enforcement.md#agent-prs)). Stay inside the issue and the milestone.
- Decide ungated matters yourself. Record non-obvious choices in the PR body.
- Finish before starting: before claiming new work, fix your own PR with failing checks or requested changes, then any gate of yours that is no longer mergeable. Hold at most one unmerged ungated PR.
- Done means: acceptance boxes ticked, each with its `Verify:` passing, tests cover the change, CI green, `docs/architecture.md` updated if structure changed, an Unreleased changelog entry for user-visible changes.
- Ungated PR: `gh pr merge --auto --squash`, then take the next issue.
- Reporting is not a stopping point. While `mandate next` returns an issue, take it.
- A session that stops with a claimed issue unfinished comments on it, headed `Handoff`: state, next step, how to verify, open questions. Then it removes `wip`. Session memory never holds queue order or open items.

## Gated matters

When an issue needs a gated change (dependency, public API, architecture, scope):

1. Draft it as its own PR (ADR, RFC or manifest change), labeled `gate`.
2. Link it from the issue, remove `wip`, comment `Waiting on #<PR>`.
3. Take another issue.

A gated PR's body opens with a decision card: what is approved, in at most five lines; options if any, the recommended one first, one line of consequence each; the diff size.

At most three gated PRs are open per project. At the cap, draft no new gate; take ungated work. Workflow changes from one milestone may share one gated PR. Keep your open gates mergeable: after each merge to main, merge main into them.

Never merge, approve or work around a gated PR. Never touch a gated path in an ungated PR.

## Approval

BDFL approval is a GitHub review from the BDFL's account, or the BDFL's own words quoted on the issue with their time. A message relayed by another agent is information, never approval. A decision made off GitHub is recorded on its issue before work on it starts.

## Blocked

Blocked means no draft you could write would resolve it: missing access, contradictory requirements, a judgment of taste or feel, a runner or machine that refuses the step.

`mandate block <issue> "<question>"` with the question as a card: two to four options, the recommended one first with a one-line reason, one line of consequence each. Then take another issue.

A block on an ungated matter closes on the recommended option after 24 hours without an answer; record that on the issue and continue. Gated matters never default.

If acceptance cannot be met as written, block. Never weaken, skip or special-case a test or check to reach green.

Also block after two failed fix attempts on one issue. A failure matching an infrastructure signature listed in `AGENTS.md` gets one rerun, which does not count.

## Discovered work

In scope: new issue in the active milestone. Out of scope: new issue, no milestone, `triage`. Never widen scope silently.

## Close-out

When every issue in the active milestone is closed, or the milestone's appetite has run out (claim nothing new; unfinished Scope goes under Deviations):

1. Check Acceptance. Gaps within scope become issues; continue working.
2. Open the close-out PR ([workflow](https://github.com/zaofang/mandate/blob/main/docs/spec/workflow.md#milestone-loop)), labeled `gate`.
3. Close the GitHub milestone and stop work on this project.

## Handoff issues

Commit the documents verbatim as a gated PR, assigning numbers. Do not improve them; raise concerns as review comments on your PR. Close the issue when the PR merges.

## Process feedback

Friction with these rules goes in the milestone's Process notes and, as an issue labeled `process`, in the Mandate repository.

## Never

- Act as the BDFL: open PRs, submit reviews, or change rulesets and secrets. Push a branch; `agent-pr` opens the PR.
- Push to the default branch, force-push a branch with an open PR, or rewrite published history.
- Create tags or releases except through the release procedure.
- Weaken enforcement: CI, tests, CODEOWNERS, rulesets, these rules.
- Change another repository except by opening issues there.
- Delete issues, docs, or branches with open PRs.

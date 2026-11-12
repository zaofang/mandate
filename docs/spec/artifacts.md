# Artifacts

Every project repository carries the files below. Front matter is YAML. Numbers are zero-padded and assigned by `mandate`.

## Layout

| Path | Gated | Purpose |
|---|---|---|
| `VISION.md` | yes | Premise, goals, non-goals, success criteria, principles; profile and status |
| `ROADMAP.md` | yes | Future intent only |
| `AGENTS.md` | yes | Project-specific agent instructions: commands, conventions, local rules |
| `CLAUDE.md` | yes | Imports only: `@.mandate/agents.md` then `@AGENTS.md` |
| `README.md` | no | Public description |
| `CHANGELOG.md` | Unreleased: no; released sections: via release PR | Keep a Changelog format |
| `docs/architecture.md` | no | Current structure; must agree with accepted ADRs |
| `docs/adr/NNNN-slug.md` | yes | One decision each |
| `docs/rfc/NNNN-slug.md` | yes | Proposals larger than one decision |
| `docs/milestones/NNN-slug.md` | yes | Scope and review of one milestone |
| `.mandate/agents.md` | yes | Framework agent contract at the pinned version; managed by `mandate sync` |
| `.mandate/version` | yes | Pinned framework version |
| `.mandate/templates/` | yes | ADR, RFC, milestone and task issue templates used by `mandate`; managed by `mandate sync` |
| `.github/` | yes | CODEOWNERS, workflows |

Profiles add paths ([profiles](profiles.md)).

`CLAUDE.md` imports `AGENTS.md` instead of relying on Claude Code's native `AGENTS.md` loading, which skips the first session after an upgrade.

## VISION.md

```markdown
---
name: <project>
profile: tooling | game
status: inception | active | maintenance | archived
---
# <Project>

## Premise
What it is and why it should exist. One paragraph.

## Goals
## Non-goals
## Success criteria
Observable outcomes that would mean the project worked.

## Principles
Three to five constraints that settle trade-offs. The game profile names this section Pillars.
```

## ROADMAP.md

```markdown
# Roadmap

Future intent. Past and current milestones are in docs/milestones/.

## Next
- <theme>: <one line>

## Later
- <theme>: <one line>
```

## ADR

```markdown
---
id: NNNN
title: <the decision, stated>
status: accepted | superseded by NNNN
date: YYYY-MM-DD
---
## Context
## Decision
## Consequences
## Alternatives
```

- Merged means accepted. A rejected proposal stays a closed PR.
- An accepted ADR's Decision is never edited; a new ADR supersedes it, and the old one's status changes in the same PR.
- `docs/architecture.md` is updated in the same PR when the decision changes structure.

## RFC

Required when a change spans more than one milestone, replaces several ADRs, or adds a subsystem or repository. Otherwise write an ADR.

```markdown
---
id: NNNN
title: <short>
status: accepted | withdrawn
date: YYYY-MM-DD
---
## Summary
## Motivation
## Design
## Drawbacks
## Alternatives
## Unresolved questions
## Plan
ADRs and roadmap entries this RFC produces.
```

## Milestone

One coherent increment the BDFL can evaluate in one sitting, typically 5 to 20 issues.

```markdown
---
id: NNN
title: <short>
status: active | done
---
## Goal
One sentence.

## Scope
Deliverables, each verifiable.

## Out of scope

## Acceptance
How the BDFL judges it done.

## Risks

## Review
Filled at close-out.

### Shipped
### Deviations
### Process notes
```

A proposal is a milestone file in an open PR. Merging it makes it active.

## Task issue

```markdown
## Goal
## Acceptance
- [ ] <checkable>
## Constraints
## Refs
Milestone, ADRs. `Depends on #N` lines are honored by `mandate next`.
```

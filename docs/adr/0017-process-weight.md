---
id: 0017
title: No RFCs; flow is measured from GitHub events, never estimated
status: accepted
date: 2026-11-14
---
## Context
ADR-0008 set moderate weight: RFCs for multi-milestone changes, ADRs for single decisions, no estimates or velocity tracking. No RFC has been written; ADRs and milestone proposals carried every change so far. The research pass of 2026-11-14 found that the BDFL's review time is the constraint and that impressions of agent speed are unreliable, so the process needs flow figures without asking anyone to estimate.

## Decision
ADRs record single decisions. A milestone proposal records scope. A change spanning several milestones is a `ROADMAP.md` entry plus the ADRs it needs. There is no RFC artifact.

Each milestone close carries a review and process notes. No phase gates beyond milestones.

Nobody enters estimates, points or velocity. Flow figures (cycle time, gate wait, throughput, rework) are computed from GitHub events only.

## Consequences
`docs/rfc/`, its template, its CODEOWNERS line and `mandate rfc new` are removed. ADR-0003's mention of RFCs is historical. The VISION non-goal is reworded to match. Reporting may add computed flow figures without a further ADR.

## Alternatives
Keep RFCs unused until needed (an unexercised format drifts from the rest). Keep "no velocity tracking" literally (rules out measuring where the BDFL's time goes).

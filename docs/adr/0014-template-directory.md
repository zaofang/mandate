---
id: 0014
title: The template is a directory in the Mandate repository
status: accepted
date: 2026-11-12
---
## Context
ADR-0001 makes the template one of Mandate's three parts without fixing where it lives. `mandate init` and `mandate sync` apply it at the version pinned in `.mandate/version`, so the template must be versioned with the spec and the contract it encodes.

## Decision
The template is `template/` in this repository, laid out as a project root. `mandate init` copies it at a released tag; `mandate sync` reapplies its managed files at the pinned tag. No separate template repository.

## Consequences
Spec, contract, template and CLI share one version and one release. GitHub's "Use this template" button is unavailable; projects start with `mandate init`, or by copying `template/` by hand until the CLI ships. `template/.github/` is gated like `.github/`.

## Alternatives
A separate GitHub template repository (second repository to version and release in step; needs an RFC under artifacts.md). Template on a branch of this repository (invisible to readers, awkward to diff).

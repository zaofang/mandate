# AGENTS.md

Project-specific instructions for Mandate. The framework contract is `.mandate/agents.md`, loaded through `CLAUDE.md`.

- `docs/spec/` is normative and gated. Spec changes need an ADR when they change a decision recorded in one.
- Keep the spec terse: rules and formats, no rationale. Rationale belongs in ADRs.
- `template/.mandate/agents.md` is `docs/spec/agents.md` with spec links made absolute; change both in the same PR. `ci` checks it.
- This repository checks itself against `template/`, not a release (`MANDATE_SOURCE=.`).
- Shell scripts pass `shellcheck`; `bin/` changes come with cases in `tests/`.

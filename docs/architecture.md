# Architecture

| Part | Location | State |
|---|---|---|
| Spec | `docs/spec/` | draft, milestone 001 |
| Template | `template/` ([ADR-0014](adr/0014-template-directory.md)), profile additions in `profiles/<profile>/` | core files, CODEOWNERS, rulesets, profiles; workflows pending |
| CLI | `bin/mandate`, `bin/mandate-<cmd>` | `mandate-check` only; tests in `tests/` |
| Brand | `docs/brand.md`, `assets/brand/` | done, milestone 001 |

Spec files:

| File | Covers |
|---|---|
| `overview.md` | Roles, authority, gated paths, lifecycle |
| `artifacts.md` | Repository layout and document formats |
| `workflow.md` | Milestone loop, labels, PRs, releases, handoff, reporting |
| `agents.md` | Agent contract; becomes `.mandate/agents.md` in projects |
| `enforcement.md` | Agent identity, CODEOWNERS, rulesets, `mandate-gate`, `mandate-check` |
| `profiles.md` | tooling and game additions |
| `cli.md` | Commands |

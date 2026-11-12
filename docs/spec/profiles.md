# Profiles

The core applies to every project. A profile, set in `VISION.md`, adds gated paths, detectors and acceptance rules.

## tooling

For zaofang projects. Rust unless an ADR says otherwise.

| Concern | Rule |
|---|---|
| Normative specs | `docs/spec/` gated by CODEOWNERS (language, format and protocol specs are API) |
| Dependencies | every `Cargo.toml` and `flake.nix` gated by CODEOWNERS; lockfiles ungated |
| Public API | `mandate-gate` runs `cargo semver-checks` against the last release of each published crate; a breaking change gates the PR. Additive changes within milestone scope are ungated |
| Acceptance | tests and checks named in the milestone; the BDFL reads the Review |

Gating `Cargo.toml` also gates new workspace members and version bumps, both of which are architecture or release decisions anyway.

## game

For animal-spirits projects.

| Concern | Rule |
|---|---|
| Vision | `VISION.md` names Principles as Pillars |
| Design docs | `docs/design/` ungated; contradicting a pillar requires an ADR |
| Contracts | save format, mod or scripting API, data schemas: paths listed in `AGENTS.md` and CODEOWNERS at init |
| Dependencies | engine and package manifests, listed at init, gated by CODEOWNERS |
| Assets | every asset carries a REUSE license record; `mandate-check` fails on unlicensed files |
| Acceptance | milestone Acceptance includes a playable build; the close-out PR links it; the BDFL playtests before approving and the Review records playtest notes |
| Taste | feel, art direction and tuning targets are `bdfl` tasks or `blocked` questions with options, never agent decisions |

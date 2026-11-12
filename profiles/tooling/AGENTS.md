
## Profile: tooling

- `docs/spec/` is normative and gated; spec changes that alter an ADR's decision need a new ADR.
- Every `Cargo.toml` and `flake.nix` is gated: dependencies, workspace members and version bumps. Lockfiles are not.
- Breaking public API changes are gated by `cargo semver-checks` in `mandate-gate`; additive changes within scope are not.

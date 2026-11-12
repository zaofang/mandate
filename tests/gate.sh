#!/usr/bin/env bash
# Tests for the detectors in bin/mandate-gate, with gh stubbed: labels from $LABELS, no reviews.
set -uo pipefail

root=$(cd "$(dirname "$0")/.." && pwd)
failures=0
stub=$(mktemp -d)
cat >"$stub/gh" <<'SH'
#!/usr/bin/env bash
[[ $1 == pr && $2 == view ]] && printf '%s\n' ${LABELS:-}
exit 0
SH
chmod +x "$stub/gh"
export PATH=$stub:$PATH GITHUB_REPOSITORY=o/r GITHUB_EVENT_NAME=pull_request PR=1 HEAD_SHA=abc BASE_REF=base

commit() { git -C "$dir" add -A && git -C "$dir" -c user.name=t -c user.email=t@t commit -qm "$1"; }

project() {
  dir=$(mktemp -d)
  cp -R "$root/template/." "$dir"
  printf '\n## [0.1.0] - 2026-11-12\n\n### Added\n- First.\n' >>"$dir/CHANGELOG.md"
  git -C "$dir" init -q && commit base && git -C "$dir" branch -q base
}

expect() { # expect gated|open name
  local want=$1 name=$2 got
  (cd "$dir" && bash "$root/bin/mandate-gate" >/dev/null 2>&1) && got=open || got=gated
  if [[ $got == "$want" ]]; then echo "ok   $name"; else echo "FAIL $name: expected $want, got $got"; failures=$((failures + 1)); fi
  rm -rf "$dir"
}

project; echo x >"$dir/README.md"; commit change; expect open "ordinary change"
project; sed -i 's/^## Unreleased$/## Unreleased\n\n### Added\n- New./' "$dir/CHANGELOG.md"; commit change; expect open "Unreleased entry"
project; sed -i 's/^- First\.$/- First, reworded./' "$dir/CHANGELOG.md"; commit change; expect gated "released section edited"
project; echo x >"$dir/README.md"; commit change; LABELS=release expect gated "release label"
project; echo x >"$dir/README.md"; commit change; LABELS="bug gate" expect gated "gate label"

rm -rf "$stub"
exit $((failures > 0))

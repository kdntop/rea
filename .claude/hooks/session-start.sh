#!/bin/bash
# Install locked dependencies for Claude Code cloud sessions so tests,
# typecheck, and lint work immediately. Local sessions are left untouched.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel)}"

# Skip reinstall when node_modules already matches package-lock.json
# (the container is cached after this hook completes).
if [ -f node_modules/.package-lock.json ] \
  && node scripts/check-dependency-install.mjs >/dev/null 2>&1; then
  echo "Dependencies already match package-lock.json."
else
  npm install --no-audit --no-fund
fi

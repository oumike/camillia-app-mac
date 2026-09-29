#!/usr/bin/env bash
# Builds the core submodule and places the static lib and Swift bindings in Generated/.
# Usage: scripts/build-core.sh [debug|release]
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
if [[ ! -f "$ROOT/core/Cargo.toml" ]]; then
  git -C "$ROOT" submodule update --init
fi
"$ROOT/core/scripts/build-apple.sh" "$ROOT/Generated" "${1:-release}"

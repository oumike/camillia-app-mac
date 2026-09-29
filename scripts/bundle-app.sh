#!/usr/bin/env bash
# Builds core + app in release and wraps the binary in build/Camillia.app.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
scripts/build-core.sh release
swift build -c release
APP="build/Camillia.app"
rm -rf "$APP"
mkdir -p "$APP/Contents/MacOS"
cp "$(swift build -c release --show-bin-path)/CamilliaMac" "$APP/Contents/MacOS/Camillia"
cp Resources/Info.plist "$APP/Contents/Info.plist"
codesign --force --sign - "$APP"
echo "Built $APP"

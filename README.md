# camillia-app-mac

SwiftUI macOS app for Camillia. Logic lives in [camillia-app-core](https://github.com/oumike/camillia-app-core),
included as a git submodule at `core/` and called through UniFFI-generated Swift bindings.

## Requirements

- macOS 14+
- Swift 5.10+ (Xcode or Command Line Tools)
- Rust via rustup

## Getting started

```sh
git clone --recurse-submodules https://github.com/oumike/camillia-app-mac.git
cd camillia-app-mac
scripts/build-core.sh          # builds core -> Generated/ (rerun after core changes)
swift run CamilliaMac          # run the app
```

To produce a double-clickable bundle: `scripts/bundle-app.sh` → `build/Camillia.app`.

Xcode: `open Package.swift` (run `scripts/build-core.sh` first).

## Updating core

```sh
git submodule update --remote core
scripts/build-core.sh
git commit -am "Bump core"
```

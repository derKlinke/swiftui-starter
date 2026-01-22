# SwiftUI Starter

Template for SwiftUI projects with a filesystem-first setup using Tuist + just. Generates Xcode workspace, builds/tests via Tuist, formats with SwiftFormat, optional build-server for LSP.

## Tooling

- **Tuist**: project generation and build/test orchestration.
- **just**: command runner.
- **swiftformat**: formatting.
- **xcode-build-server** (optional): Swift language server support.

## Commands

- `just generate` generate the Xcode workspace.
- `just build` build the app in the iOS simulator.
- `just test` run unit tests.
- `just open` open the workspace in Xcode.
- `just format` format code (no-op if SwiftFormat missing).
- `just build-server` configure xcode-build-server.

## Getting started

1. Install required tools:
   - [tuist](https://tuist.io)
   - [just](https://github.com/casey/just)
   - [swiftformat](https://github.com/nicklockwood/SwiftFormat)
   - [xcode-build-server](https://github.com/SolaWing/xcode-build-server) (optional)
2. Rename the folder, then update:
   - `Project.swift` (project name, bundle ID, development team)
   - `SwiftUIStarter/Info.plist` (display name if needed)
3. Adjust simulator defaults in `justfile` if your local runtimes differ.
4. Run `just generate` and open the workspace.

## Notes

- Generated artifacts (`*.xcodeproj`, `*.xcworkspace`) are ignored by Git.
- For CI, use `just build` and `just test`.

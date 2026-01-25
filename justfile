set dotenv-load := true
set shell := ["bash", "-eo", "pipefail", "-c"]

project_name := "SwiftUIStarter"
default_scheme := "SwiftUIStarter"
simulator_device := "iPhone 17 Pro"
simulator_os := "26.2"

alias b := build
alias t := test
alias o := open

default:
    @just --list

# generates the Xcode project
[group('ios')]
generate:
    tuist generate --no-open

# builds the iOS app in the simulator
[group('ios')]
build scheme=default_scheme device=simulator_device os=simulator_os: (generate)
    # put the xcodebuild subcommand first to avoid tuist's argument reorderer crashing
    tuist xcodebuild build -workspace {{ project_name }}.xcworkspace -scheme {{ scheme }} -destination 'platform=iOS Simulator,name={{ device }},OS={{ os }}'

# runs the unit tests
[group('ios')]
test scheme=default_scheme device=simulator_device os=simulator_os: (generate)
    tuist test {{ scheme }} \
        --device "{{ device }}" \
        --os "{{ os }}" \
        --no-selective-testing

# opens the Xcode workspace
[group('ios')]
open: (generate)
    open {{ project_name }}.xcworkspace

# configures xcode-build-server for language server support
[group('ios')]
build-server: (generate)
    xcode-build-server config -workspace {{ project_name }}.xcworkspace -scheme {{ default_scheme }}

# formats code when tooling is available

# format-configs
alias fmt := format
alias f := format
[group('formatting')]
format:
    just --fmt --unstable
    if command -v swiftformat >/dev/null; then swiftformat .; fi
    if command -v swiftlint >/dev/null; then swiftlint --config .swiftlint.yml --force-exclude --reporter github-actions-logging; fi
    npx --yes -p markdownlint-cli markdownlint --config .markdownlint.json --ignore-path .markdownlintignore "**/*.md"
# /format-configs

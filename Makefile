PROJECT = SwiftUIStarter

.PHONY: generate format open build

generate: format build-server
	xcodegen generate

format:
	swiftformat $(PROJECT)

open: generate
	open $(PROJECT).xcodeproj

build: generate
	xcodebuild \
		-project $(PROJECT).xcodeproj \
		-scheme $(PROJECT) \
		-sdk iphonesimulator \
		-configuration Debug \
		build | xcbeautify


build-server:
	xcode-build-server config -project $(PROJECT).xcodeproj
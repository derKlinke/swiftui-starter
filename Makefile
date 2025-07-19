PROJECT = SwiftUIStarter

.PHONY: generate format open

generate: format
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
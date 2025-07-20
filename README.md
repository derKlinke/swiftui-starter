# SwiftUI Starter

This repository template outlines a simple setup for SwiftUI projects that also work well outside of Xcode. To achieve this, we make use of the following tools:

- **xcodegen** to generate the Xcode project, so the file system is the source of truth.
- **xcode-build-server** to make Xcode projects workable for the Swift language server.
- **swiftformat** to format the code.

To make this process even a bit easier, we have a Makefile with some predefined targets.

- **make format** to format the code.
- **make build** to build the project.
- **make open** to open the project in Xcode.
- **make generate** to generate the Xcode project.
- **make build-server** to generate the Xcode project.

Many of these targets build upon each other and execute the things necessary to keep the command always up to date. `generate` will always run `format` and `build-server`. `open` and `build` will always run `generate`.

I recommend for more complex development flows to also make use of fastlane to automate the ci build and especially the provisioning process, as well as setting up commitlint and a formatting hook.

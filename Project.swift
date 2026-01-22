import ProjectDescription

let deploymentTargets: DeploymentTargets = .iOS("17.0")

let project = Project(
    name: "SwiftUIStarter",
    organizationName: "Example",
    settings: .settings(
        base: [
            "DEVELOPMENT_TEAM": "<YOUR_DEVELOPMENT_TEAM_ID>",
            "CODE_SIGN_STYLE": "Automatic",
            "CODE_SIGN_IDENTITY": "Apple Development",
            "TARGETED_DEVICE_FAMILY": "1",
            "ENABLE_USER_SCRIPT_SANDBOXING": "NO"
        ],
        defaultSettings: .recommended
    ),
    targets: [
        .target(
            name: "SwiftUIStarter",
            destinations: .iOS,
            product: .app,
            bundleId: "com.example.SwiftUIStarter",
            deploymentTargets: deploymentTargets,
            infoPlist: .file(path: "SwiftUIStarter/Info.plist"),
            sources: ["SwiftUIStarter/**/*.swift"],
            resources: ["SwiftUIStarter/Assets.xcassets"]
        )
    ]
)

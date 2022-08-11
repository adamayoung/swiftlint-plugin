// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "SwiftLintPlugin",

    products: [
        .plugin(name: "SwiftLint", targets: ["SwiftLint"]),
        .plugin(name: "SwiftLintCommand", targets: ["SwiftLintCommand"])
    ],

    targets: [
        .plugin(
            name: "SwiftLint",
            capability: .buildTool(),
            dependencies: ["SwiftLintBinary"]
        ),

        .plugin(
            name: "SwiftLintCommand",
            capability: .command(
                intent: .custom(
                    verb: "swiftlint",
                    description: "Switlint."
                )
            ),
            dependencies: ["SwiftLintBinary"]
        ),

        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/realm/SwiftLint/releases/download/0.48.0/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "9c255e797260054296f9e4e4cd7e1339a15093d75f7c4227b9568d63edddba50"
        )
    ]
)

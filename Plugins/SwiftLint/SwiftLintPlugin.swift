import Foundation
import PackagePlugin

@main
struct SwiftLintPlugin: BuildToolPlugin {

    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        [
            .buildCommand(
                displayName: "Running SwiftLint for \(target.name)",
                executable: try context.tool(named: "swiftlint").path,
                arguments: [
                    "lint",
                    "--in-process-sourcekit",
                    "--config",
                    "\(context.package.directory.string)/.swiftlint.yml",
                    target.directory.string
                ],
                environment: [:]
            )
        ]
    }

}

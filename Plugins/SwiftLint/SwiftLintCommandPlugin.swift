import Foundation
import PackagePlugin

@main
struct SwiftLintCommandPlugin: CommandPlugin {

    func performCommand(context: PluginContext, arguments: [String]) throws {
        let swiftlintTool = try context.tool(named: "swiftlint")
        let swiftlintExecutableURL = URL(fileURLWithPath: swiftlintTool.path.string)
        var swiftlintArguments = [
            "lint"
        ]

        var argumentExtractor = ArgumentExtractor(arguments)

        if let configFile = argumentExtractor.extractOption(named: "config").first {
            swiftlintArguments.append(contentsOf: ["--config", configFile])
        }

        if let reporter = argumentExtractor.extractOption(named: "reporter").first {
            swiftlintArguments.append(contentsOf: ["--reporter", reporter])
        }

        if argumentExtractor.extractFlag(named: "strict") > 0 {
            swiftlintArguments.append("--strict")
        }

        if argumentExtractor.extractFlag(named: "no-cache") > 0 {
            swiftlintArguments.append("--no-cache")
        }

        let process = try Process.run(swiftlintExecutableURL, arguments: swiftlintArguments)
        process.waitUntilExit()

        if process.terminationStatus != 0 {
            Diagnostics.error("'swiftlint' failed")
        }
    }

}

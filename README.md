# SwiftLint Swift Package Plugin

A [SwiftLint](https://github.com/realm/SwiftLint) Swift Package plugin.

This Plugin differs from the official [SwiftLint plugin](https://github.com/realm/SwiftLint/pulls#plug-in-support) by using a binary version of SwiftLint, so you don't have to build SwiftLint from source.

## Requirements

* Swift 5.7+

## Setup

### Build Tool Plugin

Add the SwiftLintPlugin dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/adamayoung/swiftlint-plugin.git", from: "0.51.0")
]
```

For each of the Swift Package targets you want to lint during a build, add the plugin:

```swift
targets: [
    .target(
        name: "MyTarget",
        plugins: [
            .plugin(name: "SwiftLintPlugin", package: "swiftlint-plugin")
        ]
    ),
...
]
```

Now, when you build your Swift Package in Xcode, you will get inline SwiftLint warnings and errors.

### Command Plugin

To run SwiftLint from the command line in your Swift Package (e.g. during CI workflows):

```bash
swift package swiftlint
```

#### Options

The command plugin also supports the following options:

| Option                                   | Description                                                                |
|------------------------------------------|----------------------------------------------------------------------------|
| `--config <path to .swiftlint.yml file>` | the path to one or more SwiftLint configuration files                      |
| `--reporter <reporter name>`             | the reporter used to log errors and warnings e.g. `github-actions-logging` |
| `--strict`                               | to upgrade warnings to serious violations                                  |

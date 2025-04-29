// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "PWSwitch",
    platforms: [
        .iOS(.v8)  // Based on your podspec's deployment target
    ],
    products: [
        .library(
            name: "PWSwitch",
            targets: ["PWSwitch"]),
    ],
    dependencies: [
        // No dependencies specified in the podspec
    ],
    targets: [
        .target(
            name: "PWSwitch",
            dependencies: [],
            path: "PWSwitch")
    ],
    swiftLanguageVersions: [.v5]
)

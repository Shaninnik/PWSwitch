// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "PWSwitch",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(
            name: "PWSwitch",
            targets: ["PWSwitch"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PWSwitch",
            dependencies: [],
            path: "PWSwitch")
    ],
    swiftLanguageVersions: [.v5]
)

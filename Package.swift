// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "GeneralLandingPage",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "GeneralLandingPage",
            type: .dynamic,
            targets: ["GeneralLandingPage"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GeneralLandingPage",
            path: "Sources/GeneralLandingPage",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "GeneralLandingPageTests",
            dependencies: ["GeneralLandingPage"]),
    ],
    swiftLanguageVersions: [.v5]
) 
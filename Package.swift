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
            targets: ["GeneralLandingPage"]),
    ],
    targets: [
        .target(
            name: "GeneralLandingPage"),
        .testTarget(
            name: "GeneralLandingPageTests",
            dependencies: ["GeneralLandingPage"]),
    ]
) 
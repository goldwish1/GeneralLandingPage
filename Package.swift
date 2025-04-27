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
    // 第三方依赖项
    dependencies: [],
    
    // 目标配置
    targets: [
        // 主要目标
        .target(
            name: "GeneralLandingPage"
        ),
        .testTarget(
            name: "GeneralLandingPageTests",
            dependencies: ["GeneralLandingPage"]),
    ],
    swiftLanguageVersions: [.v5]
) 
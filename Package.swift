// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApplicationNavigation",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ApplicationNavigation",
            targets: ["ApplicationNavigation"]),
    ],
    dependencies: [
        .package(name: "SupportCode",
                 url: "https://github.com/LudvigShtirner/SupportCode.git",
                 branch: "main"),
        .package(name: "LSUserInterface",
                 url: "https://github.com/LudvigShtirner/LSUserInterface.git",
                 branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ApplicationNavigation",
            dependencies: ["SupportCode", "LSUserInterface"]),
        .testTarget(
            name: "ApplicationNavigationTests",
            dependencies: ["ApplicationNavigation"]),
    ]
)

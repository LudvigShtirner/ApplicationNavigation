// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApplicationNavigation",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ApplicationNavigation",
            targets: ["ApplicationNavigationPackage"]),
    ],
    dependencies: [
        .package(name: "SupportCode",
                 url: "https://github.com/LudvigShtirner/SupportCode.git",
                 branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ApplicationNavigationPackage",
            dependencies: []),
        .testTarget(
            name: "ApplicationNavigationPackageTests",
            dependencies: ["ApplicationNavigationPackage"]),
    ]
)

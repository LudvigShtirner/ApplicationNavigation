// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let applicationNavigation = "ApplicationNavigation"
private let applicationNavigationTests = "ApplicationNavigationTests"
private let applicationNavigationExample = "ApplicationNavigationExample"

private let supportCode = "SupportCode"
private let supportCodeURL = "https://github.com/LudvigShtirner/SupportCode.git"

private let userInterface = "LSUserInterface"
private let userInterfaceURL = "https://github.com/LudvigShtirner/LSUserInterface.git"

let package = Package(
    name: applicationNavigation,
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: applicationNavigation,
                 targets: [applicationNavigation]),
        .executable(name: applicationNavigationExample,
                    targets: [applicationNavigationExample])
    ],
    dependencies: [
        .package(name: supportCode,
                 url: supportCodeURL,
                 branch: "main"),
        .package(name: userInterface,
                 url: userInterfaceURL,
                 branch: "main")
    ],
    targets: [
        .target(name: applicationNavigation,
                dependencies: [
                    .byName(name: supportCode),
                    .byName(name: userInterface)
                ]),
        .executableTarget(name: applicationNavigationExample,
                          dependencies: [
                                .byName(name: supportCode),
                                .byName(name: userInterface),
                                .byName(name: applicationNavigation)
                          ]),
        .testTarget(name: applicationNavigationTests,
                    dependencies: [
                        .byName(name: applicationNavigation)
                    ]),
    ]
)

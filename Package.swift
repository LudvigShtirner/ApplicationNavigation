// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

struct RemotePackage {
    let name: String
    let productName: String
    let url: String
    
    init(name: String,
         productName: String? = nil,
         url: String) {
        self.name = name
        self.productName = productName ?? name
        self.url = url
    }
}

private let applicationNavigation = "ApplicationNavigation"
private let applicationNavigationTests = "ApplicationNavigationTests"
private let applicationNavigationExample = "ApplicationNavigationExample"

private let supportCode = RemotePackage(name: "SupportCode",
                                        url: "https://github.com/LudvigShtirner/SupportCode.git")
private let userInterface = RemotePackage(name: "LSUserInterface",
                                          url: "https://github.com/LudvigShtirner/LSUserInterface.git")

let package = Package(
    name: applicationNavigation,
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: applicationNavigation,
                 targets: [applicationNavigation]),
        .executable(name: applicationNavigationExample,
                    targets: [applicationNavigationExample])
    ],
    dependencies: [
        .package(name: supportCode.name, url: supportCode.url, branch: "main"),
        .package(name: userInterface.name, url: userInterface.url, branch: "main")
    ],
    targets: [
        .target(name: applicationNavigation,
                dependencies: [
                    .byName(name: supportCode.name),
                    .byName(name: userInterface.name)
                ]),
        .executableTarget(name: applicationNavigationExample,
                          dependencies: [
                            .byName(name: supportCode.name),
                            .byName(name: userInterface.name),
                            .byName(name: applicationNavigation)
                          ]),
        .testTarget(name: applicationNavigationTests,
                    dependencies: [
                        .byName(name: applicationNavigation)
                    ]),
    ]
)

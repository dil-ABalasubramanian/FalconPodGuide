// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PKBoardsRNDSwiftPackage",
    platforms: [
        .macOS(.v12),
        .iOS(.v14),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PKBoardsRNDSwiftPackage",
            targets: ["PKBoardsRNDSwiftPackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.4.3")

    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PKBoardsRNDSwiftPackage"),
        .testTarget(
            name: "PKBoardsRNDSwiftPackageTests",
            dependencies: ["PKBoardsRNDSwiftPackage"]
        ),
    ]
)

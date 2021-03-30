// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Berkeley",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(
            name: "Berkeley",
            targets: ["Berkeley"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-nio-transport-services.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Berkeley",
            dependencies: ["NIO"],
            path: "Sources"
        ),
    ]
)

// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Berkeley",
    products: [
        .library(
            name: "Berkeley",
            targets: ["Berkeley"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-nio-transport-services.git", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "Berkeley",
            dependencies: ["SwiftNIO", "SwiftNIOTransportServices"],
            path: "Sources"
        ),
        .testTarget(
            name: "BerkeleyTests",
            dependencies: ["Berkeley"],
            path: "Tests"
        ),
    ]
)

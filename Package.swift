// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Berkeley",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "Berkeley",
            targets: ["Berkeley"]
        ),
    ],
    dependencies: [
        .package(name: "swift-nio-transport-services", url: "https://github.com/apple/swift-nio-transport-services", from: "1.9.2"),
    ],
    targets: [
        .target(
            name: "Berkeley",
            dependencies: [.product(name: "NIOTransportServices", package: "swift-nio-transport-services")],
            path: "Sources"
        ),
    ]
)

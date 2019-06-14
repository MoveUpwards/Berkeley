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
    dependencies: [],
    targets: [
        .target(
            name: "Berkeley",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "BerkeleyTests",
            dependencies: ["Berkeley"],
            path: "Tests"
        ),
    ]
)

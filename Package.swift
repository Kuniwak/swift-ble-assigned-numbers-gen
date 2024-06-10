// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "swift-ble-assigned-numbers-gen",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .executable(
            name: "BLEAssignedNumbersGenerator",
            targets: ["BLEAssignedNumbersGenerator"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/apple/swift-algorithms", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/jpsim/Yams.git", .upToNextMajor(from: "5.1.2")),
        .package(url: "https://github.com/Kuniwak/MirrorDiffKit", .upToNextMajor(from: "5.0.1")),
    ],
    targets: [
        .executableTarget(
            name: "BLEAssignedNumbersGenerator",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Yams", package: "Yams"),
            ]
        ),
        .testTarget(
            name: "BLEAssignedNumbersGeneratorTests",
            dependencies: [
                "BLEAssignedNumbersGenerator",
                "MirrorDiffKit",
            ],
            resources: [
                .copy("Fixtures"),
            ]
        ),
    ]
)

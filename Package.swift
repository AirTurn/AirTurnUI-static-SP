// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "4.4.0"
let checksum = "b314551260b2803a16fb434ef70c220c2e58cbf6765de63f33606e29c7e59614"

let package = Package(
    name: "AirTurnUI",
    platforms: [.iOS(.v9)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AirTurnUI",
            targets: ["AirTurnUITargets"]
        ),
    ],
    dependencies: [
        .package(name: "AirTurnInterface",
                         url: "https://github.com/AirTurn/AirTurnInterface-static-SP.git",
                         from: Version(version)!
        )
    ],
    targets: [
        .binaryTarget(name: "AirTurnUI", url: "https://airturn.com/framework/AirTurnUI.\(version).static.spm.zip", checksum: checksum),
        .target(name: "AirTurnUITargets",
                        dependencies: [
                            .target(name: "AirTurnUI"),
                            .product(name: "AirTurnInterface", package: "AirTurnInterface")
                        ],
                        path: "Sources"
        )
    ]
)

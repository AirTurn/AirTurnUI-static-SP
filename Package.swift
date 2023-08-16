// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "4.8.0-b.2"
let checksum = "eb4aeed16a386933d928d480672f30862ff9a20451e008b9a89a06bcb6044ede"

let package = Package(
    name: "AirTurnUI",
    platforms: [.iOS(.v12)],
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
        .binaryTarget(name: "AirTurnUI", url: "https://dev.airturn.com/sdk/AirTurnUI.\(version).static.spm.zip", checksum: checksum),
        .target(name: "AirTurnUITargets",
                        dependencies: [
                            .target(name: "AirTurnUI"),
                            .product(name: "AirTurnInterface", package: "AirTurnInterface")
                        ],
                        path: "Sources"
        )
    ]
)

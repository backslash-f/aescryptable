// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "AESCryptable",
    products: [
        .library(name: "AESCryptable", targets: ["AESCryptable"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "AESCryptable", dependencies: []),
        .testTarget(name: "AESCryptableTests",dependencies: ["AESCryptable"]),
    ]
)

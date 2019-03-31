// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AESCryptable",
    products: [
        .library(
            name: "AESCryptable",
            targets: ["AESCryptable"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AESCryptable",
            dependencies: []),
        .testTarget(
            name: "AESCryptableTests",
            dependencies: ["AESCryptable"]),
    ]
)

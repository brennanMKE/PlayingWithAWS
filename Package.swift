// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PlayingWithAWS",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "PlayingWithAWS",
            targets: ["PlayingWithAWS"]),
    ],
    dependencies: [
        .package(
            name: "AWSSwiftSDK",
            url: "https://github.com/awslabs/aws-sdk-swift",
            from: "0.0.16"
        ),
    ],
    targets: [
        .target(
            name: "PlayingWithAWS",
            dependencies: [
                .product(name: "AWSCognitoIdentity", package: "AWSSwiftSDK"),
                .product(name: "AWSCognitoIdentityProvider", package: "AWSSwiftSDK"),
                .product(name: "AWSS3", package: "AWSSwiftSDK"),
            ]),
        .testTarget(
            name: "PlayingWithAWSTests",
            dependencies: ["PlayingWithAWS"]),
    ]
)

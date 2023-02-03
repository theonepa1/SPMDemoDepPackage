// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
    name: "SPMDemoDepPackage",
    platforms: [
           .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SPMDemoDep",
            targets: ["SPMDemoDep"])
    ],
    dependencies: [
        .package(url: "https://github.com/socure-inc/socure-sigmadevice-sdk-ios", revision: "b0fc489d02d5b4516ff1566e0a75c37e80088387"),
        .package(url: "https://github.com/datatheorem/TrustKit", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "SPMDemoDep",
            dependencies: [
                .product(name: "SigmaDeviceWithoutTrustKit", package: "socure-sigmadevice-sdk-ios"),
                "TrustKit"
            ] 
        ),
    ]
)

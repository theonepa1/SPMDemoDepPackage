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
        .package(url: "https://github.com/theonepa1/SPMDemoPackage", revision: "28d3f0f11876b637ec23eca62fbce625e8c751c6"),
        .package(url: "https://github.com/datatheorem/TrustKit", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "SPMDemoDep",
            dependencies: [
                .product(name: "SPMDemoNoTrustKit", package: "SPMDemoPackage"),
                "TrustKit"
            ] 
        ),
    ]
)

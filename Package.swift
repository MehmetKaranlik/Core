// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Core",
            targets: ["Core"]),
    ],
    dependencies: [
      .package(url: "https://github.com/realm/realm-swift.git", from: .init(10, 36, 0))
    ],
    targets: [

        .target(
            name: "Core",
            dependencies: [
               .product(name: "RealmSwift", package: "realm-swift")
            ]),


        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
    ]

)



// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "swift-package-resources",
    products: [
      .library(
        name: "PackageResources",
        targets: ["PackageResources"]
      ),
    ],
    targets: [
      .target(name: "PackageResources")
    ]
)

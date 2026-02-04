// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "swift-package-resources",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_15),
		.tvOS(.v13),
		.watchOS(.v6),
		.macCatalyst(.v13),
	],
	products: [
		.library(
			name: "PackageResources",
			targets: ["PackageResources"]
		),
		.library(
			name: "PackageResourcesCore",
			targets: ["PackageResourcesCore"]
		),
	],
	targets: [
		.target(
			name: "PackageResources",
			dependencies: [
				.target(name: "PackageResourcesCore")
			]
		),
		.target(name: "PackageResourcesCore"),
	]
)

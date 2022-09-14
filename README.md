# swift-package-resources

[![SwiftPM 5.6](https://img.shields.io/badge/swiftpm-5.6-ED523F.svg?style=flat)](https://swift.org/download/) ![Platforms](https://img.shields.io/badge/Platforms-iOS_13_|_macOS_10.15_|_Catalyst_|_tvOS_14_|_watchOS_7-ED523F.svg?style=flat) [![@maximkrouk](https://img.shields.io/badge/contact-@capturecontext-1DA1F2.svg?style=flat&logo=twitter)](https://twitter.com/capture_context) 

Package with lightweight resources models for code generation. Originally created for [spmgen](https://github.com/capturecontext/spmgen).

## Products

### PackageResources

Product with the primary API, declares accessors for each resource type and some helpers. Unlike generated accessors, this module can be shared across multiple packages or targets without causing any ambiguity.

### PackageResourcesCore

Product with resource model declarations, target that contains resources might not need to access them, so you can depend just on this product to declare static factories for resources to use them later with `PackageResources` product.
Or you can use this product to create your own APIs.

Available declarations

- ColorResource
- FontResource
- ImageResource
- NibResource
- StoryboardResource
- SCNSceneResource

# swift-package-resources

Package with lightweight resources models for code generation.

> [!TIP]
>
> Default codegen for this package is [capturecontext/package-resources-cli](https://github.com/capturecontext/package-resources-cli) 

## Table of contents

- [Products](#products)
- [Installation](#installation)
- [License](#license)

## Products

### PackageResources

Product with the primary API, declares accessors for each resource type and some helpers. Unlike generated accessors, this module can be shared across multiple packages or targets without causing any ambiguity.

Basically provides static factories for [avaliable resource types](#available-resource-declarations).

```swift
Color.resource(_:PackageResources.Color)
UIColor.resource(_:PackageResources.Color)
NSColor.resource(_:PackageResources.Color)
```

```swift
Image.resource(_:PackageResources.Image)
UIImage.resource(_:PackageResources.Image)
NSImage.resource(_:PackageResources.Image)
```

```swift
Font.resource(_:PackageResources.Font)
UIFont.resource(_:PackageResources.Font)
NSFont.resource(_:PackageResources.Font)
```

```swift
UIStoryboard.resource(_:PackageResources.Storyboard)
NSStoryboard.resource(_:PackageResources.Storyboard)
```

> [!NOTE]
>
> _Currently no custom Nib loading is available, but you can access `name` and `bundle` properties of `NibResource` to load your custom nib_

### PackageResourcesCore

Product with resource model declarations.

- Accessors might be redundant for module with generated boilerplate. The only boilerplate that needs to be generated are factories for asset models, API can be provided statically, that is why this module doesn't declare any helpers for initializing objects like `UIImage`.
- Default API provided with `PackageResources` product are redundant if you want to build your own API over generated boilerplate.

##### Available resource declarations

| Type                  | Alias                         |
| --------------------- | ----------------------------- |
| `_ColorResource`      | `PackageResources.Color`      |
| `_FontResource`       | `PackageResources.Font`       |
| `_ImageResource`      | `PackageResources.Image`      |
| `_StoryboardResource` | `PackageResources.Storyboard` |
| `_SCNSceneResource`   | `PackageResources.SCNScene`   |

> [!NOTE]
>
> _Base types are declared with underscores to avoid ambiguity with system types, for example you may choose to use xcasset catalog out-of-the box boilerplate generation for some asset types_

## Installation

### Basic

You can add PackageResources to an Xcode project by adding it as a package dependency.

1. From the **File** menu, select **Swift Packages › Add Package Dependency…**
2. Enter [`"https://github.com/capturecontext/swift-package-resources.git"`](https://github.com/capturecontext/swift-package-resources.git) into the package repository URL text field
3. Choose products you need to link them to your project.

### Recommended

If you use SwiftPM for your project, you can add PackageResources to your package file.

```swift
.package(
  url: "https://github.com/capturecontext/swift-package-resources.git", 
  .upToNextMinor(from: "4.0.0")
)
```

Do not forget about target dependencies:

```swift
.product(
  name: "PackageResources",
  package: "swift-package-resources"
)
```

## License

This library is released under the MIT license. See [LICENSE](LICENSE) for details.

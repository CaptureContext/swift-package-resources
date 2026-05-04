import Foundation
import PackageResourcesCore

extension _XCStringResource {
	@available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
	@_spi(Internals)
	public var defaultValue: String.LocalizationValue {
		String.LocalizationValue(
			stringInterpolation: .init(self)
		)
	}
}

@available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
@_spi(Internals)
extension String.LocalizationValue.StringInterpolation {
	public init(_ resource: _XCStringResource) {
		var interpolation = String.LocalizationValue.StringInterpolation(
			literalCapacity: 0,
			interpolationCount: resource.arguments.count
		)

		for argument in resource.arguments {
			switch argument {
			case let .int(value):
				interpolation.appendInterpolation(value)
			case let .uint(value):
				interpolation.appendInterpolation(value)
			case let .float(value):
				interpolation.appendInterpolation(value)
			case let .double(value):
				interpolation.appendInterpolation(value)
			case let .object(value):
				interpolation.appendInterpolation(value)
			}
		}

		self = interpolation
	}
}

extension LocalizedStringKey.StringInterpolation {
	@_spi(Internals)
	public init(_ resource: _XCStringResource) {
		var interpolation = LocalizedStringKey.StringInterpolation(
			literalCapacity: 0,
			interpolationCount: resource.arguments.count
		)

		for argument in resource.arguments {
			switch argument {
			case let .int(value):
				interpolation.appendInterpolation(value)
			case let .uint(value):
				interpolation.appendInterpolation(value)
			case let .float(value):
				interpolation.appendInterpolation(value)
			case let .double(value):
				interpolation.appendInterpolation(value)
			case let .object(value):
				interpolation.appendInterpolation(value)
			}
		}

		self = interpolation
	}
}

extension String {
	public static func localized(
		_ resource: _XCStringResource,
		locale: Locale? = nil
	) -> String {
		let key = String(describing: resource.key)
		return .init(
			format: resource.bundle.localizedString(
				forKey: key,
				value: nil,
				table: resource.table
			),
			locale: locale,
			arguments: resource.arguments.map(\.value)
		)
	}
}

@available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
extension LocalizedStringResource {
	public static func localized(
		_ resource: _XCStringResource,
		locale: Locale = .current
	) -> LocalizedStringResource {
		return .init(
			resource.key,
			defaultValue: resource.defaultValue,
			table: resource.table,
			locale: locale,
			bundle: .atURL(resource.bundle.bundleURL)
		)
	}
}

#if canImport(SwiftUI)
import SwiftUI

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Text {
	public init(localized resource: _XCStringResource) {
		self = .localized(resource)
	}

	public static func localized(_ resource: _XCStringResource) -> Text {
		if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
			return Text(.localized(resource))
		}

		var key = LocalizedStringKey(stringInterpolation: .init(resource))
		key.overrideKeyForLookup(using: String(describing: key))
		return Text(key, tableName: resource.table, bundle: resource.bundle)
	}
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension LocalizedStringKey {
	/// Creates a `LocalizedStringKey` that represents a localized value in the ‘Common‘ strings table.
	@available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
	public static func localized(_ resource: _XCStringResource) -> LocalizedStringKey {
		var interpolation = LocalizedStringKey.StringInterpolation(
			literalCapacity: 0,
			interpolationCount: 1
		)

		if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
			interpolation.appendInterpolation(LocalizedStringResource.localized(resource))
		} else {
			interpolation.appendInterpolation(Text(localized: resource))
		}

		return LocalizedStringKey(stringInterpolation: interpolation)
	}

	/// Updates the underlying `key` used when performing localization lookups.
	///
	/// By default, an instance of `LocalizedStringKey` can only be created
	/// using string interpolation, so if arguments are included, the format
	/// specifiers make up part of the key.
	///
	/// This method allows you to change the key after initialization in order
	/// to match the value that might be defined in the strings table.
	fileprivate mutating func overrideKeyForLookup(using key: String) {
		withUnsafeMutablePointer(to: &self) { pointer in
			let raw = UnsafeMutableRawPointer(pointer)
			let bound = raw.assumingMemoryBound(to: String.self)
			bound.pointee = key
		}
	}
}
#endif

import Foundation

public struct _XCStringResource: Hashable, Sendable {
	public static func ==(lhs: Self, rhs: Self) -> Bool {
		String(describing: lhs.key) == String(describing: rhs.key)
		&& lhs.arguments == rhs.arguments
		&& lhs.table == rhs.table
		&& lhs.bundle == rhs.bundle
	}

	public enum Argument: Hashable, Sendable {
		case int(Int)
		case uint(UInt)
		case float(Float)
		case double(Double)
		case object(String)

		public var value: any CVarArg {
			switch self {
			case let .int(value): value
			case let .uint(value): value
			case let .float(value): value
			case let .double(value): value
			case let .object(value): value
			}
		}
	}

	public let key: StaticString
	public let arguments: [Argument]
	public let table: String?
	public let bundle: Bundle

	public init(
		key: StaticString,
		arguments: [Argument],
		table: String?,
		bundle: Bundle
	) {
		self.key = key
		self.arguments = arguments
		self.table = table
		self.bundle = bundle
	}

	public func hash(into hasher: inout Hasher) {
		hasher.combine(String(describing: key))
		hasher.combine(arguments)
		hasher.combine(table)
		hasher.combine(bundle)
	}
}

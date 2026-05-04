import Foundation

public struct _FontResource: Hashable, Sendable {
	public let name: String

	@inlinable
	public init(name: String) {
		self.name = name
	}
}

import Foundation

public struct _ImageResource: Hashable, Sendable {
	public let name: String
	public let bundle: Bundle?

	@inlinable
	public init(
		name: String,
		bundle: Bundle? = nil
	) {
		self.name = name
		self.bundle = bundle
	}
}

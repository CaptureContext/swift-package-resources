import Foundation

public struct _ImageResource: Equatable {
	public var name: String
	public var bundle: Bundle?

	@inlinable
	public init(
		name: String,
		bundle: Bundle? = nil
	) {
		self.name = name
		self.bundle = bundle
	}
}

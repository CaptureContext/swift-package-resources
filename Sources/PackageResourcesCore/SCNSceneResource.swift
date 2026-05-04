import Foundation

public struct _SCNSceneResource: Hashable, Sendable {
	public let name: String
	public let catalog: String?
	public let bundle: Bundle?

	@inlinable
	public init(
		name: String,
		catalog: String? = nil,
		bundle: Bundle? = nil
	) {
		self.name = name
		self.catalog = catalog
		self.bundle = bundle
	}
}

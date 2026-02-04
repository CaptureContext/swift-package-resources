import Foundation

public struct _SCNSceneResource: Equatable {
	public var name: String
	public var catalog: String? = nil
	public var bundle: Bundle?

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

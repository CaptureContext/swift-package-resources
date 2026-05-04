import Foundation

public struct _StoryboardResource: Hashable, Sendable {
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

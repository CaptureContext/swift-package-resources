import Foundation

public struct _StoryboardResource: Equatable {
  @inlinable
  public init(
    name: String,
    bundle: Bundle? = nil
  ) {
    self.name = name
    self.bundle = bundle
  }

  public var name: String
  public var bundle: Bundle?
}

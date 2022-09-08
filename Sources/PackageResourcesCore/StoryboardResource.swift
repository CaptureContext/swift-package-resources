import Foundation

public struct StoryboardResource: Equatable {
  public init(name: String, bundle: Bundle? = nil) {
    self.name = name
    self.bundle = bundle
  }

  public var name: String
  public var bundle: Bundle?
}

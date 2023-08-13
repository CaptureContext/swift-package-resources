import Foundation

public struct _FontResource: Equatable {
  @inlinable
  public init(name: String) {
    self.name = name
  }

  public var name: String
}

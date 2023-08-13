public struct _SCNSceneResource: Equatable {
  public var name: String
  public var catalog: String? = nil

  @inlinable
  public init(name: String) {
    self.name = name
  }

  @inlinable
  public init(
    name: String,
    catalog: String?
  ) {
    self.name = name
    self.catalog = catalog
  }
}

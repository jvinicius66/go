///
/// Dependency Injection locator interface
///
abstract class ILocator {
  /// Initiaization of dependency injection
  Future<void> onInit();

  /// Register class factory
  void factory<T extends Object>(T object);

  /// Register a unique instance of class
  void singleton<T extends Object>(T object);

  /// Register async a unique instance of class
  Future<T> async<T extends Object>(
    Future<T> Function() builder, {
    bool singleton = false,
  });

  /// Get the instance
  T get<T extends Object>();

  /// Find instance in memory
  bool find<T extends Object>();

  /// Delete instance from memory
  bool delete<T extends Object>();
  // bool delete<T extends Object>(T object);

  /// Clear all instances
  void clear(bool forceSingleton);

  /// Print all instances in memory
  void dump();
}

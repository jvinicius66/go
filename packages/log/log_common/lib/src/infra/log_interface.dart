///
/// Log interface
///
abstract class ILog {
  /// Print information
  void i(final String title, [final dynamic data]);

  /// Print warning
  void w(final String title, [final dynamic data]);

  /// Print error
  void e(
    final String title, [
    final dynamic data,
    StackTrace? stackTrace,
  ]);

  /// Print WTF
  void wtf(
    final String title, {
    final String? name,
    final dynamic data,
  });
}

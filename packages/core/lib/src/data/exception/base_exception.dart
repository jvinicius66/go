///
/// Base exception
///
abstract class BaseException {
  /// Creates [BaseException]
  BaseException({
    required this.message,
    this.cause,
    this.data,
    this.stackTrace,
  });

  /// Error message
  final String message;

  /// Error cause
  final String? cause;

  /// Message data
  final dynamic data;

  /// Stack tract
  final StackTrace? stackTrace;
}

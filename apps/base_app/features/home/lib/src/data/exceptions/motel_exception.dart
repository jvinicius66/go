///
/// Motel exceptions
///
sealed class MotelException implements Exception {
  /// Creates [MotelException]
  MotelException(
    this.status, {
    this.message = '',
    this.data,
  });

  /// Status code
  final int? status;

  /// Error message
  final String message;

  /// Any data
  final dynamic data;
}

///
/// Parse exception
///
final class ParseException extends MotelException {
  /// Creates [ParseException]
  ParseException({super.message}) : super(null);
}

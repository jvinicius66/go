///
/// Motel failure main class
///
sealed class MotelFailure {
  /// Creates [MotelFailure]
  MotelFailure({required this.message});

  /// Message of failure
  final String message;
}

/// Generic failure
final class MotelGenericFailure extends MotelFailure {
  /// Creates [MotelGenericFailure]
  MotelGenericFailure({required super.message});
}

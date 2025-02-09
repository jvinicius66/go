/// Result failure or success with record native code
typedef Result<S, T> = ({S? failure, T? success});

/// Extension from [Result]
extension ResultExt<S, T> on Result<S, T> {
  /// Get [bool] if success
  bool get isSuccess => this.success != null;

  /// Get [bool] if failure
  bool get isFailure => this.failure != null;

  /// Get succes value
  T get getSuccess {
    if (isSuccess) {
      return this.success!;
    } else {
      throw Exception('No success value present');
    }
  }

  /// Get failure value
  S get getFailure {
    if (isFailure) {
      return this.failure!;
    } else {
      throw Exception('No failure value present');
    }
  }

  /// Get fold with success & failure values
  R fold<R>(R Function(S failure) onFailure, R Function(T success) onSuccess) {
    if (isFailure) {
      return onFailure(this.failure as S);
    } else if (isSuccess) {
      return onSuccess(this.success as T);
    } else {
      throw Exception('Result contains neither success nor failure');
    }
  }
}

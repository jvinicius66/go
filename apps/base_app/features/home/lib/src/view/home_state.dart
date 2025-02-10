import '../domain/entities/entities.dart' show Motel;

///
/// Home state
///
sealed class HomeState {}

/// Initial home state
final class HomeinitialState extends HomeState {}

/// Loading home state
final class HomeLoadingState extends HomeState {}

/// Failure home state
final class HomeFailureState extends HomeState {
  /// Creates [HomeFailureState]
  HomeFailureState({required this.message});

  /// Failure mesage
  final String message;
}

/// Done home state
final class HomeDoneState extends HomeState {
  /// Creates [HomeDoneState]
  HomeDoneState({required this.motels});

  /// List of motels
  final List<Motel> motels;
}

import 'package:dependencies/dependencies.dart' show Result;

import '../entities/entities.dart' show Motel;
import '../failures/failures.dart' show MotelFailure;

///
/// Motel repository interface
///
abstract class IMotelRepository {
  /// Method to get device informations
  Future<Result<MotelFailure, List<Motel>>> get();
}

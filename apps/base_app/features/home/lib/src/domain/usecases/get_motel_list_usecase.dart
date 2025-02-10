import 'package:dependencies/dependencies.dart' show Result;

import '../entities/entities.dart' show Motel;
import '../failures/failures.dart' show MotelFailure;
import '../repositories/repositories.dart' show IMotelRepository;

///
/// Get motel list usecase interface
///
abstract class IGetMotelListUsecase {
  /// Method to get motel list
  Future<Result<MotelFailure, List<Motel>>> call();
}

///
/// Motel list usecase implementation
///
final class GetMotelListUsecase extends IGetMotelListUsecase {
  /// Creates [GetMotelListUsecase]
  GetMotelListUsecase(this._repository);

  final IMotelRepository _repository;

  @override
  Future<Result<MotelFailure, List<Motel>>> call() => _repository.get();
}

import 'package:dependencies/dependencies.dart' show Result;

import '../../domain/entities/entities.dart' show Motel;
import '../../domain/failures/failures.dart'
    show MotelFailure, MotelGenericFailure;
import '../../domain/repositories/repositories.dart' show IMotelRepository;
import '../datasources/datasources.dart' show IMotelDatasource;
import '../exceptions/exceptions.dart' show ParseException;
import '../models/models.dart' show MotelModel;

///
/// Motel repository implementation
///
final class MotelRepository extends IMotelRepository {
  /// Creates [MotelRepository]
  MotelRepository(this._datasource);

  final IMotelDatasource _datasource;

  @override
  Future<Result<MotelFailure, List<Motel>>> get() async {
    try {
      final result = await _datasource.get();
      return (failure: null, success: MotelModel.toEntityList(result));
    } on ParseException catch (e) {
      return (
        failure: MotelGenericFailure(message: e.message),
        success: null,
      );
    } catch (e) {
      return (
        failure: MotelGenericFailure(message: e.toString()),
        success: null,
      );
    }
  }
}

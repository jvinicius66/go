import 'package:dependencies/dependencies.dart' show IHttp;

import '../models/models.dart' show MotelModel;

///
/// Motel datasourc interface
///
abstract class IMotelDatasource {
  /// Method to get motel list
  Future<List<MotelModel>> get();
}

///
/// Motel datasource implementation
///
final class MotelDatasource extends IMotelDatasource {
  final String _getListPath = 'b/1IXK';

  /// Creates [MotelDatasource]
  MotelDatasource(this._http);

  /// Http request
  final IHttp _http;

  @override
  Future<List<MotelModel>> get() async {
    final result = await _http.get(_getListPath);

    return MotelModel.fromMapList(result.data['data']['moteis']);
  }
}

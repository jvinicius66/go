import 'package:dependencies/dependencies.dart';

import '../data/datasources/datasources.dart'
    show IMotelDatasource, MotelDatasource;
import '../data/repositories/repositories.dart' show MotelRepository;
import '../domain/repositories/repositories.dart' show IMotelRepository;
import '../domain/usecases/usecases.dart'
    show GetMotelListUsecase, IGetMotelListUsecase;
import 'view.dart' show HomeController;

///
/// Home bind to inject instances
///
abstract class HomeBind {
  static const _urlBase = 'https://www.jsonkeeper.com/';

  /// Method do invoke binding
  static HomeController get bind {
    final IHttp http = HttpMinimal(_urlBase);
    final IMotelDatasource datasource = MotelDatasource(http);
    final IMotelRepository repository = MotelRepository(datasource);
    final IGetMotelListUsecase getMotelListUsecase =
        GetMotelListUsecase(repository);
    return HomeController(getMotelListUsecase);
  }
}

import 'dart:developer' as dev;

import 'package:locator_common/locator_common.dart';

///
/// Location native extends [ILocator]
///
class LocatorNative implements ILocator {
  final Map<Object, bool> _dependencies = {};

  @override
  Future<void> onInit() async {}

  @override
  Future<T> async<T extends Object>(
    Future<T> Function() builder, {
    bool singleton = false,
  }) async {
    final obj = await builder();
    if (singleton) {
      this.singleton<T>(obj);
    } else {
      factory(obj);
    }
    return obj;
  }

  @override
  bool delete<T extends Object>() {
    final object = get<T>();
    final isSingleton = _dependencies[object] ?? false;
    if (isSingleton) return false;

    _dependencies.remove(object);
    _printLog('Remove $object');
    return true;
  }

  @override
  void factory<T extends Object>(T object) {
    _printLog('Factory $object');
    _dependencies[object] = false;
  }

  @override
  bool find<T extends Object>() => _dependencies.entries.any((e) => e.key is T);

  @override
  T get<T extends Object>() {
    try {
      return _dependencies.entries.firstWhere((e) => e.key is T).key as T;
    } catch (e) {
      throw Exception('Object not found $T');
    }
  }

  @override
  void singleton<T extends Object>(T object) {
    final find = _dependencies.entries.any((e) => e.key is T);
    if (find) return;

    _dependencies[object] = true;
    _printLog('Singleton $object');
  }

  @override
  void clear(bool forceSingleton) => _dependencies.clear();

  // coverage:ignore-start
  @override
  void dump() => _printLog(_dependencies.toString());
  // coverage:ignore-end

  void _printLog(final String text) => dev.log('\x1B[32m $text', name: 'MEM');
}

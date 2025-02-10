import 'package:core/src/src.dart' show BaseEntity;
import 'package:flutter_test/flutter_test.dart'
    show equals, expect, group, isA, isNot, test, throwsA;
import 'package:locator_common/locator_common.dart' show ILocator;
import 'package:locator_native/locator_native.dart' show LocatorNative;

void main() {
  late final ILocator locator = LocatorNative();
  locator.onInit();

  group('singleton', () {
    test('should return false for find non-injected instance', () {
      final hasInstance = locator.find<BaseEntity>();

      expect(hasInstance, equals(false));
    });

    test('should return exception from get for non-injected instance', () {
      expect(() => locator.get<BaseEntity>(), throwsA(isA<Exception>()));
    });

    test('should return true for find injected instance', () {
      final entityTest = _EntityTest();
      locator.singleton<BaseEntity>(entityTest);

      final hasInstance = locator.find<BaseEntity>();
      expect(hasInstance, equals(true));
    });

    test('should bring only one instance when singleton', () {
      final entityTest = _EntityTest();
      locator.singleton<BaseEntity>(entityTest);

      final firstGet = locator.get<BaseEntity>();
      final secondGet = locator.get<BaseEntity>();

      expect(firstGet, isA<BaseEntity>());
      expect(firstGet.hashCode, equals(secondGet.hashCode));
    });

    test('should return false to remove a singleton', () {
      final deleted = locator.delete<BaseEntity>();

      expect(deleted, equals(false));
    });

    test('should return false to find uninjected instance after cleanup', () {
      locator.clear(true);

      final hasInstance = locator.find<BaseEntity>();

      expect(hasInstance, equals(false));
    });
  });

  group('factory', () {
    test('should return true for find injected instance', () {
      locator.factory<BaseEntity>(_EntityTest());

      final hasInstance = locator.find<BaseEntity>();
      expect(hasInstance, equals(true));
    });

    test('should bring maby one instance when factory', () {
      final firstEntity = _EntityTest();
      locator.factory<BaseEntity>(firstEntity);
      final secondEntity = _EntityTest();
      locator.factory<BaseEntity>(secondEntity);

      final firstGet = locator.get<BaseEntity>();
      locator.delete<BaseEntity>();
      final secondGet = locator.get<BaseEntity>();

      expect(firstGet, isA<BaseEntity>());
      expect(firstGet.hashCode, isNot(secondGet.hashCode));
    });

    test('should return false to find uninjected instance after cleanup', () {
      locator.clear(true);

      final hasInstance = locator.find<BaseEntity>();

      expect(hasInstance, false);
    });
  });

  group('asynchronous', () {
    test('should return true for find injected async factory instance',
        () async {
      await locator.async<BaseEntity>(() async => _EntityTest());

      final hasInstance = locator.find<BaseEntity>();
      expect(hasInstance, equals(true));
    });

    test('should return true for find injected async singleton instance',
        () async {
      await locator.async<BaseEntity>(
        () async => _EntityTest(),
        singleton: true,
      );

      final hasInstance = locator.find<BaseEntity>();
      expect(hasInstance, equals(true));
    });
  });
}

class _EntityTest extends BaseEntity {}

import 'package:flutter_test/flutter_test.dart'
    show equals, expect, group, isA, setUp, test;
import 'package:http_common/http_common.dart' show HttpResponse;

void main() {
  late HttpResponse httpResponse;
  const successData = {'id': 1, 'name': 'test'};

  group('http response entity', () {
    setUp(() {
      httpResponse = HttpResponse.success(successData);
    });

    test('should http response entity success', () async {
      expect(httpResponse.status, 200);
      expect(httpResponse.data, isA<Map<String, dynamic>>());
      expect(httpResponse.data, successData);
      expect(httpResponse.data['name'], equals('test'));
    });
  });

  group('should http response emprt', () {
    setUp(() {
      httpResponse = HttpResponse.empty();
    });

    test('check empty props', () async {
      expect(httpResponse.status, 204);
      expect(httpResponse.data, null);
    });
  });
}

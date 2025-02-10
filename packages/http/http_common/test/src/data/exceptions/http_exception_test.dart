import 'package:flutter_test/flutter_test.dart'
    show expect, group, isNull, setUp, test;
import 'package:http_common/src/data/exceptions/exceptions.dart';

void main() {
  setUp(() {});

  group('parse exception', () {
    test('should parse return null & empty', () async {
      final exception = ParseException();

      expect(exception.status, null);
      expect(exception.message, '');
    });

    test('should parse return null & message', () async {
      final exception = ParseException(message: 'message');

      expect(exception.status, null);
      expect(exception.message, 'message');
    });
  });

  group('bad request exception', () {
    test('should return 400, empty & null', () async {
      final exception = BadRequestException();

      expect(exception.status, 400);
      expect(exception.message, '');
      expect(exception.data, isNull);
    });

    test('should return 400, message & data', () async {
      final exception = BadRequestException(
        data: 'data',
        message: 'message',
      );

      expect(exception.status, 400);
      expect(exception.message, 'message');
      expect(exception.data, 'data');
    });
  });

  group('unknow exception', () {
    test('should return null & empty', () async {
      final exception = UnknowException();

      expect(exception.status, null);
      expect(exception.message, '');
    });

    test('should return null & message', () async {
      final exception = UnknowException(message: 'message');

      expect(exception.status, null);
      expect(exception.message, 'message');
    });
  });

  group('server error exception', () {
    test('should return 500, empty & null', () async {
      final exception = ServerErrorException();

      expect(exception.status, 500);
      expect(exception.message, '');
      expect(exception.data, isNull);
    });

    test('should return 500, message & data', () async {
      final exception = ServerErrorException(
        data: 'data',
        message: 'message',
      );

      expect(exception.status, 500);
      expect(exception.message, 'message');
      expect(exception.data, 'data');
    });
  });

  group('unprocessable entity exception', () {
    test('should return 422, empty & null', () async {
      final exception = UnprocessableEntityException();

      expect(exception.status, 422);
      expect(exception.message, '');
      expect(exception.data, isNull);
    });

    test('should return 422, message & data', () async {
      final exception = UnprocessableEntityException(
        data: 'data',
        message: 'message',
      );

      expect(exception.status, 422);
      expect(exception.message, 'message');
      expect(exception.data, 'data');
    });
  });

  group('unauthorized exception', () {
    test('should return 401, empty & null', () async {
      final exception = UnauthorizedException();

      expect(exception.status, 401);
      expect(exception.message, '');
      expect(exception.data, isNull);
    });

    test('should return 401, message & data', () async {
      final exception = UnauthorizedException(
        data: 'data',
        message: 'message',
      );

      expect(exception.status, 401);
      expect(exception.message, 'message');
      expect(exception.data, 'data');
    });
  });

  group('forbidden exception', () {
    test('should return 403, empty & null', () async {
      final exception = ForbiddenException();

      expect(exception.status, 403);
      expect(exception.message, '');
      expect(exception.data, isNull);
    });

    test('should return 401, message & data', () async {
      final exception = ForbiddenException(
        data: 'data',
        message: 'message',
      );

      expect(exception.status, 403);
      expect(exception.message, 'message');
      expect(exception.data, 'data');
    });
  });

  group('request timeout exception', () {
    test('should return 408, empty & null', () async {
      final exception = RequestTimeoutException();

      expect(exception.status, 408);
      expect(exception.message, '');
      expect(exception.data, isNull);
    });

    test('should return 408, message & data', () async {
      final exception = RequestTimeoutException(
        data: 'data',
        message: 'message',
      );

      expect(exception.status, 408);
      expect(exception.message, 'message');
      expect(exception.data, 'data');
    });
  });

  group('not found exception', () {
    test('should return 404, empty & null', () async {
      final exception = NotFoundException();

      expect(exception.status, 404);
      expect(exception.message, '');
      expect(exception.data, isNull);
    });

    test('should return 404, message & data', () async {
      final exception = NotFoundException(
        data: 'data',
        message: 'message',
      );

      expect(exception.status, 404);
      expect(exception.message, 'message');
      expect(exception.data, 'data');
    });
  });

  group('service unavailable exception', () {
    test('should return 503, empty & null', () async {
      final exception = ServiceUnavailableException();

      expect(exception.status, 503);
      expect(exception.message, '');
      expect(exception.data, isNull);
    });

    test('should return 503, message & data', () async {
      final exception = ServiceUnavailableException(
        data: 'data',
        message: 'message',
      );

      expect(exception.status, 503);
      expect(exception.message, 'message');
      expect(exception.data, 'data');
    });
  });
}

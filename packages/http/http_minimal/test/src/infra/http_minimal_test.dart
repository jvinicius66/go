import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http_common/http_common.dart'
    show
        BadRequestException,
        ForbiddenException,
        HttpResponse,
        NotFoundException,
        RequestTimeoutException,
        ServerErrorException,
        ServiceUnavailableException,
        UnauthorizedException,
        UnknowException,
        UnprocessableEntityException;
import 'package:http_minimal/src/infra/http_minimal.dart'
    show HttpMinimal, IClient;
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements IClient {}

void main() {
  late final MockClient mockClient;
  late final HttpMinimal httpClient;
  const mockUrl = 'mock://api.jb.dev.br';
  final Uri mockUri = Uri.parse('$mockUrl/list');

  setUpAll(() {
    mockClient = MockClient();
    httpClient = HttpMinimal(mockUrl, client: mockClient);
    registerFallbackValue(mockUri);
  });

  group('request', () {
    test('should http client return 200', () async {
      when(
        () => mockClient.get(
          mockUri,
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('{"name": "test"}', 200),
      );

      final result = await httpClient.get('list');

      expect(result, isA<HttpResponse>());
      expect(result.status, 200);
      expect(result.data, {'name': 'test'});

      verify(
        () => mockClient.get(
          mockUri,
          headers: any(named: 'headers'),
        ),
      ).called(1);
      verifyNoMoreInteractions(mockClient);
    });

    test('should http client return 400', () async {
      when(
        () => mockClient.get(
          mockUri,
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('', 400),
      );

      expect(
        () async => await httpClient.get('list'),
        throwsA(isA<BadRequestException>()),
      );
    });

    test('should http client return 500', () async {
      when(
        () => mockClient.get(
          mockUri,
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('', 500),
      );

      expect(
        () async => await httpClient.get('list'),
        throwsA(isA<ServerErrorException>()),
      );
    });

    test('should http client return 422', () async {
      when(
        () => mockClient.get(
          mockUri,
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('', 422),
      );

      expect(
        () async => await httpClient.get('list'),
        throwsA(isA<UnprocessableEntityException>()),
      );
    });

    test('should http client return 401', () async {
      when(
        () => mockClient.get(
          mockUri,
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('', 401),
      );

      expect(
        () async => await httpClient.get('list'),
        throwsA(isA<UnauthorizedException>()),
      );
    });

    test('should http client return 403', () async {
      when(
        () => mockClient.get(
          mockUri,
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('', 403),
      );

      expect(
        () async => await httpClient.get('list'),
        throwsA(isA<ForbiddenException>()),
      );
    });

    test('should http client return 408', () async {
      when(
        () => mockClient.get(
          mockUri,
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('', 408),
      );

      expect(
        () async => await httpClient.get('list'),
        throwsA(isA<RequestTimeoutException>()),
      );
    });

    test('should http client return 404', () async {
      when(
        () => mockClient.get(
          mockUri,
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('', 404),
      );

      expect(
        () async => await httpClient.get('list'),
        throwsA(isA<NotFoundException>()),
      );
    });

    test('should http client return 503', () async {
      when(
        () => mockClient.get(
          mockUri,
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('', 503),
      );

      expect(
        () async => await httpClient.get('list'),
        throwsA(isA<ServiceUnavailableException>()),
      );
    });

    test('should http client return unknow', () async {
      when(
        () => mockClient.get(
          mockUri,
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('', 999),
      );

      expect(
        () async => await httpClient.get('list'),
        throwsA(isA<UnknowException>()),
      );
    });
  });
}

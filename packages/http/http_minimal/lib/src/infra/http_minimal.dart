import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:core/core.dart';
import 'package:http/http.dart' as http;
import 'package:http_common/http_common.dart'
    show
        BadRequestException,
        ForbiddenException,
        HttpResponse,
        IHttp,
        NotFoundException,
        RequestTimeoutException,
        ServerErrorException,
        ServiceUnavailableException,
        UnauthorizedException,
        UnknowException,
        UnprocessableEntityException;
import 'package:path/path.dart' as path;

///
/// Http client minimal implementation
///
class HttpMinimal extends IHttp {
  late final IClient _client;

  static const _defaultHeaders = {
    'content-type': 'application/json; charset=utf-8',
    'accept': 'application/json',
  };

  /// Creates [HttpMinimal]
  HttpMinimal(
    this._urlBase, {
    IClient? client,
  }) : _client = client ?? Client(); // coverage:ignore-line

  /// Url base
  final String _urlBase;

  @override
  Future<HttpResponse> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Duration timeout = IHttp.kDefaultConnectionTimeout,
    String apiVersion = '',
  }) async {
    final url = path.join(_urlBase, apiVersion, endpoint);
    final uri = Uri.parse(url).replace(queryParameters: query);

    _logRequest('get', uri.toString(), headers, query);

    final response = await _client
        .get(uri, headers: headers ?? _defaultHeaders)
        .timeout(timeout);
    return _handleResponse(response);
  }

  HttpResponse _handleResponse(http.Response httpResponse) {
    if (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) {
      final responseData = jsonDecode(httpResponse.body);
      _logResponse(
        httpResponse.request?.method ?? '',
        httpResponse.request?.url.toString() ?? '',
        responseData,
      );
      return HttpResponse(
        data: responseData,
        status: httpResponse.statusCode,
      );
    } else {
      final String error = '${httpResponse.statusCode} - ${httpResponse.body}';
      _logError(
        httpResponse.request?.method ?? '',
        httpResponse.request?.url.toString() ?? '',
        error,
      );

      switch (httpResponse.statusCode) {
        case 400:
          throw BadRequestException(message: error);
        case 500:
          throw ServerErrorException(message: error);
        case 422:
          throw UnprocessableEntityException(message: error);
        case 401:
          throw UnauthorizedException(message: error);
        case 403:
          throw ForbiddenException(message: error);
        case 408:
          throw RequestTimeoutException(message: error);
        case 404:
          throw NotFoundException(message: error);
        case 503:
          throw ServiceUnavailableException(message: error);
        default:
          throw UnknowException(message: error);
      }
    }
  }

  void _logRequest(
    String verb,
    String url,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  ) =>
      _printLog(
        'request:\n$verb - $url\n ${{
          'headers': headers,
          'query': query,
        }.print}',
      );

  void _logResponse(
    String verb,
    String url,
    dynamic response,
  ) =>
      _printLog('response:\n$verb -  $url\n ${response.toString()}');

  void _logError(
    String verb,
    String url,
    dynamic error,
  ) =>
      _printLog('error:\n$verb -  $url\n ${error.toString()}');
}

///
/// Client interface
///
abstract class IClient {
  /// Method get
  Future<http.Response> get(Uri url, {Map<String, String>? headers});
}

///
/// Client implementation
///
class Client implements IClient {
  @override // coverage:ignore-line
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) =>
      http.get(url, headers: headers); // coverage:ignore-line
}

void _printLog(final String text) => dev.log('\x1B[32m $text', name: 'HTTP');

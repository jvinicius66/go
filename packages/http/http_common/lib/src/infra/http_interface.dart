import 'dart:async';

import '../domain/entities/entities.dart' show HttpResponse;

///
/// Http client interface
///
abstract class IHttp {
  /// Default timeout duration for a connection.
  ///
  /// This duration specifies how long to wait before a connection attempt is abandoned.
  /// It is initialized with a `Duration` of 30 seconds.
  static const kDefaultConnectionTimeout = Duration(seconds: 30);

  ///
  /// Http [get] method
  ///
  Future<HttpResponse> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Duration timeout = kDefaultConnectionTimeout,
    String apiVersion = '',
  });
}

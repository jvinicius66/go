import 'package:core/core.dart' show BaseEntity;

///
/// Default response for Http requests.
/// [data] is a Map with the root key `body`.
///
class HttpResponse extends BaseEntity {
  /// Creates [HttpResponse]
  HttpResponse({
    required this.status,
    this.data,
  });

  /// Http staus code
  final int status;

  /// Response data
  final dynamic data;

  /// Creates success response with data
  factory HttpResponse.success(
    Object? data, {
    int status = 200,
  }) =>
      HttpResponse(status: status, data: data);

  /// Creates an empty response with given status code
  factory HttpResponse.empty({int status = 204}) =>
      HttpResponse(status: status);
}

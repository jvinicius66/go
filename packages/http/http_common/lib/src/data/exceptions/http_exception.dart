import 'package:core/core.dart' show BaseException;

///
/// Http exception
///
sealed class IHttpException extends BaseException {
  /// Http status code
  final int? status;

  /// Creates [IHttpException]
  IHttpException(
    this.status, {
    super.data,
    super.message = '',
  });
}

///
/// Parse exception unknow
///
class ParseException extends IHttpException {
  /// Creates [ParseException]
  ParseException({super.message}) : super(null);
}

///
/// Exception for unknow
///
class UnknowException extends IHttpException {
  /// Creates [UnknowException]
  UnknowException({super.message}) : super(null);
}

///
/// Exception for bad request
///
class BadRequestException extends IHttpException {
  /// Creates [BadRequestException]
  BadRequestException({
    super.data,
    super.message,
  }) : super(400); // coverage:ignore-line
}

///
/// Exception for server error
///
class ServerErrorException extends IHttpException {
  /// Creates [ServerErrorException]
  ServerErrorException({
    super.data,
    super.message,
  }) : super(500); // coverage:ignore-line
}

///
/// Exception for unprocessable entity
///
class UnprocessableEntityException extends IHttpException {
  /// Creates [UnprocessableEntityException]
  UnprocessableEntityException({
    super.data,
    super.message,
  }) : super(422); // coverage:ignore-line
}

///
/// Exception for unauthorized
///
class UnauthorizedException extends IHttpException {
  /// Creates [UnauthorizedException]
  UnauthorizedException({
    super.data,
    super.message,
  }) : super(401); // coverage:ignore-line
}

///
/// Exception for forbidden
///
class ForbiddenException extends IHttpException {
  /// Creates [ForbiddenException]
  ForbiddenException({
    super.data,
    super.message,
  }) : super(403); // coverage:ignore-line
}

///
/// Exception for request timeout
///
class RequestTimeoutException extends IHttpException {
  /// Creates [RequestTimeoutException]
  RequestTimeoutException({
    super.data,
    super.message,
  }) : super(408); // coverage:ignore-line
}

/// Exception for not found
class NotFoundException extends IHttpException {
  /// Creates a new [NotFoundException]
  NotFoundException({Object? super.data, super.message}) : super(404);
}

/// Exception for service unavailable
class ServiceUnavailableException extends IHttpException {
  /// Creates a new [ServiceUnavailableException]
  ServiceUnavailableException({
    super.data,
    super.message,
  }) : super(503); // coverage:ignore-line
}

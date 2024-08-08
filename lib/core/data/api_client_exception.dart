class ApiClientException implements Exception {
  final dynamic originalException;
  final int? httpStatusCode;
  final String? appErrorCode;
  final String? appErrorMessage;

  ApiClientException({
    required this.originalException,
    this.httpStatusCode,
    this.appErrorCode,
    this.appErrorMessage,
  });
}


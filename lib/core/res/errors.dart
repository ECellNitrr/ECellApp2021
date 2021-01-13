// Common Errors
class NetworkException implements Exception {}

class ValidationException extends Error {
  final String description;

  ValidationException(this.description);
}

class ResponseException implements Exception {
  final String message;

  ResponseException(this.message);
}

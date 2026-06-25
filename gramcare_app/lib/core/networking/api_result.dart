import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

/// Represents the result of an API call - either success or failure.
/// Uses Either from dartz for functional error handling.
@freezed
sealed class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = ApiSuccess<T>;
  const factory ApiResult.failure({required ApiFailure failure}) =
      ApiFailureResult<T>;
}

/// Structured API failure types.
@freezed
sealed class ApiFailure with _$ApiFailure {
  const factory ApiFailure.serverError({
    required int statusCode,
    required String message,
    String? details,
  }) = ServerError;

  const factory ApiFailure.networkError({
    required String message,
  }) = NetworkError;

  const factory ApiFailure.timeout({
    String? message,
  }) = TimeoutError;

  const factory ApiFailure.unauthorized({
    String? message,
  }) = UnauthorizedError;

  const factory ApiFailure.forbidden({
    String? message,
  }) = ForbiddenError;

  const factory ApiFailure.notFound({
    String? message,
  }) = NotFoundError;

  const factory ApiFailure.validationError({
    required String message,
    Map<String, List<String>>? fieldErrors,
  }) = ValidationError;

  const factory ApiFailure.parseError({
    required String message,
  }) = ParseError;

  const factory ApiFailure.unknown({
    String? message,
    Object? error,
  }) = UnknownError;
}

/// Extension to get user-friendly error messages.
extension ApiFailureX on ApiFailure {
  String get userMessage => when(
        serverError: (code, msg, _) => msg,
        networkError: (msg) =>
            'No internet connection. Your data is saved offline.',
        timeout: (msg) => 'Request timed out. Please try again.',
        unauthorized: (msg) => 'Session expired. Please login again.',
        forbidden: (msg) => 'You do not have permission for this action.',
        notFound: (msg) => 'The requested resource was not found.',
        validationError: (msg, _) => msg,
        parseError: (msg) => 'Something went wrong. Please try again.',
        unknown: (msg, _) => msg ?? 'An unexpected error occurred.',
      );
}

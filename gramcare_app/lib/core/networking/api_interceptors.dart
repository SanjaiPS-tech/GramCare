import 'dart:io';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../constants/api_endpoints.dart';
import '../security/auth_token_manager.dart';

/// Interceptor that attaches JWT access token to all outgoing requests
/// and handles automatic token refresh on 401 responses.
class AuthInterceptor extends Interceptor {
  final AuthTokenManager _tokenManager;
  final Dio _dio;
  bool _isRefreshing = false;

  AuthInterceptor(this._tokenManager, this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _tokenManager.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;
      try {
        final refreshToken = await _tokenManager.getRefreshToken();
        if (refreshToken == null) {
          await _tokenManager.clearTokens();
          _isRefreshing = false;
          handler.reject(err);
          return;
        }

        // Attempt token refresh
        final response = await _dio.post(
          ApiEndpoints.refreshToken,
          data: {'refreshToken': refreshToken},
          options: Options(
            headers: {'Authorization': ''},
          ),
        );

        if (response.statusCode == 200) {
          final newAccessToken = response.data['accessToken'] as String;
          final newRefreshToken = response.data['refreshToken'] as String;

          await _tokenManager.saveTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
          );

          // Retry the original request with new token
          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';

          final retryResponse = await _dio.fetch(err.requestOptions);
          _isRefreshing = false;
          handler.resolve(retryResponse);
          return;
        }
      } catch (e) {
        await _tokenManager.clearTokens();
        _isRefreshing = false;
      }
    }
    handler.next(err);
  }
}

/// Interceptor for structured logging of all HTTP traffic.
class LoggingInterceptor extends Interceptor {
  final Logger _logger;

  LoggingInterceptor(this._logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d(
      '→ ${options.method} ${options.uri}\n'
      'Headers: ${options.headers}\n'
      'Data: ${options.data}',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
      '← ${response.statusCode} ${response.requestOptions.uri}\n'
      'Data: ${response.data}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      '✗ ${err.response?.statusCode ?? 'N/A'} ${err.requestOptions.uri}\n'
      'Error: ${err.message}\n'
      'Response: ${err.response?.data}',
    );
    handler.next(err);
  }
}

/// Interceptor for automatic retry on transient failures.
class RetryInterceptor extends Interceptor {
  final Dio _dio;
  final int maxRetries;
  final Duration retryDelay;

  RetryInterceptor(
    this._dio, {
    this.maxRetries = 2,
    this.retryDelay = const Duration(seconds: 1),
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final isRetryable = _isRetryableError(err);
    final retryCount = err.requestOptions.extra['retryCount'] as int? ?? 0;

    if (isRetryable && retryCount < maxRetries) {
      await Future.delayed(retryDelay * (retryCount + 1));
      err.requestOptions.extra['retryCount'] = retryCount + 1;

      try {
        final response = await _dio.fetch(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        // Fall through to reject
      }
    }
    handler.next(err);
  }

  bool _isRetryableError(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        (err.error is SocketException) ||
        (err.response?.statusCode != null &&
            err.response!.statusCode! >= 500);
  }
}

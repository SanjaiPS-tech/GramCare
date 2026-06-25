import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../constants/app_constants.dart';
import 'secure_storage_service.dart';

/// Manages JWT access and refresh tokens with secure storage.
class AuthTokenManager {
  final SecureStorageService _storage;

  AuthTokenManager(this._storage);

  /// Save both tokens securely.
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(AppConstants.keyAccessToken, accessToken),
      _storage.write(AppConstants.keyRefreshToken, refreshToken),
    ]);
  }

  /// Get the current access token.
  Future<String?> getAccessToken() async {
    return _storage.read(AppConstants.keyAccessToken);
  }

  /// Get the current refresh token.
  Future<String?> getRefreshToken() async {
    return _storage.read(AppConstants.keyRefreshToken);
  }

  /// Check if user is authenticated (has non-expired token).
  Future<bool> isAuthenticated() async {
    final token = await getAccessToken();
    if (token == null) return false;
    try {
      return !JwtDecoder.isExpired(token);
    } catch (_) {
      return false;
    }
  }

  /// Decode and return token claims.
  Future<Map<String, dynamic>?> getTokenClaims() async {
    final token = await getAccessToken();
    if (token == null) return null;
    try {
      return JwtDecoder.decode(token);
    } catch (_) {
      return null;
    }
  }

  /// Get user role from token claims.
  Future<String?> getUserRole() async {
    final claims = await getTokenClaims();
    return claims?['role'] as String?;
  }

  /// Get user ID from token claims.
  Future<String?> getUserId() async {
    final claims = await getTokenClaims();
    return claims?['sub'] as String?;
  }

  /// Check token expiration time remaining.
  Future<Duration?> getTokenTimeRemaining() async {
    final token = await getAccessToken();
    if (token == null) return null;
    try {
      final expDate = JwtDecoder.getExpirationDate(token);
      final remaining = expDate.difference(DateTime.now());
      return remaining.isNegative ? Duration.zero : remaining;
    } catch (_) {
      return null;
    }
  }

  /// Clear all tokens (logout).
  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(AppConstants.keyAccessToken),
      _storage.delete(AppConstants.keyRefreshToken),
      _storage.delete(AppConstants.keyUserId),
      _storage.delete(AppConstants.keyUserRole),
    ]);
  }

  /// Save user metadata alongside tokens.
  Future<void> saveUserMeta({
    required String userId,
    required String userRole,
  }) async {
    await Future.wait([
      _storage.write(AppConstants.keyUserId, userId),
      _storage.write(AppConstants.keyUserRole, userRole),
    ]);
  }
}

/// Provider for AuthTokenManager.
final authTokenManagerProvider = Provider<AuthTokenManager>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return AuthTokenManager(storage);
});

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/dio_client.dart';
import '../../../../core/security/auth_token_manager.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/auth_models.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final DioClient _dioClient;
  final AuthTokenManager _tokenManager;

  AuthRepositoryImpl(this._dioClient, this._tokenManager);

  @override
  Future<ApiResult<AuthResponseModel>> login(LoginRequestModel request) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.login,
        data: request.toJson(),
      );
      
      final authResponse = AuthResponseModel.fromJson(response.data);
      
      await _tokenManager.saveTokens(
        accessToken: authResponse.accessToken,
        refreshToken: authResponse.refreshToken,
      );
      
      await _tokenManager.saveUserMeta(
        userId: authResponse.userId,
        userRole: authResponse.role,
      );
      
      return ApiResult.success(data: authResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
          return const ApiResult.failure(failure: ApiFailure.unauthorized(message: 'Invalid phone or password'));
      }
      return ApiResult.failure(failure: ApiFailure.serverError(
        statusCode: e.response?.statusCode ?? 500,
        message: e.message ?? 'Unknown error',
      ));
    } catch (e) {
      return ApiResult.failure(failure: ApiFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> register(RegisterRequestModel request) async {
    try {
      await _dioClient.post(
        ApiEndpoints.register,
        data: request.toJson(),
      );
      return const ApiResult.success(data: null);
    } on DioException catch (e) {
      return ApiResult.failure(failure: ApiFailure.serverError(
        statusCode: e.response?.statusCode ?? 500,
        message: e.response?.data['error'] ?? e.message ?? 'Registration failed',
      ));
    } catch (e) {
      return ApiResult.failure(failure: ApiFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<ApiResult<void>> logout() async {
    try {
       final phone = (await _tokenManager.getTokenClaims())?['sub'];
       await _dioClient.post(ApiEndpoints.logout, data: {'phone': phone});
       await _tokenManager.clearTokens();
       return const ApiResult.success(data: null);
    } catch (e) {
       await _tokenManager.clearTokens();
       return ApiResult.failure(failure: ApiFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<ApiResult<UserEntity>> getProfile() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.userProfile);
      return ApiResult.success(data: UserEntity.fromJson(response.data));
    } on DioException catch (e) {
      return ApiResult.failure(failure: ApiFailure.serverError(
        statusCode: e.response?.statusCode ?? 500,
        message: e.message ?? 'Failed to fetch profile',
      ));
    }
  }

  @override
  Future<bool> checkAuthStatus() async {
    return await _tokenManager.isAuthenticated();
  }
}

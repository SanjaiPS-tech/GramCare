import 'package:dartz/dartz.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/entities/user_entity.dart';
import '../models/auth_models.dart';

abstract class AuthRepository {
  Future<ApiResult<AuthResponseModel>> login(LoginRequestModel request);
  Future<ApiResult<void>> register(RegisterRequestModel request);
  Future<ApiResult<void>> logout();
  Future<ApiResult<UserEntity>> getProfile();
  Future<bool> checkAuthStatus();
}

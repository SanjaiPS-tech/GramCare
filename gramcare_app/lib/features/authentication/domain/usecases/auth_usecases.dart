import '../../../../core/networking/api_result.dart';
import '../../data/models/auth_models.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<ApiResult<AuthResponseModel>> call(String phone, String password) {
    return _repository.login(LoginRequestModel(phone: phone, password: password));
  }
}

class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<ApiResult<void>> call(RegisterRequestModel request) {
    return _repository.register(request);
  }
}

class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  Future<ApiResult<void>> call() {
    return _repository.logout();
  }
}

class CheckAuthStatusUseCase {
  final AuthRepository _repository;

  CheckAuthStatusUseCase(this._repository);

  Future<bool> call() {
    return _repository.checkAuthStatus();
  }
}

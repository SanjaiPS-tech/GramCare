import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/networking/dio_client.dart';
import '../../../../core/security/auth_token_manager.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_usecases.dart';
import '../providers/auth_state.dart';
import '../../data/models/auth_models.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  final tokenManager = ref.read(authTokenManagerProvider);
  return AuthRepositoryImpl(dioClient, tokenManager);
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  return RegisterUseCase(ref.read(authRepositoryProvider));
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref.read(authRepositoryProvider));
});

final checkAuthStatusUseCaseProvider = Provider<CheckAuthStatusUseCase>((ref) {
  return CheckAuthStatusUseCase(ref.read(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckAuthStatusUseCase _checkAuthStatusUseCase;

  AuthNotifier({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required LogoutUseCase logoutUseCase,
    required CheckAuthStatusUseCase checkAuthStatusUseCase,
  })  : _loginUseCase = loginUseCase,
        _registerUseCase = registerUseCase,
        _logoutUseCase = logoutUseCase,
        _checkAuthStatusUseCase = checkAuthStatusUseCase,
        super(const AuthState.initial()) {
    checkStatus();
  }

  Future<void> checkStatus() async {
    final isAuthenticated = await _checkAuthStatusUseCase();
    if (isAuthenticated) {
      state = const AuthState.authenticated();
    } else {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> login(String phone, String password) async {
    state = const AuthState.loading();
    final result = await _loginUseCase(phone, password);
    result.when(
      success: (data) {
        state = const AuthState.authenticated();
      },
      failure: (failure) {
        state = AuthState.error(failure.userMessage);
      },
    );
  }

  Future<void> register(RegisterRequestModel request) async {
    state = const AuthState.loading();
    final result = await _registerUseCase(request);
    result.when(
      success: (_) {
        state = const AuthState.unauthenticated();
      },
      failure: (failure) {
        state = AuthState.error(failure.userMessage);
      },
    );
  }

  Future<void> logout() async {
    state = const AuthState.loading();
    await _logoutUseCase();
    state = const AuthState.unauthenticated();
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    loginUseCase: ref.read(loginUseCaseProvider),
    registerUseCase: ref.read(registerUseCaseProvider),
    logoutUseCase: ref.read(logoutUseCaseProvider),
    checkAuthStatusUseCase: ref.read(checkAuthStatusUseCaseProvider),
  );
});

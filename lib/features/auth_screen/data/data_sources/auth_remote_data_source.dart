import 'package:arch_team_power/core/services/api_service.dart';
import 'package:arch_team_power/features/auth_screen/domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> signup(String name, String email, String password);
  Future<void> sendVerifyCode(String email);
  Future<void> resendVerifyCode(String email);
  Future<UserEntity> checkResetCode(String email, String code);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserEntity> login(String email, String password) async {
    final response = await apiService.post(
      endPoint: 'login',
      data: {'email': email, 'password': password},
    );
    return UserEntity.fromJson(response);
  }

  @override
  Future<UserEntity> signup(String name, String email, String password) async {
    final response = await apiService.post(
      endPoint: 'register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
        'role': 'user',
      },
    );
    return UserEntity.fromJson(response);
  }

  @override
  Future<void> sendVerifyCode(String email) async {
    await apiService.post(
      endPoint: 'email/forgot-password',
      data: {'email': email},
    );
  }

  @override
  Future<void> resendVerifyCode(String email) async {
    await apiService.post(
      endPoint: 'email/resend-code',
      data: {'email': email},
    );
  }

  @override
  Future<UserEntity> checkResetCode(String email, String code) async {
    final response = await apiService.post(
      endPoint: 'check/password-code',
      data: {'email': email, 'code': code},
    );
    return UserEntity.fromJson(response);
  }
}

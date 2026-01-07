import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/auth_screen/data/data_sources/auth_local_data_source.dart';
import 'package:arch_team_power/features/auth_screen/data/data_sources/auth_remote_data_source.dart';
import 'package:arch_team_power/features/auth_screen/domain/entities/user_entity.dart';
import 'package:arch_team_power/features/auth_screen/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepoImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(email, password);

      await localDataSource.saveToken(user.userToken);

      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.signup(name, email, password);

      await localDataSource.saveToken(user.userToken);

      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> checkResetCode({
    required String email,
    required String code,
  }) async {
    try {
      final response = await remoteDataSource.checkResetCode(email, code);
      await localDataSource.saveToken(response.userToken);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> resendVerifyCode({
    required String email,
  }) async {
    try {
      await remoteDataSource.resendVerifyCode(email);
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendVerifyCode({required String email}) async {
    try {
      await remoteDataSource.sendVerifyCode(email);
      return const Right(unit);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}

class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource localDataSource;

  AuthInterceptor(this.localDataSource);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await localDataSource.getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}

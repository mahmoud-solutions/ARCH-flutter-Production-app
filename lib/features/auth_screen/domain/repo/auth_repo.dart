import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/auth_screen/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, Unit>> sendVerifyCode({required String email});
  Future<Either<Failure, Unit>> resendVerifyCode({required String email});
  Future<Either<Failure, UserEntity>> checkResetCode({
    required String email,
    required String code,
  });
}

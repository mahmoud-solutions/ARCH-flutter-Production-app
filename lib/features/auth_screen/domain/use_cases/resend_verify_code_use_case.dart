import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/auth_screen/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class ResendVerifyCodeUseCase {
  final AuthRepo authRepo;

  ResendVerifyCodeUseCase({required this.authRepo});
  Future<Either<Failure, Unit>> call(String email) {
    return authRepo.resendVerifyCode(email: email);
  }
}

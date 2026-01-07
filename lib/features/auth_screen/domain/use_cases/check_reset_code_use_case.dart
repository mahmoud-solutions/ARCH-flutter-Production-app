import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/auth_screen/domain/entities/user_entity.dart';
import 'package:arch_team_power/features/auth_screen/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class CheckResetCodeUseCase {
  final AuthRepo authRepo;

  CheckResetCodeUseCase({required this.authRepo});
  Future<Either<Failure, UserEntity>> call(String email, String code) {
    return authRepo.checkResetCode(email: email, code: code);
  }
}

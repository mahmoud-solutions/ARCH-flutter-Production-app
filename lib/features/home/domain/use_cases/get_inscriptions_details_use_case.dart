import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:arch_team_power/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetInscriptionsDetailsUseCase {
  final HomeRepo homeRepo;

  GetInscriptionsDetailsUseCase({required this.homeRepo});
  Future<Either<Failure, InscriptionsEntity>> call({required int id}) async {
    return await homeRepo.getInscriptionsDetails(id: id);
  }
}

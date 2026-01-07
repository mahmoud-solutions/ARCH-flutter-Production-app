import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:arch_team_power/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetSubPlacesDetailsUseCase {
  final HomeRepo homeRepo;
  GetSubPlacesDetailsUseCase({required this.homeRepo});
  Future<Either<Failure, SubPlaceEntity>> call({required int id}) async {
    return await homeRepo.getSubPlacesDetails(id: id);
  }
}

import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:arch_team_power/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetSubPlacesUseCase {
  final HomeRepo homeRepo;

  GetSubPlacesUseCase({required this.homeRepo});
  Future<Either<Failure, List<SubPlaceEntity>>> call() async {
    return await homeRepo.getSubPlaces();
  }
}

import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/core/use_cases/use_case_no_param.dart';
import 'package:arch_team_power/features/home/domain/entities/popular_places_entity.dart';
import 'package:arch_team_power/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchPopularPlacesUseCase extends UseCaseNoParam {
  final HomeRepo homeRepo;

  FetchPopularPlacesUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<PopularSectionEntity>>> call() {
    return homeRepo.fetchPopularPlaces();
  }
}

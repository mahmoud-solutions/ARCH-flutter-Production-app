import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/core/use_cases/use_case_no_param.dart';
import 'package:arch_team_power/features/details_screen/domain/entities/popular_places_details_entity.dart';
import 'package:arch_team_power/features/details_screen/domain/repo/popular_places_details_repo.dart';
import 'package:dartz/dartz.dart';

class FetchPopularPlacesDetailsUseCase extends UseCaseNoParam {
  final PopularPlacesDetailsRepo popularPlacesDetailsRepo;

  FetchPopularPlacesDetailsUseCase(this.popularPlacesDetailsRepo);

  @override
  Future<Either<Failure, PopularPlacesDetailsEntity>> call() {
    return popularPlacesDetailsRepo.fetchPopularPlacesDetails();
  }
}

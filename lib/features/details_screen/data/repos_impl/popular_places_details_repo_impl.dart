import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/details_screen/data/data_sources/popular_places_details_local_data_source.dart';
import 'package:arch_team_power/features/details_screen/data/data_sources/popular_places_details_remote_data_source.dart';
import 'package:arch_team_power/features/details_screen/domain/entities/popular_places_details_entity.dart';
import 'package:arch_team_power/features/details_screen/domain/repo/popular_places_details_repo.dart';
import 'package:dartz/dartz.dart';

class PopularPlacesDetailsRepoImpl extends PopularPlacesDetailsRepo {
  final PopularPlacesDetailsRemoteDataSource
  popularPlacesDetailsRemoteDataSource;
  final PopularPlacesDetailsLocalDataSource popularPlacesDetailsLocalDataSource;

  PopularPlacesDetailsRepoImpl(
    this.popularPlacesDetailsRemoteDataSource,
    this.popularPlacesDetailsLocalDataSource,
  );

  @override
  Future<Either<Failure, PopularPlacesDetailsEntity>>
  fetchPopularPlacesDetails() {
    // TODO: implement fetchPopularPlaces
    throw UnimplementedError();
  }
}

import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/details_screen/domain/entities/popular_places_details_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PopularPlacesDetailsRepo {
  Future<Either<Failure, PopularPlacesDetailsEntity>>
  fetchPopularPlacesDetails();
}

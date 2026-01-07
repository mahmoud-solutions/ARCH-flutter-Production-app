import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/home/data/model/banner/banner.dart';
import 'package:arch_team_power/features/home/data/model/home/slider.data.dart';
import 'package:arch_team_power/features/home/data/model/popular/popular_place.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:arch_team_power/features/home/domain/entities/popular_places_entity.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  // Future<Either<Failure, List<Slider>>> fetchSlider();
  Future<Either<Failure, List<Sliderr>>> fetchSliders();
  Future<Either<Failure, List<PopularSectionEntity>>> fetchPopularPlaces();
  Future<Either<Failure, List<PopularPlace>>> fetchAllPopularPlaces();
  Future<Either<Failure, List<Bannner>>> fetchBanners();
  Future<Either<Failure, List<InscriptionsEntity>>> getInscriptions();
  Future<Either<Failure, InscriptionsEntity>> getInscriptionsDetails({
    required int id,
  });
  Future<Either<Failure, List<SubPlaceEntity>>> getSubPlaces();
  Future<Either<Failure, SubPlaceEntity>> getSubPlacesDetails({
    required int id,
  });
}

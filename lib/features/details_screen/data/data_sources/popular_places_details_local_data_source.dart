import 'package:arch_team_power/features/details_screen/domain/entities/popular_places_details_entity.dart';

abstract class PopularPlacesDetailsLocalDataSource {
  Future<PopularPlacesDetailsEntity> getPopularPlacesDetails();
}

class PopularPlacesDetailsLocalDataSourceImpl
    implements PopularPlacesDetailsLocalDataSource {
  @override
  Future<PopularPlacesDetailsEntity> getPopularPlacesDetails() {
    // TODO: implement getPopularPlaces
    throw UnimplementedError();
  }
}

import 'package:arch_team_power/core/services/api_service.dart';
import 'package:arch_team_power/features/details_screen/domain/entities/popular_places_details_entity.dart';

abstract class PopularPlacesDetailsRemoteDataSource {
  Future<List<PopularPlacesDetailsEntity>> fetchPopularPlaces();
}

class PopularPlacesDetailsRemoteDataSourceImpl
    implements PopularPlacesDetailsRemoteDataSource {
  final ApiService apiService;

  PopularPlacesDetailsRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<PopularPlacesDetailsEntity>> fetchPopularPlaces() {
    // TODO: implement fetchPopularPlaces
    throw UnimplementedError();
  }
}

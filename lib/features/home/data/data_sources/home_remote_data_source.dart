import 'package:arch_team_power/core/services/api_service.dart';
import 'package:arch_team_power/features/home/data/model/banner/banner.dart';
import 'package:arch_team_power/features/home/data/model/home/slider.data.dart';
import 'package:arch_team_power/features/home/data/model/inscriptions_library_model/ruin.dart';
import 'package:arch_team_power/features/home/data/model/popular/popular_place.dart';
import 'package:arch_team_power/features/home/data/model/sub_places/sub_places_model.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<List<Sliderr>> fetchSliders();
  Future<List<PopularPlace>> fetchPopularPlaces();
  Future<List<Bannner>> fetchBanner();
  Future<List<InscriptionsEntity>> getInscriptions();
  Future<InscriptionsEntity> getInscriptionsDetails({required int id});
  Future<List<SubPlaceEntity>> getSubPlaces();
  Future<SubPlaceEntity> getSubPlacesDetails({required int id});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Sliderr>> fetchSliders() async {
    try {
      final response = await apiService.get(endPoint: 'home');
      final dataJson = response['data']['sliders'] as List<dynamic>?;
      final sliders = dataJson
          ?.map((e) => Sliderr.fromJson(e as Map<String, dynamic>))
          .toList();
      return sliders ?? [];
    } catch (e) {
      throw Exception('Failed to fetch sliders: $e');
    }
  }

  @override
  Future<List<PopularPlace>> fetchPopularPlaces() async {
    try {
      final response = await apiService.get(endPoint: 'popular-places');

      if (response['data'] == null) {
        throw Exception('popular places is null');
      }

      return (response['data'] as List)
          .map((e) => PopularPlace.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error occurred');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<List<Bannner>> fetchBanner() async {
    try {
      final response = await apiService.get(endPoint: 'banners');
      final dataJson = response['data'] as List<dynamic>?;

      final banners = dataJson
          ?.map((e) => Bannner.fromJson(e as Map<String, dynamic>))
          .toList();

      return banners ?? [];
    } catch (e) {
      throw Exception('Failed to fetch Banner: $e');
    }
  }

  @override
  Future<List<InscriptionsEntity>> getInscriptions() async {
    final response = await apiService.get(endPoint: 'places/category/1');

    final ruinsList = response['data']['ruins'] as List;

    return ruinsList.map((e) => RuinModel.fromJson(e)).toList();
  }

  @override
  Future<RuinModel> getInscriptionsDetails({required int id}) async {
    final response = await apiService.get(endPoint: 'places/$id');

    return RuinModel.fromJson(response['data']);
  }

  @override
  Future<List<SubPlaceEntity>> getSubPlaces() async {
    final response = await apiService.get(endPoint: 'sub-places');
    final places = (response['data']['sub_places'] as List)
        .map((e) => SubPlaceModel.fromJson(e))
        .toList();
    return places;
  }

  @override
  Future<SubPlaceEntity> getSubPlacesDetails({required int id}) async {
    final response = await apiService.get(endPoint: 'sub-places/$id');
    final place = SubPlaceModel.fromJson(response['data']);

    return place;
  }
}

import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/core/services/api_service.dart';
import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/auth_screen/data/data_sources/auth_local_data_source.dart';
import 'package:arch_team_power/features/favorite_screen/data/models/get/get_favourite/get_favourite_response.dart';
import 'package:arch_team_power/features/favorite_screen/data/models/post/post_favourite/post_favourite_respose.dart';
import 'package:dio/dio.dart';

abstract class FavouriteRemoteDataSource {
  Future<PostFavouriteResponse> toggleFavourite({
    required int placeId,
    required String type,
  });
  Future<GetFavouriteResponse> getFavourites();
}

class FavouriteRemoteDataSourceImpl implements FavouriteRemoteDataSource {
  final ApiService apiService;

  FavouriteRemoteDataSourceImpl(this.apiService);

  @override
  Future<PostFavouriteResponse> toggleFavourite({
    required int placeId,
    required String type,
  }) async {
    try {
      await sl<AuthLocalDataSource>().getToken();
      final response = await apiService.post(
        endPoint: 'favorites/toggle',
        data: {'object_id': placeId, 'type': type},
      );
      return PostFavouriteResponse.fromJson(response);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<GetFavouriteResponse> getFavourites() async {
    try {
      final data = await apiService.get(endPoint: 'favorites');

      final response = GetFavouriteResponse.fromJson(data);

      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure('Something went wrong, please try again later');
    }
  }
}

import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/favorite_screen/data/data%20source/favourite_remote_data_source.dart';
import 'package:arch_team_power/features/favorite_screen/data/models/get/get_favourite/get_favourite_response.dart';
import 'package:arch_team_power/features/favorite_screen/data/models/post/post_favourite/post_favourite_respose.dart';
import 'package:arch_team_power/features/favorite_screen/domain/repo/favourite_repo.dart';
import 'package:dartz/dartz.dart';

class FavouriteRepositoryImpl implements FavouriteRepoAbstract {
  final FavouriteRemoteDataSource remoteDataSource;

  FavouriteRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PostFavouriteResponse>> toggleFavourite({
    required int placeId,
    required String type,
  }) async {
    try {
      final response = await remoteDataSource.toggleFavourite(
        placeId: placeId,
        type: type,
      );

      if (response.success == true) {
        return Right(response);
      } else {
        return Left(ServerFailure(response.message ?? 'Unknown error'));
      }
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetFavouriteResponse>> getFavourites() async {
    try {
      final response = await remoteDataSource.getFavourites();
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerFailure('Something went wrong, please try again later'),
      );
    }
  }
}

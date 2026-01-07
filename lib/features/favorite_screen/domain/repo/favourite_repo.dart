import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/favorite_screen/data/models/get/get_favourite/get_favourite_response.dart';
import 'package:arch_team_power/features/favorite_screen/data/models/post/post_favourite/post_favourite_respose.dart';
import 'package:dartz/dartz.dart';

abstract class FavouriteRepoAbstract {
  Future<Either<Failure, PostFavouriteResponse>> toggleFavourite({
    required int placeId,
    required String type,
  });
  Future<Either<Failure, GetFavouriteResponse>> getFavourites();
}

import 'package:arch_team_power/features/favorite_screen/data/models/get/get_favourite/get_favourite_response.dart';

abstract class GetFavouriteState {}

class GetFavouriteInitial extends GetFavouriteState {}

class FavouriteLoading extends GetFavouriteState {}

class GetFavouriteLoaded extends GetFavouriteState {
  final GetFavouriteResponse response;
  GetFavouriteLoaded(this.response);
}

class GetFavouriteError extends GetFavouriteState {
  final String message;
  GetFavouriteError(this.message);
}

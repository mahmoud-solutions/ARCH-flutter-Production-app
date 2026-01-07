import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/favorite_screen/data/models/get/get_favourite/get_favourite_response.dart';
import 'package:arch_team_power/features/favorite_screen/domain/repo/favourite_repo.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/get_favourite_cubite/cubit/get_favourite_cubit_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFavouriteCubit extends Cubit<GetFavouriteState> {
  final FavouriteRepoAbstract repository;

  GetFavouriteCubit(this.repository) : super(GetFavouriteInitial());

  Future<void> fetchFavourites() async {
    emit(FavouriteLoading());

    final Either<Failure, GetFavouriteResponse> result = await repository
        .getFavourites();

    result.fold(
      (failure) => emit(GetFavouriteError(failure.message)),
      (response) => emit(GetFavouriteLoaded(response)),
    );
  }
}

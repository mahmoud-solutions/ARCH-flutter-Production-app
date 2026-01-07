import 'package:arch_team_power/features/favorite_screen/domain/repo/favourite_repo.dart';
import 'package:arch_team_power/features/favorite_screen/presentation/manger/post_favouitr_cubit/cubit/favorite_key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostFavouriteCubit extends Cubit<Map<String, Set<int>>> {
  final FavouriteRepoAbstract repo;

  PostFavouriteCubit(this.repo)
    : super({FavouriteType.ruin: <int>{}, FavouriteType.subPlace: <int>{}});

  Future<void> loadInitialFavourites() async {
    final result = await repo.getFavourites();

    result.fold((failure) {}, (response) {
      final favouriteIds = response.data?.map((e) => e.id!).toSet() ?? <int>{};

      emit({FavouriteType.ruin: favouriteIds, FavouriteType.subPlace: <int>{}});
    });
  }

  Future<void> toggleFavourite({required int id, required String type}) async {
    final result = await repo.toggleFavourite(placeId: id, type: type);

    result.fold((failure) {}, (response) {
      final newState = {
        FavouriteType.ruin: Set<int>.from(state[FavouriteType.ruin]!),
        FavouriteType.subPlace: Set<int>.from(state[FavouriteType.subPlace]!),
      };

      if (response.data?.isFavorite == true) {
        newState[type]!.add(id);
      } else {
        newState[type]!.remove(id);
      }

      emit(newState);
    });
  }

  bool isFavourite(int id, String type) {
    return state[type]?.contains(id) ?? false;
  }
}

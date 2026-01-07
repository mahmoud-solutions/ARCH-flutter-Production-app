import 'package:arch_team_power/features/home/data/model/popular/popular_place.dart';
import 'package:arch_team_power/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:arch_team_power/features/home/domain/repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pobular_state.dart';

class PobularCubit extends Cubit<PobularState> {
  final HomeRepo homeRepo;

  PobularCubit(this.homeRepo) : super(PobularInitial());

  Future<void> fetchPopularPlaces() async {
    emit(PobularLoading());

    final result = await homeRepo.fetchAllPopularPlaces();

    result.fold(
      (failure) {
        emit(PobularError(failure.message));
      },
      (popularPlaces) {
        emit(PobularLoaded(popularPlaces));
      },
    );
  }
}

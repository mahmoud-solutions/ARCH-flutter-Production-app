import 'package:arch_team_power/features/home/data/model/banner/banner.dart';
import 'package:arch_team_power/features/home/domain/repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this.homeRepo) : super(BannerInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBanners() async {
    emit(BannerCubitLoading());

    final result = await homeRepo.fetchBanners();
    result.fold(
      (l) => emit(BannerCubitError(l.message)),
      (r) => emit(BannerCubitLoaded(r)),
    );
  }
}

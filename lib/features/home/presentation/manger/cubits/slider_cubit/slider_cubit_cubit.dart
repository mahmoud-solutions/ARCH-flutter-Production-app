import 'package:arch_team_power/features/home/data/model/home/slider.data.dart';
import 'package:arch_team_power/features/home/domain/repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'slider_cubit_state.dart';

class SliderCubitCubit extends Cubit<SliderCubitState> {
  SliderCubitCubit(this.homeRepo) : super(SliderCubitInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSliders() async {
    emit(SliderCubitLoading());

    final result = await homeRepo.fetchSliders();
    result.fold(
      (l) => emit(SliderCubitError(l.message)),
      (r) => emit(SliderCubitLoaded(r)),
    );
  }
}

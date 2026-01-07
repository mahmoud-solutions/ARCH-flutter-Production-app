import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:arch_team_power/features/home/domain/use_cases/get_sub_places_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sub_places_state.dart';

class SubPlacesCubit extends Cubit<SubPlacesState> {
  SubPlacesCubit(this.getSubPlacesUseCase) : super(SubPlacesInitial());
  final GetSubPlacesUseCase getSubPlacesUseCase;
  Future<void> getSubPlaces() async {
    emit(SubPlacesLoading());
    final subPlaces = await getSubPlacesUseCase();
    subPlaces.fold(
      (faliure) => emit(SubPlacesFailure(errorMessage: faliure.message)),
      (subPlaces) {
        if (subPlaces.isEmpty) {
          emit(SubPlacesEmpty());
        } else {
          emit(SubPlacesSuccess(subPlaces: subPlaces));
        }
      },
    );
  }
}

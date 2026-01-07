import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:arch_team_power/features/home/domain/use_cases/get_sub_places_details_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sub_places_details_state.dart';

class SubPlacesDetailsCubit extends Cubit<SubPlacesDetailsState> {
  SubPlacesDetailsCubit(this.getSubPlacesDetailsUseCase)
    : super(SubPlacesDetailsInitial());
  final GetSubPlacesDetailsUseCase getSubPlacesDetailsUseCase;
  Future<void> getSubPlacesDetails({required int id}) async {
    emit(SubPlacesDetailsLoading());
    final subPlace = await getSubPlacesDetailsUseCase(id: id);
    subPlace.fold(
      (failure) => emit(SubPlacesDetailsFailure(errorMessage: failure.message)),
      (subPlace) => emit(SubPlacesDetailsSuccess(subPlaceEntity: subPlace)),
    );
  }
}

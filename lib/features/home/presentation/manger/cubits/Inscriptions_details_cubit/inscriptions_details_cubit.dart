import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:arch_team_power/features/home/domain/use_cases/get_inscriptions_details_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'inscriptions_details_state.dart';

class InscriptionsDetailsCubit extends Cubit<InscriptionsDetailsState> {
  InscriptionsDetailsCubit(this.getInscriptionsDetailsUseCase)
    : super(InscriptionsDetailsInitial());
  final GetInscriptionsDetailsUseCase getInscriptionsDetailsUseCase;
  Future<void> getInscriptionsDetails({required int id}) async {
    emit(InscriptionsDetailsLoading());
    final response = await getInscriptionsDetailsUseCase(id: id);
    response.fold(
      (failure) =>
          emit(InscriptionsDetailsFailure(errorMessage: failure.message)),
      (inscriptionsDetails) => emit(
        InscriptionsDetailsSuccess(inscriptionsDetails: inscriptionsDetails),
      ),
    );
  }
}

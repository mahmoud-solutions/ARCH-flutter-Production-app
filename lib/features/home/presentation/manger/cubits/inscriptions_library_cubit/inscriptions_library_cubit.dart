import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:arch_team_power/features/home/domain/use_cases/get_inscriptions_library_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'inscriptions_library_state.dart';

class InscriptionsLibraryCubit extends Cubit<InscriptionsLibraryState> {
  InscriptionsLibraryCubit(this.getInscriptionsUseCase)
    : super(InscriptionsLibraryInitial());
  final GetInscriptionsUseCase getInscriptionsUseCase;
  Future<void> getInscriptions() async {
    emit(InscriptionsLibraryLoading());
    final response = await getInscriptionsUseCase();
    response.fold(
      (failure) =>
          emit(InscriptionsLibraryFailure(errorMessage: failure.message)),
      (inscriptions) {
        if (inscriptions.isEmpty) {
          emit(InscriptionsLibraryEmpty());
        }
        emit(InscriptionsLibrarySuccess(inscriptionsLibrary: inscriptions));
      },
    );
  }
}

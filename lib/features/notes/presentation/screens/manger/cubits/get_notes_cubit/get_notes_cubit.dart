import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/domain/use_cases/get_notes_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit(this.getNotesUseCase) : super(GetNotesInitial());
  final GetNotesUseCase getNotesUseCase;
  Future<void> getNotes() async {
    emit(GetNotesLoading());
    final response = await getNotesUseCase();
    response.fold(
      (failure) {
        if (failure.message == 'Your request was not found, please try later') {
          emit(GetNotesEmpty());
          return;
        }
        emit(GetNotesFailure(errorMessage: failure.message));
      },
      (notes) {
        if (notes.isEmpty) {
          emit(GetNotesEmpty());
        }
        emit(GetNotesSuccess(notes: notes));
      },
    );
  }
}

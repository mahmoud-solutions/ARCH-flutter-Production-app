import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/domain/use_cases/edit_note_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_notes_state.dart';

class EditNotesCubit extends Cubit<EditNotesState> {
  EditNotesCubit(this.editNotesUseCase) : super(EditNotesInitial());
  final EditNoteUseCase editNotesUseCase;
  Future<void> editNote({
    required String title,
    required String description,
    required num id,
  }) async {
    emit(EditNotesLoading());
    final response = await editNotesUseCase(
      title: title,
      description: description,
      id: id,
    );
    response.fold(
      (failure) {
        emit(EditNotesFailure(errorMessage: failure.message));
      },
      (note) {
        emit(EditNotesSuccess(note: note));
      },
    );
  }
}

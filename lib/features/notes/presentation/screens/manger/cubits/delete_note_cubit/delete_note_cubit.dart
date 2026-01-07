import 'package:arch_team_power/features/notes/domain/use_cases/del_note_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit(this.deleteNoteUseCase) : super(DeleteNoteInitial());
  final DelNoteUseCase deleteNoteUseCase;
  Future<void> deleteNote({required num id}) async {
    emit(DeleteNoteLoading());
    final response = await deleteNoteUseCase(id: id);
    response.fold(
      (failure) {
        emit(DeleteNoteFailure(errorMessage: failure.message));
      },
      (note) {
        emit(DeleteNoteSuccess(note: note));
      },
    );
  }
}

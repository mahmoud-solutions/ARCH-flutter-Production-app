import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/domain/use_cases/create_note_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_note_state.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  CreateNoteCubit(this.createNoteUseCase) : super(CreateNoteInitial());
  final CreateNoteUseCase createNoteUseCase;
  Future<void> createNote({
    required String title,
    required String description,
  }) async {
    emit(CreateNoteLoading());
    final response = await createNoteUseCase(
      title: title,
      description: description,
    );
    response.fold(
      (failure) {
        emit(CreateNoteFailure(errorMessage: failure.message));
      },
      (note) {
        emit(CreateNoteSuccess(note: note));
      },
    );
  }
}

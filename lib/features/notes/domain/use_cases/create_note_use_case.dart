import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/domain/repo/notes_repo.dart';
import 'package:dartz/dartz.dart';

class CreateNoteUseCase {
  final NotesRepo notesRepo;

  CreateNoteUseCase({required this.notesRepo});
  Future<Either<Failure, NoteEntity>> call({
    required String title,
    required String description,
  }) {
    return notesRepo.createNote(title: title, description: description);
  }
}

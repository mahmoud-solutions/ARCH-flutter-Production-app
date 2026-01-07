import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/domain/repo/notes_repo.dart';
import 'package:dartz/dartz.dart';

class EditNoteUseCase {
  final NotesRepo notesRepo;

  EditNoteUseCase({required this.notesRepo});
  Future<Either<Failure, NoteEntity>> call({
    required String title,
    required String description,
    required num id,
  }) {
    return notesRepo.updateNote(title: title, description: description, id: id);
  }
}

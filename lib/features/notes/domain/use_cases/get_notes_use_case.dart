import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/domain/repo/notes_repo.dart';
import 'package:dartz/dartz.dart';

class GetNotesUseCase {
  final NotesRepo notesRepo;

  GetNotesUseCase({required this.notesRepo});
  Future<Either<Failure, List<NoteEntity>>> call() {
    return notesRepo.getNotes();
  }
}

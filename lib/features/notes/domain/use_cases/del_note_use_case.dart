import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/notes/domain/repo/notes_repo.dart';
import 'package:dartz/dartz.dart';

class DelNoteUseCase {
  final NotesRepo notesRepo;

  DelNoteUseCase({required this.notesRepo});
  Future<Either<Failure, String>> call({required num id}) {
    return notesRepo.deleteNote(id: id);
  }
}

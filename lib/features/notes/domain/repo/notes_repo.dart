import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotesRepo {
  Future<Either<Failure, List<NoteEntity>>> getNotes();
  Future<Either<Failure, NoteEntity>> createNote({
    required String title,
    required String description,
  });
  Future<Either<Failure, NoteEntity>> updateNote({
    required String title,
    required String description,
    required num id,
  });
  Future<Either<Failure, String>> deleteNote({required num id});
}

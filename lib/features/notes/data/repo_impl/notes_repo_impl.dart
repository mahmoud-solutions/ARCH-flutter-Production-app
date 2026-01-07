import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/notes/data/data_source/notes_remote_data_source.dart';
import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';
import 'package:arch_team_power/features/notes/domain/repo/notes_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotesRepoImpl implements NotesRepo {
  final NotesRemoteDataSource remoteDataSource;

  NotesRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, NoteEntity>> createNote({
    required String title,
    required String description,
  }) async {
    try {
      final createNote = await remoteDataSource.createNote(
        title: title,
        description: description,
      );
      return Right(createNote);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> deleteNote({required num id}) async {
    try {
      final deleteNote = await remoteDataSource.deleteNote(id: id);
      return Right(deleteNote);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> getNotes() async {
    try {
      final getNotes = await remoteDataSource.getNotes();
      return Right(getNotes);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, NoteEntity>> updateNote({
    required String title,
    required String description,
    required num id,
  }) async {
    try {
      final updateNote = await remoteDataSource.updateNote(
        title: title,
        description: description,
        id: id,
      );
      return Right(updateNote);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}

import 'package:arch_team_power/core/services/api_service.dart';
import 'package:arch_team_power/features/notes/data/model/notes_model/notes_model.dart';
import 'package:arch_team_power/features/notes/data/model/notes_model/notes_model_api_response.dart';
import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';

abstract class NotesRemoteDataSource {
  Future<List<NoteEntity>> getNotes();
  Future<NoteEntity> createNote({
    required String title,
    required String description,
  });
  Future<NoteEntity> updateNote({
    required String title,
    required String description,
    required num id,
  });
  Future<String> deleteNote({required num id});
}

class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  final ApiService apiService;

  NotesRemoteDataSourceImpl(this.apiService);
  @override
  Future<NoteEntity> createNote({
    required String title,
    required String description,
  }) async {
    final createNote = await apiService.post(
      endPoint: 'notes',
      data: {'title': title, 'description': description},
    );
    final response = ApiResponse<NotesModel>.fromJson(
      createNote,
      (data) => NotesModel.fromJson(data),
    );

    return response.data;
  }

  @override
  Future<String> deleteNote({required num id}) async {
    await apiService.delete(endPoint: 'notes/$id');

    return '';
  }

  @override
  Future<List<NoteEntity>> getNotes() async {
    final getNotes = await apiService.get(endPoint: 'my-notes');
    final response = ApiResponse<List<NotesModel>>.fromJson(
      getNotes,
      (data) => (data as List).map((e) => NotesModel.fromJson(e)).toList(),
    );

    return response.data.toList();
  }

  @override
  Future<NoteEntity> updateNote({
    required String title,
    required String description,
    required num id,
  }) async {
    final updateNote = await apiService.put(
      endPoint: 'notes/$id',
      data: {'title': title, 'description': description},
    );
    final response = ApiResponse<NotesModel>.fromJson(
      updateNote,
      (data) => NotesModel.fromJson(data),
    );

    return response.data;
  }
}

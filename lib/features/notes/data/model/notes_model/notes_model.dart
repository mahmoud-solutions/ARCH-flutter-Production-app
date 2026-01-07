import 'package:arch_team_power/features/notes/domain/entity/notes_entity.dart';

class NotesModel extends NoteEntity {
  const NotesModel({
    required super.id,
    required super.title,
    required super.description,
    required super.userId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'user_id': userId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

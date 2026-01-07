class NoteEntity {
  final int id;
  final String title;
  final String description;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const NoteEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });
}

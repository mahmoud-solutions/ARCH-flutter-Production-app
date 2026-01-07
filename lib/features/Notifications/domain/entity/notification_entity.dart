class NotificationEntity {
  final String id;
  final String type;
  final String message;
  final String role;
  final DateTime createdAt;
  final DateTime? readAt;

  const NotificationEntity({
    required this.id,
    required this.type,
    required this.message,
    required this.role,
    required this.createdAt,
    this.readAt,
  });
}

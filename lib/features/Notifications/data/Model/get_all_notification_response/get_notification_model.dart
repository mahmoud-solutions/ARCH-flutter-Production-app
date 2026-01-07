import 'package:arch_team_power/features/Notifications/domain/entity/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required super.id,
    required super.type,
    required super.message,
    required super.role,
    required super.createdAt,
    super.readAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      type: json['type'],
      message: json['message'],
      role: json['role'],
      readAt: json['read_at'] != null
          ? DateTime.tryParse(json['read_at']) // بدل DateTime.parse
          : null,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'message': message,
      'role': role,
      'read_at': readAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
    };
  }
}

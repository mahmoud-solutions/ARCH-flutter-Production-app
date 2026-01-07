import 'package:arch_team_power/features/Notifications/data/Model/get_all_notification_response/get_notification_model.dart';

class GetAllNotificationResponseModel {
  final bool success;
  final List<NotificationModel> data;
  final String message;

  GetAllNotificationResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory GetAllNotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAllNotificationResponseModel(
      success: json['success'],
      data: (json['data'] as List)
          .map((e) => NotificationModel.fromJson(e))
          .toList(),
      message: json['message'],
    );
  }
}

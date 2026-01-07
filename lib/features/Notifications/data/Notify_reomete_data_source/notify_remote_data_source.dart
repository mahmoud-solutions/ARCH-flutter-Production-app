import 'package:arch_team_power/core/services/api_service.dart';
import 'package:arch_team_power/features/Notifications/data/Model/Un_Read_Count_Notification/un_read_count_notification_respose/un_read_count_notification_respose.dart';
import 'package:arch_team_power/features/Notifications/data/Model/delete_all_notification_response/delete_all_notification_respons.dart';
import 'package:arch_team_power/features/Notifications/data/Model/get_all_notification_response/get_notification_model.dart';
import 'package:arch_team_power/features/Notifications/data/Model/get_all_notification_response/get_all_notification_response.dart';
import 'package:dio/dio.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getAllNotifications();
  Future<DeleteAllNotificationRespons> deleteAllNotifications();
  Future<UnReadCountNotificationRespose> getUnreadNotificationsCount();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiService apiService;

  NotificationRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<NotificationModel>> getAllNotifications() async {
    try {
      final response = await apiService.get(endPoint: 'notifications');

      final result = GetAllNotificationResponseModel.fromJson(response);

      return result.data;
    } on DioException catch (e) {
      print(
        'DioException: ${e.response?.statusCode} - ${e.response?.statusMessage}',
      );
      print('Response data: ${e.response?.data}');
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('Connection error. Please check your internet.');
      } else if (e.type == DioExceptionType.sendTimeout) {
        throw Exception('Send timeout. Server took too long to respond.');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout. Server took too long to respond.');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception(
          'Server error: ${e.response?.statusCode} ${e.response?.statusMessage}',
        );
      } else if (e.type == DioExceptionType.cancel) {
        throw Exception('Request was cancelled');
      } else {
        throw Exception('Unexpected error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to post comment: $e');
    }
  }

  @override
  Future<DeleteAllNotificationRespons> deleteAllNotifications() async {
    final response = await apiService.delete(
      endPoint: 'notifications/delete-all',
    );
    return DeleteAllNotificationRespons.fromJson(response);
  }

  @override
  Future<UnReadCountNotificationRespose> getUnreadNotificationsCount() async {
    final response = await apiService.get(
      endPoint: '/notifications/unread-count',
    );

    return UnReadCountNotificationRespose.fromJson(response);
  }
}

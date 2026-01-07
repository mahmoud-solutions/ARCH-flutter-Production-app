import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/Notifications/data/Model/delete_all_notification_response/delete_all_notification_respons.dart';
import 'package:arch_team_power/features/Notifications/domain/entity/notification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> getAllNotifications();
  Future<Either<Failure, DeleteAllNotificationRespons>>
  deleteAllNotifications();
  Future<Either<Failure, int>> getUnreadNotificationsCount();
}

import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/Notifications/data/Model/delete_all_notification_response/delete_all_notification_respons.dart';
import 'package:arch_team_power/features/Notifications/domain/repo/notificarion%20_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteAllNotificationsUseCase {
  final NotificationRepository repository;

  DeleteAllNotificationsUseCase(this.repository);

  Future<Either<Failure, DeleteAllNotificationRespons>> call() async {
    return await repository.deleteAllNotifications();
  }
}

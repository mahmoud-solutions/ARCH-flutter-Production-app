import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/Notifications/domain/entity/notification_entity.dart';
import 'package:arch_team_power/features/Notifications/domain/repo/notificarion%20_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllNotificationsUseCase {
  final NotificationRepository repository;

  GetAllNotificationsUseCase(this.repository);

  Future<Either<Failure, List<NotificationEntity>>> call() {
    return repository.getAllNotifications();
  }
}

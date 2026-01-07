import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/Notifications/domain/repo/notificarion%20_repo.dart';
import 'package:dartz/dartz.dart';

class GetUnreadNotificationsCountUseCase {
  final NotificationRepository repository;

  GetUnreadNotificationsCountUseCase(this.repository);

  Future<Either<Failure, int>> call() {
    return repository.getUnreadNotificationsCount();
  }
}

import 'package:arch_team_power/features/Notifications/data/Model/delete_all_notification_response/delete_all_notification_respons.dart';
import 'package:arch_team_power/features/Notifications/data/Notify_reomete_data_source/notify_remote_data_source.dart';
import 'package:arch_team_power/features/Notifications/domain/entity/notification_entity.dart';
import 'package:arch_team_power/features/Notifications/domain/repo/notificarion%20_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<NotificationEntity>>>
  getAllNotifications() async {
    try {
      final notifications = await remoteDataSource.getAllNotifications();
      return Right(notifications);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (_) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, DeleteAllNotificationRespons>>
  deleteAllNotifications() async {
    try {
      final result = await remoteDataSource.deleteAllNotifications();
      if (result.success == true) {
        return Right(result);
      } else {
        return Left(ServerFailure(result.message ?? 'Unknown error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadNotificationsCount() async {
    try {
      final response = await remoteDataSource.getUnreadNotificationsCount();

      return Right(response.data?.count ?? 0);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

import 'package:arch_team_power/features/Notifications/domain/Notidication_Usecase/get_Notidication_usecase.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/manger/cubits/notifications_cubit/notifications_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final GetAllNotificationsUseCase getAllNotificationsUseCase;

  NotificationsCubit(this.getAllNotificationsUseCase)
    : super(NotificationsInitial());

  Future<void> getNotifications() async {
    emit(NotificationsLoading());

    final result = await getAllNotificationsUseCase();

    result.fold(
      (failure) => emit(NotificationsError(failure.message)),
      (notifications) => emit(NotificationsLoaded(notifications)),
    );
  }

  void clearNotifications() {
    emit(NotificationsLoaded([]));
  }
}

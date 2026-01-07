import 'package:arch_team_power/features/Notifications/data/Model/delete_all_notification_response/delete_all_notification_respons.dart';
import 'package:equatable/equatable.dart';

abstract class DeleteAllNotificationsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteAllNotificationsInitial extends DeleteAllNotificationsState {}

class DeleteAllNotificationsLoading extends DeleteAllNotificationsState {}

class DeleteAllNotificationsSuccess extends DeleteAllNotificationsState {
  final DeleteAllNotificationRespons response;

  DeleteAllNotificationsSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class DeleteAllNotificationsFailure extends DeleteAllNotificationsState {
  final String message;

  DeleteAllNotificationsFailure(this.message);

  @override
  List<Object?> get props => [message];
}

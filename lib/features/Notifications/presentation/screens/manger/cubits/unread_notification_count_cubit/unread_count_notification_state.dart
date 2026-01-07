abstract class UnreadNotificationsCountState {}

class UnreadNotificationsCountInitial extends UnreadNotificationsCountState {}

class UnreadNotificationsCountLoading extends UnreadNotificationsCountState {}

class UnreadNotificationsCountSuccess extends UnreadNotificationsCountState {
  final int count;

  UnreadNotificationsCountSuccess(this.count);
}

class UnreadNotificationsCountFailure extends UnreadNotificationsCountState {
  final String message;

  UnreadNotificationsCountFailure(this.message);
}

part of 'cancel_subscription_cubit.dart';

@immutable
sealed class CancelSubscriptionState {}

final class CancelSubscriptionInitial extends CancelSubscriptionState {}

final class CancelSubscriptionLoading extends CancelSubscriptionState {}

final class CancelSubscriptionSuccess extends CancelSubscriptionState {}

final class CancelSubscriptionFailure extends CancelSubscriptionState {
  final String errorMessage;

  CancelSubscriptionFailure({required this.errorMessage});
}

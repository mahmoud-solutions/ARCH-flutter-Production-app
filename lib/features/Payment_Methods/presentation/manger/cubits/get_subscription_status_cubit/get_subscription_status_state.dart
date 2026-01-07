part of 'get_subscription_status_cubit.dart';

@immutable
sealed class GetSubscriptionStatusState {}

final class GetSubscriptionStatusInitial extends GetSubscriptionStatusState {}

final class GetSubscriptionStatusLoading extends GetSubscriptionStatusState {}

final class GetSubscriptionStatusSuccess extends GetSubscriptionStatusState {
  final SubscriptionStatusEntity subscriptionStatusEntity;

  GetSubscriptionStatusSuccess({required this.subscriptionStatusEntity});
}

final class GetSubscriptionStatusFailure extends GetSubscriptionStatusState {
  final String errorMessage;

  GetSubscriptionStatusFailure({required this.errorMessage});
}

part of 'apple_subscription_cubit.dart';

@immutable
sealed class AppleSubscriptionState {}

final class AppleSubscriptionInitial extends AppleSubscriptionState {}

final class AppleSubscriptionLoading extends AppleSubscriptionState {}

final class AppleSubscriptionSuccess extends AppleSubscriptionState {
  final AppleSubscriptionEntity appleSubscriptionEntity;

  AppleSubscriptionSuccess({required this.appleSubscriptionEntity});
}

final class AppleSubscriptionFailure extends AppleSubscriptionState {
  final String errorMessage;

  AppleSubscriptionFailure({required this.errorMessage});
}

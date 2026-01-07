part of 'google_play_subscription_cubit.dart';

@immutable
sealed class GooglePlaySubscriptionState {}

final class GooglePlaySubscriptionInitial extends GooglePlaySubscriptionState {}

final class GooglePlaySubscriptionLoading extends GooglePlaySubscriptionState {}

final class GooglePlaySubscriptionSuccess extends GooglePlaySubscriptionState {
  final GooglePlayActivateSubscriptionEntity
  googlePalyActivateSubscriptionEntity;

  GooglePlaySubscriptionSuccess({
    required this.googlePalyActivateSubscriptionEntity,
  });
}

final class GooglePlaySubscriptionFaliure extends GooglePlaySubscriptionState {
  final String errorMessage;

  GooglePlaySubscriptionFaliure({required this.errorMessage});
}

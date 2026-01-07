part of 'get_subscription_plans_cubit.dart';

@immutable
sealed class GetSubscriptionPlansState {}

final class GetSubscriptionPlansInitial extends GetSubscriptionPlansState {}

final class GetSubscriptionPlansLoading extends GetSubscriptionPlansState {}

final class GetSubscriptionPlansSuccess extends GetSubscriptionPlansState {
  final List<SubscriptionPlanEntity> getSubscriptionPlans;

  GetSubscriptionPlansSuccess({required this.getSubscriptionPlans});
}

final class GetSubscriptionPlansFailure extends GetSubscriptionPlansState {
  final String errorMessage;

  GetSubscriptionPlansFailure({required this.errorMessage});
}

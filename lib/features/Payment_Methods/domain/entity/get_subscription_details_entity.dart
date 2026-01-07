import 'package:arch_team_power/features/Payment_Methods/domain/entity/get_subscription_status_entity.dart';

class GetSubscriptionStatusEntity {
  final bool hasSubscription;
  final GetSubscriptionDetailsEntity? subscription;

  GetSubscriptionStatusEntity({
    required this.hasSubscription,
    required this.subscription,
  });
}

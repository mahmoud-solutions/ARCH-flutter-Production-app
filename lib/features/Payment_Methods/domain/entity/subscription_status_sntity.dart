import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_details_entity.dart';

class SubscriptionStatusEntity {
  final bool hasSubscription;
  final SubscriptionDetailsEntity? subscription;

  const SubscriptionStatusEntity({
    required this.hasSubscription,
    this.subscription,
  });
}

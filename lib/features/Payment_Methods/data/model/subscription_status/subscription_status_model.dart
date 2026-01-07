import 'package:arch_team_power/features/Payment_Methods/data/model/subscription_status/subscription_details_model.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_status_sntity.dart';

class SubscriptionStatusModel extends SubscriptionStatusEntity {
  const SubscriptionStatusModel({
    required super.hasSubscription,
    super.subscription,
  });

  factory SubscriptionStatusModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionStatusModel(
      hasSubscription: json['has_subscription'],
      subscription: json['subscription'] != null
          ? SubscriptionDetailsModel.fromJson(json['subscription'])
          : null,
    );
  }
}

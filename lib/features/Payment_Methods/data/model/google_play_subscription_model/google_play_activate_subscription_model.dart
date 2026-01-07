import 'package:arch_team_power/features/Payment_Methods/data/model/google_play_subscription_model/google_play_subscription_model.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/google_play_subscription_details_entity.dart';

class GooglePlayActivateSubscriptionModel
    extends GooglePlayActivateSubscriptionEntity {
  GooglePlayActivateSubscriptionModel({
    required super.subscription,
    required super.expiredAt,
    required super.monthes,
  });

  factory GooglePlayActivateSubscriptionModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return GooglePlayActivateSubscriptionModel(
      subscription: GooglePlaySubscriptionModel.fromJson(json['subscription']),
      expiredAt: json['expired_at'],
      monthes: json['monthes'],
    );
  }
}

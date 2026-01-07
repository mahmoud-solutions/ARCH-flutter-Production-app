import 'package:arch_team_power/features/Payment_Methods/domain/entity/google_play_subscription_entity.dart';

class GooglePlayActivateSubscriptionEntity {
  final GooglePlaySubscriptionEntity subscription;
  final String expiredAt;
  final int monthes;

  GooglePlayActivateSubscriptionEntity({
    required this.subscription,
    required this.expiredAt,
    required this.monthes,
  });
}

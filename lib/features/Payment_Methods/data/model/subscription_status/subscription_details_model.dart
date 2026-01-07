import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_details_entity.dart';

class SubscriptionDetailsModel extends SubscriptionDetailsEntity {
  const SubscriptionDetailsModel({
    required super.id,
    required super.status,
    required super.statusText,
    required super.productId,
    required super.monthes,
    required super.startedAt,
    required super.expiredAt,
    required super.expiredAtFormatted,
    required super.daysRemaining,
    required super.isActive,
    required super.autoRenewing,
  });

  factory SubscriptionDetailsModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionDetailsModel(
      id: json['id'],
      status: json['status'],
      statusText: json['status_text'],
      productId: json['productId'],
      monthes: json['monthes'],
      startedAt: DateTime.parse(json['started_at']),
      expiredAt: DateTime.parse(json['expired_at']),
      expiredAtFormatted: json['expired_at_formatted'],
      daysRemaining: (json['days_remaining'] as num).toDouble(),
      isActive: json['is_active'],
      autoRenewing: json['auto_renewing'],
    );
  }
}

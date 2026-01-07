import 'package:arch_team_power/features/Payment_Methods/domain/entity/google_play_subscription_entity.dart';

class GooglePlaySubscriptionModel extends GooglePlaySubscriptionEntity {
  GooglePlaySubscriptionModel({
    required super.id,
    required super.orderId,
    required super.productId,
    required super.purchaseTime,
    required super.purchaseState,
    required super.purchaseToken,
    required super.autoRenewing,
    required super.userId,
    required super.monthes,
    required super.status,
    required super.expiredAt,
    required super.createdAt,
    required super.updatedAt,
  });

  factory GooglePlaySubscriptionModel.fromJson(Map<String, dynamic> json) {
    return GooglePlaySubscriptionModel(
      id: json['id'],
      orderId: json['orderId'],
      productId: json['productId'],
      purchaseTime: json['purchaseTime'],
      purchaseState: json['purchaseState'],
      purchaseToken: json['purchaseToken'],
      autoRenewing: json['autoRenewing'] == 'true',
      userId: json['user_id'],
      monthes: json['monthes'],
      status: json['status'],
      expiredAt: json['expired_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

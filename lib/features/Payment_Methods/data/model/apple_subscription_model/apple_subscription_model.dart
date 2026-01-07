import 'package:arch_team_power/features/Payment_Methods/domain/entity/apple_subscription_entity.dart';

class AppleSubscriptionModel extends AppleSubscriptionEntity {
  const AppleSubscriptionModel({
    required super.id,
    required super.monthes,
    required super.status,
    required super.productId,
    required super.purchaseToken,
    required super.orderId,
    required super.purchaseTime,
    required super.expiredAt,
    required super.userId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory AppleSubscriptionModel.fromJson(Map<String, dynamic> json) {
    return AppleSubscriptionModel(
      id: json['id'],
      monthes: json['monthes'],
      status: json['status'],
      productId: json['productId'],
      purchaseToken: json['purchaseToken'],
      orderId: json['orderId'],
      purchaseTime: json['purchaseTime'],
      expiredAt: DateTime.parse(json['expired_at']),
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

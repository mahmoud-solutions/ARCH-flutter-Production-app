import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_plan_entity.dart';

class SubscriptionPlanModel extends SubscriptionPlanEntity {
  const SubscriptionPlanModel({
    required super.id,
    required super.name,
    required super.nameEn,
    required super.months,
    required super.price,
    required super.currency,
    required super.productId,
  });

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanModel(
      id: json['id'],
      name: json['name'],
      nameEn: json['name_en'],
      months: json['monthes'],
      price: json['price'],
      currency: json['currency'],
      productId: json['productId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_en': nameEn,
      'monthes': months,
      'price': price,
      'currency': currency,
      'productId': productId,
    };
  }
}

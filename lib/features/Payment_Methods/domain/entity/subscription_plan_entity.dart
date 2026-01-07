class SubscriptionPlanEntity {
  final String id;
  final String name;
  final String nameEn;
  final int months;
  final num price;
  final String currency;
  final String productId;

  const SubscriptionPlanEntity({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.months,
    required this.price,
    required this.currency,
    required this.productId,
  });
}

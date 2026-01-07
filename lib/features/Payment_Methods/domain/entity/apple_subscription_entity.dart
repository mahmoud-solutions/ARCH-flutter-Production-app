class AppleSubscriptionEntity {
  final int id;
  final int monthes;
  final int status;
  final String productId;
  final String purchaseToken;
  final String orderId;
  final String purchaseTime;
  final DateTime expiredAt;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AppleSubscriptionEntity({
    required this.id,
    required this.monthes,
    required this.status,
    required this.productId,
    required this.purchaseToken,
    required this.orderId,
    required this.purchaseTime,
    required this.expiredAt,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });
}

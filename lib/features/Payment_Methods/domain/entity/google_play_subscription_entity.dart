class GooglePlaySubscriptionEntity {
  final int id;
  final String orderId;
  final String productId;
  final String purchaseTime;
  final String purchaseState;
  final String purchaseToken;
  final bool autoRenewing;
  final int userId;
  final int monthes;
  final int status;
  final String expiredAt;
  final String createdAt;
  final String updatedAt;

  GooglePlaySubscriptionEntity({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.purchaseTime,
    required this.purchaseState,
    required this.purchaseToken,
    required this.autoRenewing,
    required this.userId,
    required this.monthes,
    required this.status,
    required this.expiredAt,
    required this.createdAt,
    required this.updatedAt,
  });
}

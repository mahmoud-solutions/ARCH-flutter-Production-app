class GetSubscriptionDetailsEntity {
  final int id;
  final int status;
  final String statusText;
  final String productId;
  final int monthes;
  final String startedAt;
  final String expiredAt;
  final String expiredAtFormatted;
  final double daysRemaining;
  final bool isActive;
  final bool autoRenewing;

  GetSubscriptionDetailsEntity({
    required this.id,
    required this.status,
    required this.statusText,
    required this.productId,
    required this.monthes,
    required this.startedAt,
    required this.expiredAt,
    required this.expiredAtFormatted,
    required this.daysRemaining,
    required this.isActive,
    required this.autoRenewing,
  });
}

import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/google_play_subscription_details_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/repo/payment_gateway_repo.dart';
import 'package:dartz/dartz.dart';

class GooglePlayActivateSubscriptionUseCase {
  final PaymentGatewayRepo paymentGatewayRepo;

  GooglePlayActivateSubscriptionUseCase({required this.paymentGatewayRepo});
  Future<Either<Failure, GooglePlayActivateSubscriptionEntity>> call({
    required String productId,
    required String purchaseToken,
  }) {
    return paymentGatewayRepo.activateSubscription(
      productId: productId,
      purchaseToken: purchaseToken,
    );
  }
}

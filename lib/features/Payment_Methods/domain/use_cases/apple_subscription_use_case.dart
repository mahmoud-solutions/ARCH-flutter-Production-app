import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/apple_subscription_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/repo/payment_gateway_repo.dart';
import 'package:dartz/dartz.dart';

class AppleSubscriptionUseCase {
  final PaymentGatewayRepo paymentGatewayRepo;

  AppleSubscriptionUseCase(this.paymentGatewayRepo);

  Future<Either<Failure, AppleSubscriptionEntity>> call({
    required String productId,
    required String purchaseToken,
  }) {
    return paymentGatewayRepo.appleActivateSubscription(
      productId: productId,
      purchaseToken: purchaseToken,
    );
  }
}

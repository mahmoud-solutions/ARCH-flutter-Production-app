import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_status_sntity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/repo/payment_gateway_repo.dart';
import 'package:dartz/dartz.dart';

class GetSubscriptionStatusUseCase {
  final PaymentGatewayRepo paymentGatewayRepo;

  GetSubscriptionStatusUseCase({required this.paymentGatewayRepo});
  Future<Either<Failure, SubscriptionStatusEntity>> call() {
    return paymentGatewayRepo.getSubscriptionStatus();
  }
}

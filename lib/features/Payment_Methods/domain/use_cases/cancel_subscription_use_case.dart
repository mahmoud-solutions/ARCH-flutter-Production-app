import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/repo/payment_gateway_repo.dart';
import 'package:dartz/dartz.dart';

class CancelSubscriptionUseCase {
  final PaymentGatewayRepo paymentGatewayRepo;

  CancelSubscriptionUseCase({required this.paymentGatewayRepo});
  Future<Either<Failure, Unit>> call() {
    return paymentGatewayRepo.cancelSubscription();
  }
}

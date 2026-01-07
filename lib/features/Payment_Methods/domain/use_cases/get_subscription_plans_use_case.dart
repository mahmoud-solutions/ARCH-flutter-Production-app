import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_plan_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/repo/payment_gateway_repo.dart';
import 'package:dartz/dartz.dart';

class GetSubscriptionPlansUseCase {
  final PaymentGatewayRepo paymentGatewayRepo;

  GetSubscriptionPlansUseCase({required this.paymentGatewayRepo});
  Future<Either<Failure, List<SubscriptionPlanEntity>>> call() async {
    return await paymentGatewayRepo.getSubscriptionPlans();
  }
}

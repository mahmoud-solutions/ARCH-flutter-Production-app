import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/apple_subscription_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/google_play_subscription_details_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_plan_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_status_sntity.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentGatewayRepo {
  Future<Either<Failure, List<SubscriptionPlanEntity>>> getSubscriptionPlans();
  Future<Either<Failure, GooglePlayActivateSubscriptionEntity>>
  activateSubscription({
    required String productId,
    required String purchaseToken,
  });
  Future<Either<Failure, AppleSubscriptionEntity>> appleActivateSubscription({
    required String productId,
    required String purchaseToken,
  });
  Future<Either<Failure, Unit>> cancelSubscription();
  Future<Either<Failure, SubscriptionStatusEntity>> getSubscriptionStatus();
}

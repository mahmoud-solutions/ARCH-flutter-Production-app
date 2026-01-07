import 'package:arch_team_power/core/errors/failure.dart';
import 'package:arch_team_power/features/Payment_Methods/data/data_sources/payment_gateway_remote_data_source.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/apple_subscription_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/google_play_subscription_details_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_plan_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_status_sntity.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/repo/payment_gateway_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PaymentGatewayRepoImpl implements PaymentGatewayRepo {
  final PaymentGatewayRemoteDataSource paymentGatewayRemoteDataSource;

  PaymentGatewayRepoImpl({required this.paymentGatewayRemoteDataSource});
  @override
  Future<Either<Failure, List<SubscriptionPlanEntity>>>
  getSubscriptionPlans() async {
    try {
      final response = await paymentGatewayRemoteDataSource
          .getSubscriptionPlans();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GooglePlayActivateSubscriptionEntity>>
  activateSubscription({
    required String productId,
    required String purchaseToken,
  }) async {
    try {
      final result = await paymentGatewayRemoteDataSource
          .googlePlayActivateSubscription(
            productId: productId,
            purchaseToken: purchaseToken,
          );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AppleSubscriptionEntity>> appleActivateSubscription({
    required String productId,
    required String purchaseToken,
  }) async {
    try {
      final result = await paymentGatewayRemoteDataSource
          .appleActivateSubscription(
            productId: productId,
            purchaseToken: purchaseToken,
          );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> cancelSubscription() async {
    try {
      await paymentGatewayRemoteDataSource.cancelSubscription();
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SubscriptionStatusEntity>>
  getSubscriptionStatus() async {
    try {
      final result = await paymentGatewayRemoteDataSource
          .getSubscriptionStatus();
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}

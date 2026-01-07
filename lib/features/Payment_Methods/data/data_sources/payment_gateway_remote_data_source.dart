import 'package:arch_team_power/core/services/api_service.dart';
import 'package:arch_team_power/features/Payment_Methods/data/model/Subscription_Plan_Model/subscription_plans_response_model.dart';
import 'package:arch_team_power/features/Payment_Methods/data/model/apple_subscription_model/apple_subscription_model.dart';
import 'package:arch_team_power/features/Payment_Methods/data/model/google_play_subscription_model/google_play_activate_subscription_model.dart';
import 'package:arch_team_power/features/Payment_Methods/data/model/subscription_status/subscription_status_model.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_plan_entity.dart';

abstract class PaymentGatewayRemoteDataSource {
  Future<List<SubscriptionPlanEntity>> getSubscriptionPlans();
  Future<GooglePlayActivateSubscriptionModel> googlePlayActivateSubscription({
    required String productId,
    required String purchaseToken,
  });
  Future<AppleSubscriptionModel> appleActivateSubscription({
    required String productId,
    required String purchaseToken,
  });
  Future<void> cancelSubscription();
  Future<SubscriptionStatusModel> getSubscriptionStatus();
}

class PaymentGatewayRemoteDataSourceImpl
    implements PaymentGatewayRemoteDataSource {
  final ApiService apiService;

  PaymentGatewayRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<SubscriptionPlanEntity>> getSubscriptionPlans() async {
    final response = await apiService.get(endPoint: 'subscription/plans');
    final result = SubscriptionPlansResponseModel.fromJson(response);
    return result.data;
  }

  @override
  Future<GooglePlayActivateSubscriptionModel> googlePlayActivateSubscription({
    required String productId,
    required String purchaseToken,
  }) async {
    final response = await apiService.post(
      endPoint: 'payment',
      data: {"productId": productId, "purchaseToken": purchaseToken},
    );

    return GooglePlayActivateSubscriptionModel.fromJson(response['data']);
  }

  @override
  Future<AppleSubscriptionModel> appleActivateSubscription({
    required String productId,
    required String purchaseToken,
  }) async {
    final response = await apiService.post(
      endPoint: 'payment',
      data: {'productId': productId, 'purchaseToken': purchaseToken},
    );

    return AppleSubscriptionModel.fromJson(response['data']);
  }

  @override
  Future<void> cancelSubscription() async {
    await apiService.post(endPoint: 'subscription/cancel');
  }

  @override
  Future<SubscriptionStatusModel> getSubscriptionStatus() async {
    final response = await apiService.get(endPoint: 'subscription/status');

    return SubscriptionStatusModel.fromJson(response['data']);
  }
}

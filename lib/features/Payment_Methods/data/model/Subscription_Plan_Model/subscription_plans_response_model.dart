import 'package:arch_team_power/features/Payment_Methods/data/model/Subscription_Plan_Model/subscription_plan_model.dart';

class SubscriptionPlansResponseModel {
  final bool success;
  final List<SubscriptionPlanModel> data;
  final String message;

  SubscriptionPlansResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory SubscriptionPlansResponseModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlansResponseModel(
      success: json['success'],
      data: List<SubscriptionPlanModel>.from(
        json['data'].map((e) => SubscriptionPlanModel.fromJson(e)),
      ),
      message: json['message'],
    );
  }
}

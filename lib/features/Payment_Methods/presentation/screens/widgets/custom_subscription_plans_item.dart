import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_plan_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/screens/widgets/custom_subscription_plans_active_item.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/screens/widgets/custom_subscription_plans_un_active_item.dart';
import 'package:flutter/material.dart';

class CustomSubscriptionPlansItem extends StatelessWidget {
  const CustomSubscriptionPlansItem({
    super.key,
    required this.isActive,
    required this.subscriptionPlanEntity,
  });
  final SubscriptionPlanEntity subscriptionPlanEntity;

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CustomSubscriptionPlansActiveItem(
            subscriptionPlanEntity: subscriptionPlanEntity,
          )
        : CustomSubscriptionPlansUnActiveItem(
            subscriptionPlanEntity: subscriptionPlanEntity,
          );
  }
}

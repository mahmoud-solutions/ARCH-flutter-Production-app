import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_plan_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSubscriptionPlansUnActiveItem extends StatelessWidget {
  const CustomSubscriptionPlansUnActiveItem({
    super.key,
    required this.subscriptionPlanEntity,
  });
  final SubscriptionPlanEntity subscriptionPlanEntity;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: 78.h,
      width: 78.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5.h),
          Text(
            '${subscriptionPlanEntity.months}\n${subscriptionPlanEntity.name}',

            textAlign: TextAlign.center,
            style: AppTextStyles.syleNorsalSemiBold13(
              context,
            ).copyWith(color: AppColors.primary),
          ),
          SizedBox(height: 3.h),
          Text(
            '${subscriptionPlanEntity.currency} ${subscriptionPlanEntity.price}',
            style: AppTextStyles.syleNorsalSemiBold13(
              context,
            ).copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

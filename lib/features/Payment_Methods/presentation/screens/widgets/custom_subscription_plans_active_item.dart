import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_plan_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSubscriptionPlansActiveItem extends StatelessWidget {
  const CustomSubscriptionPlansActiveItem({
    super.key,
    required this.subscriptionPlanEntity,
  });
  final SubscriptionPlanEntity subscriptionPlanEntity;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),

      height: 100.h,
      width: 100.w,

      child: Column(
        children: [
          Container(
            height: 18.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11.r),
                topRight: Radius.circular(11.r),
              ),
            ),
          ),
          Container(
            height: 82.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.primary),
            ),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Text(
                  '${subscriptionPlanEntity.months}\n${subscriptionPlanEntity.name}',
                  textAlign: TextAlign.center,

                  style: AppTextStyles.syleNorsalSemiBold13(
                    context,
                  ).copyWith(color: AppColors.primary),
                ),
                SizedBox(height: 8.h),
                Text(
                  '${subscriptionPlanEntity.currency} ${subscriptionPlanEntity.price}',
                  style: AppTextStyles.syleNorsalSemiBold13(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

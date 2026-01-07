import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPlansScreenActions extends StatelessWidget {
  const SubscriptionPlansScreenActions({
    super.key,
    required this.subscripOnTap,
    required this.unSubscripOnTap,
  });
  final VoidCallback subscripOnTap, unSubscripOnTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onTap: subscripOnTap,
          title: Text(
            'اشتراك',
            style: AppTextStyles.syleNorsalMedium16(
              context,
            ).copyWith(color: Colors.white),
          ),
          buttonColor: AppColors.primary,
        ),
        SizedBox(height: 18.h),
        CustomButton(
          onTap: unSubscripOnTap,
          title: Text(
            'الغاء الاشتراك',
            style: AppTextStyles.syleNorsalMedium16(
              context,
            ).copyWith(color: Colors.grey),
          ),
          buttonColor: Colors.white,
        ),
      ],
    );
  }
}

import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/screens/widgets/subscription_plans_screen_header.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/screens/widgets/subscription_plans_screen_list_and_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPlansScreenBody extends StatefulWidget {
  const SubscriptionPlansScreenBody({super.key});

  @override
  State<SubscriptionPlansScreenBody> createState() =>
      _SubscriptionPlansScreenBodyState();
}

class _SubscriptionPlansScreenBodyState
    extends State<SubscriptionPlansScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        const CustomAppBar(title: ''),
        const SubscriptionPlansScreenHeader(),
        SizedBox(height: 32.h),
        Text(
          'اشترك للحصول على ميزات افضل',
          style: AppTextStyles.syleNorsalMedium17(
            context,
          ).copyWith(color: AppColors.primary),
        ),
        SizedBox(height: 45.h),
        const SubscriptionPlansScreenListAndActions(),
      ],
    );
  }
}

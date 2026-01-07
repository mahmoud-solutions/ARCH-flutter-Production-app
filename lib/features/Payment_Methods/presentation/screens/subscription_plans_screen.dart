import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/manger/cubits/payment_cubit/get_subscription_plans_cubit.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/screens/widgets/subscription_plans_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPlansScreen extends StatelessWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<GetSubscriptionPlansCubit>()..getSubscriptionPlans(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.86.w),
            child: const SubscriptionPlansScreenBody(),
          ),
        ),
      ),
    );
  }
}

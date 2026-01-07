import 'package:arch_team_power/core/widgets/custom_circular_progress_indicator.dart';
import 'package:arch_team_power/core/widgets/custom_error_widget.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/manger/cubits/payment_cubit/get_subscription_plans_cubit.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/screens/widgets/custom_subscription_plans_item.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/screens/widgets/subscription_plans_screen_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPlansScreenListAndActions extends StatefulWidget {
  const SubscriptionPlansScreenListAndActions({super.key});

  @override
  State<SubscriptionPlansScreenListAndActions> createState() =>
      _SubscriptionPlansScreenListAndActionsState();
}

class _SubscriptionPlansScreenListAndActionsState
    extends State<SubscriptionPlansScreenListAndActions> {
  int selectedIndex = 1;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetSubscriptionPlansCubit, GetSubscriptionPlansState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetSubscriptionPlansSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    state.getSubscriptionPlans.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: CustomSubscriptionPlansItem(
                        subscriptionPlanEntity:
                            state.getSubscriptionPlans[index],
                        isActive: selectedIndex == index,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                SubscriptionPlansScreenActions(
                  subscripOnTap: () {},
                  unSubscripOnTap: () {},
                ),
              ],
            ),
          );
        } else if (state is GetSubscriptionPlansFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        return const CustomCircularProgressIndicator();
      },
    );
  }
}

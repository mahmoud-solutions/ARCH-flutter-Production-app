import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/core/widgets/custom_circular_progress_indicator.dart';
import 'package:arch_team_power/core/widgets/custom_error_widget.dart';
import 'package:arch_team_power/features/Payment_Methods/domain/entity/subscription_details_entity.dart';
import 'package:arch_team_power/features/Payment_Methods/presentation/manger/cubits/get_subscription_status_cubit/get_subscription_status_cubit.dart';
import 'package:arch_team_power/features/profile/presentation/screens/widgets/subscription_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionCard extends StatefulWidget {
  const SubscriptionCard({super.key});

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  double calculateSubscriptionProgress(SubscriptionDetailsEntity sub) {
    final totalDays = sub.expiredAt.difference(sub.startedAt).inDays;

    final remainingDays = sub.expiredAt.difference(DateTime.now()).inDays;

    if (totalDays <= 0) return 0;

    final progress = remainingDays / totalDays;

    return progress.clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<GetSubscriptionStatusCubit>()..getSubscriptionStatus(),
      child:
          BlocBuilder<GetSubscriptionStatusCubit, GetSubscriptionStatusState>(
            builder: (context, state) {
              if (state is GetSubscriptionStatusLoading) {
                return const CustomCircularProgressIndicator();
              }

              if (state is GetSubscriptionStatusFailure) {
                return CustomErrorWidget(errorMessage: state.errorMessage);
              }

              if (state is GetSubscriptionStatusSuccess) {
                final subscription =
                    state.subscriptionStatusEntity.subscription;

                if (subscription == null || !subscription.isActive) {
                  return const Text("لا يوجد اشتراك نشط");
                }

                final progress = calculateSubscriptionProgress(subscription);

                return SubscriptionCardDetails(
                  progress: progress,
                  expiredAt: subscription.expiredAtFormatted,
                );
              }

              return const SizedBox.shrink();
            },
          ),
    );
  }
}

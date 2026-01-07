import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/manger/cubits/delete_Notification_cubit/delete_notification_cubit.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/manger/cubits/delete_Notification_cubit/delete_notification_state.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/manger/cubits/notifications_cubit/notifications_cubit.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/manger/cubits/notifications_cubit/notifications_state.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/widgets/notifications_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<NotificationsCubit>()..getNotifications(),
        ),
        BlocProvider(create: (_) => sl<DeleteAllNotificationsCubit>()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: Text(
            "الإشعارات",
            style: AppTextStyles.syleNorsalRegular20(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                _showDeleteAllDialog(context);
              },
            ),
          ],
        ),
        body:
            BlocListener<
              DeleteAllNotificationsCubit,
              DeleteAllNotificationsState
            >(
              listener: (context, state) {
                if (state is DeleteAllNotificationsSuccess) {
                  context.read<NotificationsCubit>().clearNotifications();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("تم مسح كل الإشعارات")),
                  );
                }

                if (state is DeleteAllNotificationsFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: BlocBuilder<NotificationsCubit, NotificationsState>(
                builder: (context, state) {
                  if (state is NotificationsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is NotificationsError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: AppTextStyles.syleNorsalMedium13(
                          context,
                        ).copyWith(color: Colors.red),
                      ),
                    );
                  }

                  if (state is NotificationsLoaded) {
                    if (state.notifications.isEmpty) {
                      return Center(
                        child: Text(
                          "لا يوجد إشعارات",
                          style: AppTextStyles.syleNorsalMedium13(context),
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      itemCount: state.notifications.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final notification = state.notifications[index];

                        return NotificationItem(
                          mainText: notification.message,
                          timeText: notification.createdAt.toString(),

                          isRead: notification.readAt != null,
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
      ),
    );
  }

  void _showDeleteAllDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("مسح الإشعارات"),
          content: const Text("هل أنت متأكد من مسح كل الإشعارات؟"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("إلغاء"),
            ),
            TextButton(
              onPressed: () {
                context.read<DeleteAllNotificationsCubit>().deleteAll();
                Navigator.pop(context);
              },
              child: const Text("مسح", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

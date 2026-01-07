import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/helper_function/format_date.dart';
import 'package:arch_team_power/core/widgets/notiy_option_dilog.dart';
import 'package:arch_team_power/features/Notifications/presentation/screens/manger/cubits/delete_Notification_cubit/delete_notification_cubit.dart';

class NotificationItem extends StatelessWidget {
  final String mainText;
  final String timeText;
  final bool isRead;

  const NotificationItem({
    super.key,
    required this.mainText,
    required this.timeText,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: isRead ? null : Border.all(color: AppColors.primary, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// زرار الثلاث نقط
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => NotificationOptionsDialog(
                  onMarkAsRead: () {
                    Navigator.pop(context);
                  },
                  onDelete: () {
                    // delete single notification (لو هتضيفه بعدين)
                    Navigator.pop(context);
                  },
                  onDeleteAll: () {
                    context.read<DeleteAllNotificationsCubit>().deleteAll();
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),

          const SizedBox(width: 10),

          /// محتوى الإشعار
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  mainText,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.syleNorsalMedium15(context),
                ),
                const SizedBox(height: 6),
                Text(
                  formatNotificationTime(timeText),
                  textAlign: TextAlign.right,
                  style: AppTextStyles.syleNorsalRegular10(
                    context,
                  ).copyWith(color: AppColors.textHistory),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

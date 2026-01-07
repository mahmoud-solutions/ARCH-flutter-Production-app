import 'package:flutter/material.dart';
import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';

class NotificationOptionsDialog extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onMarkAsRead;
  final VoidCallback onDeleteAll;

  const NotificationOptionsDialog({
    super.key,
    required this.onDelete,
    required this.onMarkAsRead,
    required this.onDeleteAll,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('خيارات', style: AppTextStyles.syleNorsalMedium15(context)),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onMarkAsRead,
              child: Row(
                children: [
                  Icon(Icons.mark_email_read, color: AppColors.primary),
                  const SizedBox(width: 10),
                  Text(
                    'علم كـ مقروء',
                    style: AppTextStyles.syleNorsalRegular14(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: onDelete,
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  const SizedBox(width: 10),
                  Text(
                    'احذف',
                    style: AppTextStyles.syleNorsalRegular14(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: onDeleteAll,
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  const SizedBox(width: 10),
                  Text(
                    'احذف كل الإشعارات',
                    style: AppTextStyles.syleNorsalRegular14(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

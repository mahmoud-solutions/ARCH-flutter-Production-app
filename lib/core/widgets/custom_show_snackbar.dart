import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

void customShowSnackBar(BuildContext context, {required String title}) {
  var snackBar = SnackBar(
    elevation: 0,
    content: Text(
      title,
      style: AppTextStyles.syleNorsalMedium15(
        context,
      ).copyWith(color: Colors.white),
    ),
    backgroundColor: AppColors.primary.withValues(alpha: .8),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: const EdgeInsets.all(16),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

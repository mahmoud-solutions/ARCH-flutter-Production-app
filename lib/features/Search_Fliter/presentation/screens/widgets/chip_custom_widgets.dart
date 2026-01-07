import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final BoxBorder? border;

  const CustomChip({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 58.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: border,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.syleNorsalMedium14(
              context,
            ).copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}

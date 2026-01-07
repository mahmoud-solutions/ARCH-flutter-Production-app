import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogActionContainer extends StatelessWidget {
  const DialogActionContainer({
    super.key,
    required this.color,
    required this.title,
    required this.textColor,
  });
  final Color color, textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      width: 70.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyles.syleNorsalMedium14(
            context,
          ).copyWith(color: textColor),
        ),
      ),
    );
  }
}

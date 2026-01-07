import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesActionItem extends StatelessWidget {
  const NotesActionItem({
    super.key,
    this.onTap,
    required this.color,
    required this.title,
  });
  final Function()? onTap;
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28.h,
        width: 44.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.syleNorsalMedium10(
              context,
            ).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

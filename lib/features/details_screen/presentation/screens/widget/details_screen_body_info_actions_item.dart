import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreenBodyInfoActionsItem extends StatelessWidget {
  const DetailsScreenBodyInfoActionsItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final String title, icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0xA6D0D0D0),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 13.h),
            Center(
              child: SvgPicture.asset(icon, width: 20.w, height: 20.w),
            ),
            SizedBox(height: 13.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.syleNorsalMedium14(
                context,
              ).copyWith(color: const Color(0xFF8A8A8A)),
            ),
          ],
        ),
      ),
    );
  }
}

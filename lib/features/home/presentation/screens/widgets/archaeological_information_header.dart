import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ArchaeologicalInformationHeader extends StatelessWidget {
  const ArchaeologicalInformationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () => GoRouter.of(context).push(AppRouter.kInformationScreen),
        child: Row(
          children: [
            Text(
              'معلومة اثرية تهمك',
              style: AppTextStyles.syleNorsalRegular14(
                context,
              ).copyWith(fontSize: 15.sp),
            ),
            const Spacer(),
            Text(
              'عرض المزيد',
              style: AppTextStyles.syleNorsalRegular10(
                context,
              ).copyWith(color: const Color(0xFF8A8A8A)),
            ),
          ],
        ),
      ),
    );
  }
}

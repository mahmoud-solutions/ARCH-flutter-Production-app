import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CancelPopup extends StatelessWidget {
  const CancelPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Animate(
        effects: [
          FadeEffect(duration: 300.ms),
          ScaleEffect(
            duration: 350.ms,
            curve: Curves.easeOutBack,
            begin: const Offset(0.7, 0.7),
            end: const Offset(1, 1),
          ),
        ],
        child: Container(
          width: 280.w,
          padding: EdgeInsets.all(25.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// دائرة الأيقونة + الإغلاق عند الضغط
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 70.w,
                  height: 70.w,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      AppIcons.kCancelSubicon,
                      width: 35.w,
                      height: 35.w,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                "تم الغاء اشتراكك بنجاح",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

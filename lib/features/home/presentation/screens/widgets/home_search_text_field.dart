import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 240.w,
        height: 27.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: Colors.white, width: 1.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Center(
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,

              decoration: InputDecoration(
                hoverColor: Colors.white,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24.sp,
                ),
                hintText: "ابحث عن أماكن ومواقع أثرية...",
                hintStyle: AppTextStyles.syleNorsalMedium10(
                  context,
                ).copyWith(color: Colors.white),
                border: InputBorder.none,
              ),
              style: AppTextStyles.syleNorsalMedium14(context),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LangSearchTextFiled extends StatelessWidget {
  const LangSearchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: 297.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "ابحث عن اللغه اللي تريدها",
          hintStyle: AppTextStyles.syleNorsalRegular10(
            context,
          ).copyWith(color: const Color(0xFFC4C4C4)),
          prefixIcon: Icon(
            Icons.language,
            color: const Color(0xFF8A8A8A),
            size: 23.sp,
          ),

          suffixIcon: const Icon(CupertinoIcons.search),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

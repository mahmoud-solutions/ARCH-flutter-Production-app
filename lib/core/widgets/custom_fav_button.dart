import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFavButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const CustomFavButton({
    super.key,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28.h,
        width: 28.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
          child: Icon(
            isActive ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            color: const Color(0xffD2B48C),
            size: 17.sp,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.height,
    this.width,
    super.key,
    required this.title,
    required this.buttonColor,
    this.onTap,
    this.textColor,
  });
  final Widget title;
  final Color? buttonColor, textColor;
  final Function()? onTap;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 48.5.h,
        width: width ?? 297.w,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: title),
      ),
    );
  }
}

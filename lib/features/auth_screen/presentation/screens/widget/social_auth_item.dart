import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialAuthItem extends StatelessWidget {
  const SocialAuthItem({super.key, required this.assetName, this.onTap});
  final String assetName;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38.h,
        width: 52.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0x4DE6E2DF),
        ),
        child: Center(
          child: SvgPicture.asset(assetName, height: 19.5.h, width: 19.5.w),
        ),
      ),
    );
  }
}

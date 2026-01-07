import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TakePhotoButton extends StatelessWidget {
  const TakePhotoButton({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: SvgPicture.asset(
          AppIcons.kTakePhotoIcon,
          height: 50.h,
          width: 50.w,
        ),
      ),
    );
  }
}

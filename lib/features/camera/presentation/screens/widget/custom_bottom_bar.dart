import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/camera_actions.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/take_photo_button.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/zomm_buttons.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    this.controller,
    this.onTapPickImage,
    this.onTapSaveImage,
    this.onTapTakePhoto,
  });
  final CameraController? controller;
  final Function()? onTapPickImage, onTapSaveImage, onTapTakePhoto;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 189.h,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: const BoxDecoration(
            color: Color(0xffD2B48C),
            borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ZommButtons(controller: controller),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CameraActions(title: 'الصور', onTap: onTapPickImage),
                  const CameraActions(title: 'البطاقة'),
                  const CameraActions(title: 'الملفات'),
                  CameraActions(title: 'حفظ', onTap: onTapSaveImage),
                  const CameraActions(title: 'مشاركة'),
                ],
              ),
              SizedBox(height: 15.h),
              TakePhotoButton(onTap: onTapTakePhoto),
            ],
          ),
        ),
        Positioned(
          left: 20.w,
          bottom: 30.h,
          child: GestureDetector(
            onTap: onTapPickImage,
            child: SvgPicture.asset(
              AppIcons.kMeteorIconsImages,
              height: 26.h,
              width: 26.w,
            ),
          ),
        ),
      ],
    );
  }
}

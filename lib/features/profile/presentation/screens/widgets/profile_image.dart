import 'dart:io';

import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    this.onImagePicked,
    this.pickedImage,
    this.networkImage,
    this.height,
    this.width,
  });

  final XFile? pickedImage;
  final String? networkImage;
  final VoidCallback? onImagePicked;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (pickedImage != null) {
      imageWidget = Image.file(
        File(pickedImage!.path),
        height: height ?? 100.h,
        width: width ?? 100.w,
        fit: BoxFit.cover,
      );
    } else if (networkImage != null && networkImage!.isNotEmpty) {
      imageWidget = Image.network(
        networkImage!,
        height: height ?? 100.h,
        width: width ?? 100.w,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            AppAssets.kNullProfileimage,
            height: height ?? 100.h,
            width: width ?? 100.w,
            fit: BoxFit.fill,
          );
        },
      );
    } else {
      imageWidget = Image.asset(
        AppAssets.kNullProfileimage,
        height: height ?? 100.h,
        width: width ?? 100.w,
        fit: BoxFit.cover,
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(100), child: imageWidget),
        Positioned(
          bottom: -3,
          right: 3,
          child: GestureDetector(
            onTap: onImagePicked,
            child: SvgPicture.asset(AppIcons.kCamIcon),
          ),
        ),
      ],
    );
  }
}

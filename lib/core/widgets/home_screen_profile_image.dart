import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenProfileImage extends StatelessWidget {
  const HomeScreenProfileImage({
    super.key,
    this.networkImage,
    this.onImagePicked,
    this.height,
    this.width,
  });
  final String? networkImage;
  final VoidCallback? onImagePicked;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (networkImage != null && networkImage!.isNotEmpty) {
      imageWidget = Image.network(
        networkImage!,
        height: height ?? 40.h,
        width: width ?? 40.w,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            AppAssets.kNullProfileimage,
            height: height ?? 40.h,
            width: width ?? 40.w,
            fit: BoxFit.fill,
          );
        },
      );
    } else {
      imageWidget = Image.asset(
        AppAssets.kNullProfileimage,
        height: height ?? 40.h,
        width: width ?? 40.w,
        fit: BoxFit.cover,
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: imageWidget,
    );
  }
}

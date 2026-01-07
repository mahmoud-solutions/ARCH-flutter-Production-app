import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({super.key, required this.subPlaceImageEntity});
  final SubPlaceImageEntity subPlaceImageEntity;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      subPlaceImageEntity.image,
      height: 232.h,
      width: double.infinity,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          AppAssets.kTestImage3,
          height: 232.h,
          width: double.infinity,
          fit: BoxFit.fill,
        );
      },
    );
  }
}

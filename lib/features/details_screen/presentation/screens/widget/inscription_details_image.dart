import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_image_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InscriptionDetailsImage extends StatelessWidget {
  const InscriptionDetailsImage({super.key, required this.ruinImageEntity});
  final RuinImageEntity ruinImageEntity;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      ruinImageEntity.image,
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

import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InscriptionItemImage extends StatelessWidget {
  const InscriptionItemImage({super.key, required this.inscriptionsEntity});

  final InscriptionsEntity inscriptionsEntity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Image.network(
          inscriptionsEntity.image ?? '',
          fit: BoxFit.fill,
          height: 70.h,
          width: 175.w,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              AppAssets.kTestImage7,
              fit: BoxFit.fill,
              height: 70.h,
              width: 175.w,
            );
          },
        ),
      ),
    );
  }
}

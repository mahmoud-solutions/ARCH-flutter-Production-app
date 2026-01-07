import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LibraryScreenItemDetails extends StatelessWidget {
  const LibraryScreenItemDetails({super.key, required this.inscriptionsEntity});
  final InscriptionsEntity inscriptionsEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.33),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.network(
                inscriptionsEntity.image ?? '',
                fit: BoxFit.fill,
                width: 132.w,
                height: 107.h,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    AppAssets.kTestImage7,
                    fit: BoxFit.fill,
                    width: 132.w,
                    height: 107.h,
                  );
                },
              ),
            ),
          ),
          Text(
            inscriptionsEntity.name,
            style: AppTextStyles.syleNorsalMedium12(context),
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              SvgPicture.asset(AppIcons.kLocatMarkerIcon),
              SizedBox(width: 5.w),
              Text(
                inscriptionsEntity.location,
                style: AppTextStyles.syleNorsalRegular10(
                  context,
                ).copyWith(color: const Color(0xFF8A8A8A)),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Text(
                inscriptionsEntity.status,
                style: AppTextStyles.syleNorsalRegular10(
                  context,
                ).copyWith(color: const Color(0xFF8A8A8A)),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    inscriptionsEntity.rate.toString(),
                    style: AppTextStyles.syleNorsalRegular10(context),
                  ),
                  const SizedBox(width: 2),
                  Image.asset(AppAssets.kRatingStar),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}

import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TotalRateStar extends StatelessWidget {
  const TotalRateStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SvgPicture.asset(AppAssets.kTotalRateStar),
            Positioned(
              left: 10.w,
              right: 20.w,
              top: 19.h,
              bottom: 13.h,
              child: Text(
                '4.5',
                style: AppTextStyles.syleNorsalMedium17(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        Text(
          '(200 تقييم)',
          style: AppTextStyles.syleNorsalRegular12(
            context,
          ).copyWith(color: const Color(0xFF8A8A8A)),
        ),
      ],
    );
  }
}

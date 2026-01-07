import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SubscriptionPlansScreenHeader extends StatelessWidget {
  const SubscriptionPlansScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppAssets.kSubscriptionPlansAvatar),
        Positioned(
          left: 0,
          right: 0,
          top: 80.h,
          child: Container(
            width: 232.w,
            height: 59.h,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30.r),
              border: const Border(
                bottom: BorderSide(color: Colors.brown, width: 5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'اشترك الآن',
                  style: AppTextStyles.syleNorsalMedium20(
                    context,
                  ).copyWith(color: Colors.white),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(AppIcons.kSubscribeIcon),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

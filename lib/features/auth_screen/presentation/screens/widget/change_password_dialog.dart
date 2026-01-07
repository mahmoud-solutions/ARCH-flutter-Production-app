import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordDialog extends StatelessWidget {
  const ChangePasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0,
      backgroundColor: const Color(0xfff9f8f8),
      children: [
        Padding(
          padding: EdgeInsets.all(40.w),
          child: Column(
            children: [
              SvgPicture.asset(AppAssets.kDoneSticker),
              SizedBox(height: 45.h),
              Text(
                AppLocalizations.of(context)!.password_has_been_changed,
                textAlign: TextAlign.center,
                style: AppTextStyles.syleNorsalMedium16(
                  context,
                ).copyWith(color: Colors.black),
              ),
              const SizedBox(height: 6),
              Text(
                AppLocalizations.of(
                  context,
                )!.your_password_has_been_successfully_changed,
                textAlign: TextAlign.center,
                style: AppTextStyles.syleNorsalRegular14(
                  context,
                ).copyWith(color: const Color(0xff8A8A8A)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailViewBody extends StatelessWidget {
  const VerifyEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          CustomAppBar(title: AppLocalizations.of(context)!.check_email),
          SizedBox(height: 40.h),
          Image.asset(AppAssets.kVerifyAvatar),
          SizedBox(height: 41.h),
          Text(
            AppLocalizations.of(context)!.password_recovery,
            textAlign: TextAlign.center,
            style: AppTextStyles.syleNorsalRegular14(
              context,
            ).copyWith(color: const Color(0xff8A8A8A)),
          ),
          SizedBox(height: 30.h),
          CustomButton(
            title: Text(
              AppLocalizations.of(context)!.check_your_email,
              style: AppTextStyles.syleNorsalMedium15(
                context,
              ).copyWith(color: Colors.white),
            ),

            buttonColor: const Color(0xffD2B48C),
          ),
          SizedBox(height: 15.h),
          CustomButton(
            onTap: () => GoRouter.of(context).push(AppRouter.kOtpView),
            title: Text(
              AppLocalizations.of(context)!.confirm_code,
              style: AppTextStyles.syleNorsalMedium15(
                context,
              ).copyWith(color: Colors.white),
            ),
            buttonColor: const Color(0xffD2B48C),
          ),
        ],
      ),
    );
  }
}

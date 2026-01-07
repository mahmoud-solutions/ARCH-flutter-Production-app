import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:arch_team_power/features/choseAppLang/presentation/screens/widget/lang_selector.dart';
import 'package:arch_team_power/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChoseAppLangScreenBody extends StatelessWidget {
  const ChoseAppLangScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            AppLocalizations.of(context)!.choose_app_language,
            style: AppTextStyles.syleNorsalMedium17(context),
          ),
        ),
        SizedBox(height: 40.h),
        Image.asset(AppAssets.kChoseApplangAvatar, height: 150.h, width: 166.w),
        SizedBox(height: 34.h),
        const LangSelector(),
        SizedBox(height: 27.h),
        CustomButton(
          onTap: () => GoRouter.of(context).push(AppRouter.kOptionScreen),
          title: Text(
            AppLocalizations.of(context)!.confirm,
            style: AppTextStyles.syleNorsalMedium15(
              context,
            ).copyWith(color: Colors.white),
          ),

          buttonColor: const Color(0xFFD2B48C),
        ),
      ],
    );
  }
}

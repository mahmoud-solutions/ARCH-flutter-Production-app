import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/widget/change_password_dialog.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/core/widgets/custom_text_field.dart';
import 'package:arch_team_power/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          CustomAppBar(title: AppLocalizations.of(context)!.new_password),
          SizedBox(height: 40.h),
          Image.asset(AppAssets.kNewPasswordAvater),
          SizedBox(height: 41.h),
          CustomTextField(
            obscureText: true,
            showEyeIcon: true,
            hintText: AppLocalizations.of(context)!.enter_new_password,
            textFieldTitle: AppLocalizations.of(context)!.new_password,
          ),

          SizedBox(height: 21.h),

          CustomTextField(
            obscureText: true,
            showEyeIcon: true,
            hintText: AppLocalizations.of(context)!.confirm_password,
            textFieldTitle: AppLocalizations.of(context)!.enter_new_password,
          ),
          SizedBox(height: 35.h),
          CustomButton(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const ChangePasswordDialog();
                },
              );
            },
            title: Text(
              AppLocalizations.of(context)!.change_password,
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

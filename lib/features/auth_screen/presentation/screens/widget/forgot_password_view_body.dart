import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/core/widgets/custom_circular_progress_indicator.dart';
import 'package:arch_team_power/core/widgets/custom_show_snackbar.dart';
import 'package:arch_team_power/core/widgets/custom_text_field.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/manger/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:arch_team_power/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is SendEmailVerifyCodeSuccess) {
          GoRouter.of(
            context,
          ).push(AppRouter.kOtpView, extra: emailController.text.trim());
        } else if (state is SendEmailVerifyCodeFailure) {
          customShowSnackBar(context, title: state.errorMessage);
        }
      },
      builder: (context, state) {
        final isLoading = state is CkeckResetCodeLoading;

        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              CustomAppBar(
                title: AppLocalizations.of(
                  context,
                )!.forgot_password_appbar_title,
              ),
              SizedBox(height: 40.h),
              Image.asset(AppAssets.kForgotPasswordAvatar),
              SizedBox(height: 41.h),
              CustomTextField(
                controller: emailController,
                hintText: AppLocalizations.of(
                  context,
                )!.forgot_password_text_field_hint,
                textFieldTitle: AppLocalizations.of(
                  context,
                )!.forgot_password_text_field_title,
              ),
              SizedBox(height: 42.h),
              CustomButton(
                onTap: () {
                  context.read<ForgotPasswordCubit>().sendVerifyCode(
                    email: emailController.text.trim(),
                  );
                },

                title: isLoading
                    ? const CustomCircularProgressIndicator(color: Colors.white)
                    : Text(
                        AppLocalizations.of(context)!.send_code,
                        style: AppTextStyles.syleNorsalMedium15(
                          context,
                        ).copyWith(color: Colors.white),
                      ),

                buttonColor: const Color(0xffD2B48C),
              ),
            ],
          ),
        );
      },
    );
  }
}

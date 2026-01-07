import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:arch_team_power/core/widgets/custom_circular_progress_indicator.dart';
import 'package:arch_team_power/core/widgets/custom_show_snackbar.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/manger/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/widget/otp.dart';
import 'package:arch_team_power/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ConfirmationOtpCodeButton extends StatelessWidget {
  const ConfirmationOtpCodeButton({super.key, required this.otpKey});

  final GlobalKey<OtpState> otpKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is CkeckResetCodeSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeScreen);
        } else if (state is CkeckResetCodeFailure) {
          customShowSnackBar(context, title: state.errorMessage);
        }
      },
      builder: (context, state) {
        final isLoading = state is CkeckResetCodeLoading;

        return CustomButton(
          onTap: () {
            final code = otpKey.currentState?.getOtpCode() ?? '';

            if (code.length != 6) {
              customShowSnackBar(context, title: 'ادخل الكود كامل');
              return;
            }

            context.read<ForgotPasswordCubit>().checkResetCode(code: code);
          },
          title: isLoading
              ? const CustomCircularProgressIndicator(color: Colors.white)
              : Text(
                  AppLocalizations.of(context)!.send,
                  style: AppTextStyles.syleNorsalMedium15(
                    context,
                  ).copyWith(color: Colors.white),
                ),
          buttonColor: const Color(0xffD2B48C),
        );
      },
    );
  }
}

import 'package:arch_team_power/core/widgets/custom_show_snackbar.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/manger/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/widget/confirmation_otp_code_button.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/widget/count_up_timer.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/widget/otp.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/widget/resend_code_widget.dart';
import 'package:arch_team_power/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  final GlobalKey<OtpState> otpKey = GlobalKey<OtpState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is CkeckResetCodeFailure) {
          customShowSnackBar(context, title: state.errorMessage);
        }
      },
      child: Column(
        children: [
          SizedBox(height: 20.h),
          CustomAppBar(title: AppLocalizations.of(context)!.code_verification),
          SizedBox(height: 48.h),
          const Center(child: CountUpTimer()),
          SizedBox(height: 13.5.h),

          Otp(key: otpKey),

          SizedBox(height: 41.5.h),

          ConfirmationOtpCodeButton(otpKey: otpKey),

          SizedBox(height: 14.h),

          ResendCodeWidget(
            onTap: () {
              context.read<ForgotPasswordCubit>().resendVerifyCode();
            },
          ),
        ],
      ),
    );
  }
}

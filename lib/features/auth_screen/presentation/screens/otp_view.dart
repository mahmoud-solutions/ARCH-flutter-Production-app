import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/manger/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/widget/otp_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgotPasswordCubit>()..setEmail(email),
      child: Scaffold(
        backgroundColor: const Color(0xfff9f8f8),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.86.w),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: const SafeArea(child: OtpViewBody()),
          ),
        ),
      ),
    );
  }
}

import 'package:arch_team_power/core/services/service_locator.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/manger/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:arch_team_power/features/auth_screen/presentation/screens/widget/forgot_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f8f8),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.86.w),
        child: BlocProvider(
          create: (context) => sl<ForgotPasswordCubit>(),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: const SafeArea(child: ForgotPasswordViewBody()),
          ),
        ),
      ),
    );
  }
}

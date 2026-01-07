import 'package:arch_team_power/features/choseAppLang/presentation/screens/widget/chose_app_lang_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoseAppLangScreen extends StatelessWidget {
  const ChoseAppLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.86.w, vertical: 28.h),
          child: const ChoseAppLangScreenBody(),
        ),
      ),
    );
  }
}

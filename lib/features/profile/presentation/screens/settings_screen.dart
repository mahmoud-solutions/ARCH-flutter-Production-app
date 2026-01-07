import 'package:arch_team_power/features/profile/presentation/screens/widgets/setting_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.86.w),
          child: const SettingScreenBody(),
        ),
      ),
    );
  }
}

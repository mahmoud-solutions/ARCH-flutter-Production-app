import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arch_team_power/core/theme/app_colors.dart';
import '../../../../core/models/intro_pages_data.dart';
import 'custom_page.dart';

class IntroHomeScreen extends StatelessWidget {
  IntroHomeScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: PageView.builder(
            controller: pageController,
            itemCount: IntroPagesData.data.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CustomPage(
                introPagesData: IntroPagesData.data[index],
                pageController: pageController,
              );
            },
          ),
        ),
      ),
    );
  }
}

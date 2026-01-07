import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:arch_team_power/core/widgets/auth_button.dart';
import 'package:arch_team_power/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OptionScreenBody extends StatelessWidget {
  const OptionScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.86.w, vertical: 28.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(title: "! ابدأ رحلتك معنا"),
            SizedBox(height: 40.h),
            Center(
              child: Image.asset(
                AppAssets.kStartYourJourney,
                height: 118.65.h,
                width: 145.5.w,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              "لإثراء تجربتك، اختر طريقة الاستخدام التي تناسبك",
              style: AppTextStyles.syleNorsalMedium14(
                context,
              ).copyWith(color: const Color(0xFF8A8A8A)),
            ),
            SizedBox(height: 56.h),

            CustomButton(
              title: Text(
                "ايقونه سائح",
                style: AppTextStyles.syleNorsalMedium15(
                  context,
                ).copyWith(color: Colors.white),
              ),

              buttonColor: const Color(0xFFD2B48C),
              onTap: () =>
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeScreen),
            ),
            SizedBox(height: 17.h),
            CustomButton(
              buttonColor: Colors.white,
              title: Text(
                "ايقونه الباحث والمتخصص",
                style: AppTextStyles.syleNorsalMedium15(
                  context,
                ).copyWith(color: Colors.white),
              ),

              textColor: const Color(0xFF8A8A8A),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

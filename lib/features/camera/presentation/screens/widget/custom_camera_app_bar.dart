import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_icons.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/open_lang_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CameraAppBar extends StatelessWidget {
  const CameraAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.86.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () =>
                GoRouter.of(context).pushReplacement(AppRouter.kHomeScreen),
            child: Icon(
              CupertinoIcons.back,
              size: 20.sp,
              weight: 400,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => showModalBottomSheet(
              backgroundColor: const Color(0xffF4F2EF),
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (context) {
                return const OpenLangWidget();
              },
            ),
            child: Row(
              children: [
                Text(
                  'English',
                  style: AppTextStyles.syleNorsalRegular14(
                    context,
                  ).copyWith(color: const Color(0xFFD2B48C)),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset(AppIcons.kCameraLangIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

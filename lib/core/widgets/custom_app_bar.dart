import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Icon(CupertinoIcons.back, size: 20.sp, weight: 400),
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.syleNorsalMedium17(context),
            ),
          ),
        ),
      ],
    );
  }
}

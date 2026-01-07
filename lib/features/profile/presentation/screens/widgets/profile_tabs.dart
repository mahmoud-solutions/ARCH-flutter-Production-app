import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileTabs extends StatelessWidget {
  final List<String> tabs = const [
    "الأسئلة الشائعة",
    "المكتبة الرقمية",
    "الأكواد والفعاليات",
    "الصالة المدفوعة",
  ];

  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (index) {
          return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  context.push(AppRouter.kFaqScreen);
                  break;

                case 1:
                  context.push(AppRouter.kDetailsLibraryScreen);
                  break;

                case 2:
                  context.push(AppRouter.kEventsScreen);
                  break;

                case 3:
                  context.push(AppRouter.kVipHallScreen);
                  break;
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                tabs[index],
                style: AppTextStyles.syleNorsalRegular12(
                  context,
                ).copyWith(color: const Color(0xFF8A8A8A)),
              ),
            ),
          );
        }),
      ),
    );
  }
}

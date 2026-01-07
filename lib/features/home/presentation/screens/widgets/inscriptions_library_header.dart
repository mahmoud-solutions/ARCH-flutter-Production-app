import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/home/presentation/screens/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class InscriptionsLibraryHeader extends StatelessWidget {
  const InscriptionsLibraryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: GestureDetector(
        onTap: () => GoRouter.of(context).push(AppRouter.kLibraryScreen),
        child: Row(
          children: [
            const SectionTitle(title: "مكتبة النقوش القديمة")
                .animate()
                .fade(duration: 600.ms)
                .slideY(begin: 0.3, duration: 600.ms),
            const Spacer(),
            Text(
              'عرض المزيد',
              style: AppTextStyles.syleNorsalRegular10(
                context,
              ).copyWith(color: const Color(0xFF8A8A8A)),
            ),
          ],
        ),
      ),
    );
  }
}

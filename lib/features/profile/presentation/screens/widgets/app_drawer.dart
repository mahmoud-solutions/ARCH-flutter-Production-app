import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        width: 250,

        /// ⭐ Wave Effect باستخدام ClipOval + flutter_animate
        child: Animate(
          effects: [
            FadeEffect(duration: 350.ms),

            /// Wave Animation (يبدأ صغير ويرتفع)
            CustomEffect(
              builder: (context, value, child) {
                return ClipPath(
                  clipper: _WaveClipper(progress: value),
                  child: child,
                );
              },
              duration: 550.ms,
              curve: Curves.easeOutCubic,
            ),

            /// Slide + Scale للـ Drawer نفسه
            SlideEffect(
              begin: const Offset(0.35, 0),
              end: Offset.zero,
              duration: 450.ms,
              curve: Curves.easeOut,
            ),
            ScaleEffect(
              begin: const Offset(0.90, 0.90),
              end: const Offset(1, 1),
              duration: 400.ms,
            ),
          ],
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),

                /// صورة
                CircleAvatar(
                      radius: 40.r,
                      backgroundImage: const AssetImage(
                        AppAssets.kProfileImage2,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 350.ms, delay: 100.ms)
                    .slideX(begin: 0.1, end: 0),

                SizedBox(height: 15.h),

                Text(
                      "محمد عبدالله",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 350.ms, delay: 150.ms)
                    .slideX(begin: 0.15, end: 0),

                SizedBox(height: 30.h),

                ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text("الإعدادات", style: TextStyle(fontSize: 16.sp)),
                  onTap: () {
                    Navigator.pop(context);
                    context.push(AppRouter.kSettingsScreen);
                  },
                ).animate().fadeIn(delay: 220.ms).slideX(begin: 0.2, end: 0),
                SizedBox(height: 20.h),

                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: Text(
                    "تسجيل الخروج",
                    style: TextStyle(fontSize: 16.sp, color: Colors.red),
                  ),
                  onTap: () {},
                ).animate().fadeIn(delay: 260.ms).slideX(begin: 0.2, end: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ⭐ كلاس توليد موجة (Wave)
class _WaveClipper extends CustomClipper<Path> {
  final double progress; // من 0 → 1

  _WaveClipper({required this.progress});

  @override
  Path getClip(Size size) {
    final path = Path();

    // النقطة التي تبدأ منها الموجة (يمين drawer)
    final startX = size.width;
    final startY = size.height / 2;

    // مدى الاتساع (يكبر مع progress)
    final radius = size.height * progress * 2.5;

    path.addOval(
      Rect.fromCircle(center: Offset(startX, startY), radius: radius),
    );

    return path;
  }

  @override
  bool shouldReclip(_WaveClipper oldClipper) => oldClipper.progress != progress;
}

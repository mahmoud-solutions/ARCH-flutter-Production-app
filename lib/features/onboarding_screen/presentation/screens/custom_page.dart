import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/models/intro_pages_data.dart';

class CustomPage extends StatefulWidget {
  final IntroPagesData introPagesData;
  final PageController pageController;

  const CustomPage({
    super.key,
    required this.introPagesData,
    required this.pageController,
  });

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  // الألوان الأساسية
  static const Color beigeColor = Color(0xFFD2B48C);
  static const Color primaryColor = Color(0xFF4B5320);
  static const Color deepDark = Color(0xFF40442B);

  bool _isExiting = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  Future<void> _exitAnimation(VoidCallback onComplete) async {
    setState(() => _isExiting = true);
    await _animationController.reverse(); // تشغيل الحركة العكسية
    onComplete(); // استدعاء العملية بعد انتهاء الحركة
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        textDirection: TextDirection.ltr,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.kOnPordingBackGroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SizedBox(
                        width: 400.w,
                        height: 800.h,
                        child: Image.asset(widget.introPagesData.image),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  width: 1.sw,
                  height: 291.h, // يغطي نصف الصورة
                  decoration: BoxDecoration(
                    color: beigeColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 30.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// النص
                        Text(
                          widget.introPagesData.title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.syleNorsalRegular20(
                            context,
                          ).copyWith(color: const Color(0xFF4B5320)),
                        ),

                        /// النقاط (Indicators)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.ltr,
                          children: List.generate(
                            3,
                            (value) => AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              width: value == widget.introPagesData.index
                                  ? 20.w
                                  : 10.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: value == widget.introPagesData.index
                                    ? primaryColor
                                    : deepDark.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),

                        /// الأزرار
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                if (_isExiting) return;
                                await _exitAnimation(() {
                                  GoRouter.of(
                                    context,
                                  ).push(AppRouter.kLoginScreen);
                                });
                              },
                              borderRadius: BorderRadius.circular(12.r),
                              child: Container(
                                width: 80.w,
                                height: 50.h,
                                alignment: Alignment.center,
                                child: Text(
                                  "تخطي",
                                  style: AppTextStyles.syleNorsalMedium15(
                                    context,
                                  ).copyWith(color: const Color(0xFF4B5320)),
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: () async {
                                if (_isExiting) return;

                                if (widget.introPagesData.index == 2) {
                                  await _exitAnimation(() {
                                    GoRouter.of(
                                      context,
                                    ).push(AppRouter.kLoginScreen);
                                  });
                                } else {
                                  await _exitAnimation(() {
                                    widget.pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      curve: Curves.easeInCubic,
                                    );
                                  });
                                }
                              },
                              borderRadius: BorderRadius.circular(12.r),
                              child: Container(
                                width: 120.w,
                                height: 50.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Text(
                                  widget.introPagesData.index == 2
                                      ? "ابدأ الآن"
                                      : "التالي",
                                  style: AppTextStyles.syleNorsalMedium15(
                                    context,
                                  ).copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

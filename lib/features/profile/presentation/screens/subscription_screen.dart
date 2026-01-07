import 'package:arch_team_power/features/profile/presentation/screens/widgets/plans_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({super.key});

  final List<Map<String, dynamic>> plans = [
    {"months": 3, "price": 49.00},
    {"months": 12, "price": 199.00},
    {"months": 1, "price": 19.00},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              Image.asset("assets/image/bacground_sub_pic.png"),

              SizedBox(height: 5.h),

              /// 🔔 زر "اشترك الآن"
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: const Color(0xffD4B08A),
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 7,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "اشترك الآن",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      const Icon(Icons.notifications_none, color: Colors.white),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25.h),

              /// النص تحت الزر
              Text(
                "اشترك للحصول على ميزات أفضل",
                style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade700),
              ),

              SizedBox(height: 25.h),

              /// 🎡 Carousel
              PlansCarousel(plans: plans),

              SizedBox(height: 30.h),

              /// زر الاشتراك الرئيسي
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: const Color(0xffD4B08A),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: Text(
                    "اشتراك",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              /// ❌ زر إلغاء الاشتراك
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.close,
                                size: 50.sp,
                                color: const Color(0xffD4B08A),
                              ),
                              SizedBox(height: 15.h),
                              Text(
                                "تم الغاء اشتراكك بنجاح",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: Text(
                      "إلغاء الاشتراك",
                      style: TextStyle(color: Colors.red, fontSize: 15.sp),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}

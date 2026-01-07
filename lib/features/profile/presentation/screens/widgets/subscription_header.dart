import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionHeader extends StatelessWidget {
  const SubscriptionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Back button
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        /// Header Container
        Container(
          width: double.infinity,
          height: 160.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
              image: AssetImage(""),
              fit: BoxFit.cover,
              opacity: 0.18,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// زر اشتراك الآن
              Container(
                padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 50.w),
                decoration: BoxDecoration(
                  color: const Color(0xffD4B08A),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.notifications, color: Colors.white),
                    SizedBox(width: 8.w),
                    Text(
                      "اشترك الآن",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15.h),

              Text(
                "اشترك للحصول علي ميزات أفضل",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

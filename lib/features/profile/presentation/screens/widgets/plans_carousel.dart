import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlansCarousel extends StatefulWidget {
  final List<Map<String, dynamic>> plans;

  const PlansCarousel({super.key, required this.plans});

  @override
  State<PlansCarousel> createState() => _PlansCarouselState();
}

class _PlansCarouselState extends State<PlansCarousel> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: CarouselSlider.builder(
        itemCount: widget.plans.length,
        options: CarouselOptions(
          initialPage: selected,
          height: 220.h,
          enlargeCenterPage: true,
          viewportFraction: 0.45,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            setState(() => selected = index); // ← اختيار الخطة تلقائياً
          },
        ),

        itemBuilder: (context, index, realIdx) {
          final plan = widget.plans[index];
          final bool isActive = selected == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOut,

            margin: EdgeInsets.symmetric(vertical: isActive ? 5.h : 15.h),
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),

            decoration: BoxDecoration(
              color: isActive ? const Color(0xffD4B08A) : Colors.white,
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(color: const Color(0xffD4B08A)),
              boxShadow: isActive
                  ? [
                      const BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ]
                  : [],
            ),

            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isActive ? 1 : 0.5,

              child: Transform.scale(
                scale: isActive ? 1.08 : 0.92,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${plan['months']}",
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: isActive ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    Text(
                      plan['months'] == 1
                          ? "شهر واحد"
                          : "${plan['months']} شهر",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isActive ? Colors.white : Colors.black87,
                      ),
                    ),
                    SizedBox(height: 6.h),

                    Text(
                      "ريال ${plan['price']}",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: isActive ? Colors.white : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

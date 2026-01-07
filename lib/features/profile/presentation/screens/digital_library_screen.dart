import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/app_colors.dart';

class DigitalLibraryScreen extends StatelessWidget {
  const DigitalLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("المكتبة الرقمية"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "المحتوى المتاح",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),

            Expanded(
              child: ListView.separated(
                itemCount: 8,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.picture_as_pdf, size: 35.sp),
                        SizedBox(width: 12.w),
                        Text(
                          "ملف PDF رقم ${index + 1}",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

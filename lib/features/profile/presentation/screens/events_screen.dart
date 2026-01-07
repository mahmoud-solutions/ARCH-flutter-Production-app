import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/app_colors.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("الأكواد والفعاليات"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "الفعاليات والخصومات",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.local_offer, color: Colors.red),
                      title: Text(
                        "كود خصم ${i + 1}",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      subtitle: Text(
                        "استخدمه للحصول على خصم خاص",
                        style: TextStyle(fontSize: 13.sp),
                      ),
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

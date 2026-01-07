import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("الأسئلة الشائعة"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "إجابات على الأسئلة الأكثر تكراراً",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),

            Expanded(
              child: ListView(
                children: [
                  ExpansionTile(
                    title: const Text("كيف يمكنني الاشتراك؟"),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.w),
                        child: const Text(
                          "يمكنك الاشتراك من خلال صفحة البروفايل → تجديد الاشتراك.",
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text("هل يمكنني استرجاع أموالي؟"),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.w),
                        child: const Text(
                          "سياسة الاسترجاع تعتمد على نوع الاشتراك.",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

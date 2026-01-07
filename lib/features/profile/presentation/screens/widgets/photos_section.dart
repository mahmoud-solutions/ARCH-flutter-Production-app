import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotosSection extends StatelessWidget {
  const PhotosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.w),
        itemCount: photos.length,
        separatorBuilder: (_, __) => SizedBox(width: 14.w),

        itemBuilder: (context, index) {
          final img = photos[index];

          return Container(
            width: 300.w,
            height: 250.h,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(img, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}

const List<String> photos = [
  "assets/image/image1.png",
  "assets/image/image2.png",
  "assets/image/image3.png",
  "assets/image/image4.png",
  "assets/image/image4.png",
  "assets/image/image4.png",
  "assets/image/image4.png",
  "assets/image/image4.png",
  "assets/image/image4.png",
  "assets/image/image4.png",
  "assets/image/image4.png",
];

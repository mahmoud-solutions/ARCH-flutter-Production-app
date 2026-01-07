import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SomeDetailsAboutTheActivePlaceRate extends StatefulWidget {
  const SomeDetailsAboutTheActivePlaceRate({super.key});

  @override
  State<SomeDetailsAboutTheActivePlaceRate> createState() =>
      _SomeDetailsAboutTheActivePlaceRateState();
}

class _SomeDetailsAboutTheActivePlaceRateState
    extends State<SomeDetailsAboutTheActivePlaceRate> {
  double rating = 1;
  int starCount = 5;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Text(
          '(4.5)',
          textAlign: TextAlign.right,
          style: AppTextStyles.syleNorsalMedium12(
            context,
          ).copyWith(color: const Color(0xFF8A8A8A)),
        ),
        StarRating(
          size: 16.sp,
          rating: rating,
          color: const Color(0xffFFCE31),
          borderColor: const Color(0xffD0D0D0),
          allowHalfRating: true,
          starCount: starCount,
          onRatingChanged: (rating) => setState(() {
            this.rating = rating;
          }),
        ),
      ],
    );
  }
}

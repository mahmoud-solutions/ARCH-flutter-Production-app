import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/rate_dialog_actions.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/total_rate_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateDialog extends StatefulWidget {
  const RateDialog({super.key});

  @override
  State<RateDialog> createState() => _RateDialogState();
}

class _RateDialogState extends State<RateDialog> {
  double rating = 3.5;
  int starCount = 5;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0,
      backgroundColor: const Color(0xfff9f8f8),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.w),
          child: Column(
            children: [
              Column(
                children: [
                  const TotalRateStar(),
                  SizedBox(height: 33.h),
                  Text(
                    'هل اعجبك النقش ؟ ',
                    style: AppTextStyles.syleNorsalMedium14(
                      context,
                    ).copyWith(color: const Color(0xFF282828)),
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    'رجاءا قم بتقييم النقش ليطلع عليه غيرك  ',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.syleNorsalRegular14(
                      context,
                    ).copyWith(color: const Color(0xFF8A8A8A)),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              Center(
                child: StarRating(
                  size: 22.sp,
                  rating: rating,
                  color: const Color(0xffFFCE31),
                  borderColor: const Color(0xffD0D0D0),
                  allowHalfRating: true,
                  starCount: starCount,
                  onRatingChanged: (rating) => setState(() {
                    this.rating = rating;
                  }),
                ),
              ),
              SizedBox(height: 27.h),
              const RateDialogActions(),
            ],
          ),
        ),
      ],
    );
  }
}

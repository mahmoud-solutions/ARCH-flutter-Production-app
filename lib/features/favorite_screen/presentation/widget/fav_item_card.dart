import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

class FavItemCard extends StatelessWidget {
  const FavItemCard({
    super.key,
    required this.name,
    required this.description,

    required this.image,
    required this.mapPhoto,

    required this.totalReviews,
    required this.averageRating,
  });

  final String name;
  final String description;

  final String image;
  final String mapPhoto;
  // final String lat;
  // final String lang;
  // final String popularPlaceId;
  // final String governorateName;
  // final String regionName;
  final String totalReviews;
  final String averageRating;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        SlideEffect(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
          duration: 350.ms,
          curve: Curves.easeOutBack,
        ),
        FadeEffect(duration: 300.ms),
      ],
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    image,
                    width: 85.w,
                    height: 85.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 40,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),

                /// القلب فوق الصورة
                Positioned(
                  top: 6.w,
                  left: 50.w,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.secondary,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 12),

            /// النصوص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTextStyles.syleNorsalRegular14(context)),

                  const SizedBox(height: 5),

                  Text(
                    description,
                    style: AppTextStyles.syleNorsalRegular10(
                      context,
                    ).copyWith(color: const Color(0xFF8A8A8A)),
                  ),

                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        totalReviews,
                        style: AppTextStyles.syleNorsalMedium12(context),
                      ),
                      SizedBox(width: 4.w),
                      SizedBox(width: 6.w),
                      Text(
                        averageRating,
                        style: AppTextStyles.syleNorsalRegular10(
                          context,
                        ).copyWith(color: const Color(0xFFDB9448)),
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

import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarPlacesNearYouItem extends StatelessWidget {
  const SimilarPlacesNearYouItem({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
  });
  final String name;
  final String? image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                image ?? '',
                fit: BoxFit.fill,
                height: 64.h,
                width: 64.w,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    AppAssets.kTestImage7,
                    fit: BoxFit.fill,
                    height: 64.h,
                    width: 64.w,
                  );
                },
              ),
            ),
          ),
          Text(
            name,
            style: AppTextStyles.syleNorsalRegular12(
              context,
            ).copyWith(color: const Color(0xFF8A8A8A)),
          ),
        ],
      ),
    );
  }
}

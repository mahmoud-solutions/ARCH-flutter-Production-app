import 'package:arch_team_power/core/theme/app_colors.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationScreenItemDetails extends StatelessWidget {
  const InformationScreenItemDetails({super.key, required this.subPlaceEntity});
  final SubPlaceEntity subPlaceEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subPlaceEntity.name,
                  style: AppTextStyles.syleNorsalMedium14(
                    context,
                  ).copyWith(color: AppColors.primary),
                ),
                SizedBox(height: 4.h),
                Expanded(
                  child: Text(
                    subPlaceEntity.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: AppTextStyles.syleNorsalRegular12(
                      context,
                    ).copyWith(color: const Color(0xFF8A8A8A)),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.network(
              subPlaceEntity.image,
              fit: BoxFit.fill,
              width: 93.w,
              height: 72.h,
            ),
          ),
        ],
      ),
    );
  }
}

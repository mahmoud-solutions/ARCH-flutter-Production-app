import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/details_screen/presentation/data/details_actions.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/details_screen_body_info_title_and_category_name.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/sub_place_similar_places_near_bloc_builder.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:arch_team_power/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreenBodyInfo extends StatelessWidget {
  const DetailsScreenBodyInfo({super.key, required this.subPlaceEntity});
  final SubPlaceEntity subPlaceEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsScreenBodyInfoTitleAndCategoryName(name: subPlaceEntity.name),
          SizedBox(height: 20.h),
          SizedBox(
            height: 85.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                actions.length,
                (index) => actions[index],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            AppLocalizations.of(context)!.change_password,
            style: AppTextStyles.syleNorsalRegular14(
              context,
            ).copyWith(color: const Color(0xFFCE1225)),
          ),
          Text(
            subPlaceEntity.workDate,
            style: AppTextStyles.syleNorsalRegular12(
              context,
            ).copyWith(color: const Color(0xFF282828)),
          ),
          SizedBox(height: 20.h),
          Text('الوصف', style: AppTextStyles.syleNorsalRegular14(context)),
          Text(
            subPlaceEntity.description,
            style: AppTextStyles.syleNorsalMedium12(
              context,
            ).copyWith(color: const Color(0xFF8A8A8A)),
          ),
          SizedBox(height: 20.h),
          const SubPlaceSimilarPlacesNearBlocBuilder(),
        ],
      ),
    );
  }
}

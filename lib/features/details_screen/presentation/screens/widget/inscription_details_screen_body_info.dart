import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/details_screen/presentation/data/details_actions.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/details_screen_body_info_title_and_category_name.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/similar_places_near_you_bloc_builder.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InscriptionDetailsScreenBodyInfo extends StatelessWidget {
  const InscriptionDetailsScreenBodyInfo({
    super.key,
    required this.inscriptionsEntity,
  });
  final InscriptionsEntity inscriptionsEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsScreenBodyInfoTitleAndCategoryName(
            name: inscriptionsEntity.name,
          ),
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
          Row(
            children: [
              Text(
                'الحالة :',
                style: AppTextStyles.syleNorsalRegular14(
                  context,
                ).copyWith(color: const Color(0xFF282828)),
              ),
              Text(
                inscriptionsEntity.status,
                style: AppTextStyles.syleNorsalRegular12(
                  context,
                ).copyWith(color: const Color(0xFF8A8A8A)),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Text(
                'تاريخ العثور على النقش',
                style: AppTextStyles.syleNorsalRegular14(
                  context,
                ).copyWith(color: const Color(0xFF282828)),
              ),
              Text(
                inscriptionsEntity.findingDetails ?? '',
                style: AppTextStyles.syleNorsalRegular12(
                  context,
                ).copyWith(color: const Color(0xFF8A8A8A)),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'تفاصيل العثور علي النقش :',
            style: AppTextStyles.syleNorsalRegular14(
              context,
            ).copyWith(color: const Color(0xFF282828)),
          ),
          SizedBox(height: 10.h),
          Text(
            inscriptionsEntity.description,
            style: AppTextStyles.syleNorsalRegular12(
              context,
            ).copyWith(color: const Color(0xFF8A8A8A)),
          ),
          SizedBox(height: 20.h),
          Text(
            'ترجمة النقش',
            style: AppTextStyles.syleNorsalRegular14(
              context,
            ).copyWith(color: const Color(0xFF282828)),
          ),
          SizedBox(height: 10.h),
          Text(
            inscriptionsEntity.inscriptionTranslation ??
                inscriptionsEntity.description,
            style: AppTextStyles.syleNorsalRegular12(
              context,
            ).copyWith(color: const Color(0xFF8A8A8A)),
          ),
          SizedBox(height: 20.h),
          const SimilarPlacesNearYouBlocBuilder(),
        ],
      ),
    );
  }
}

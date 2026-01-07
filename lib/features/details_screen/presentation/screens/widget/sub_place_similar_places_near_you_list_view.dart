import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/similar_places_near_you_item.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SubPlaceSimilarPlacesNearYouListView extends StatelessWidget {
  const SubPlaceSimilarPlacesNearYouListView({
    super.key,
    required this.subPlaceEntity,
  });
  final List<SubPlaceEntity> subPlaceEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'أماكن مشابهه بالقرب منك',
          style: AppTextStyles.syleNorsalRegular14(context),
        ),
        SizedBox(height: 14.h),
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: subPlaceEntity.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SimilarPlacesNearYouItem(
                  onTap: () => GoRouter.of(context).push(
                    AppRouter.kDetailsScreen,
                    extra: subPlaceEntity[index],
                  ),
                  image: subPlaceEntity[index].image,
                  name: subPlaceEntity[index].name,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

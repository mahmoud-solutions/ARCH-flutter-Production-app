import 'package:arch_team_power/core/routes/app_router.dart';
import 'package:arch_team_power/core/theme/app_text_style.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/similar_places_near_you_item.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SimilarPlacesNearYouListView extends StatelessWidget {
  const SimilarPlacesNearYouListView({
    super.key,
    required this.inscriptionsEntity,
  });
  final List<InscriptionsEntity> inscriptionsEntity;
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
            itemCount: inscriptionsEntity.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SimilarPlacesNearYouItem(
                  onTap: () => GoRouter.of(context).push(
                    AppRouter.kInscriptionDetailsScreen,
                    extra: inscriptionsEntity[index],
                  ),
                  image: inscriptionsEntity[index].image,
                  name: inscriptionsEntity[index].name,
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

import 'package:arch_team_power/features/details_screen/presentation/screens/widget/details_image.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/dot_indctor_list.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({super.key, required this.subPlaceEntity});
  final SubPlaceEntity subPlaceEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 232.h,
      child: PageView.builder(
        itemCount: subPlaceEntity.images.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  DetailsImage(
                    subPlaceImageEntity: subPlaceEntity.images[index],
                  ),

                  Positioned(
                    bottom: 7.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: DotIdctorList(
                        cruntPageIndex: index,
                        subPlaceEntity: subPlaceEntity,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

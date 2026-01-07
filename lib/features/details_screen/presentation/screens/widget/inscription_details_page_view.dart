import 'package:arch_team_power/features/details_screen/presentation/screens/widget/inscription_details_image.dart';
import 'package:arch_team_power/features/details_screen/presentation/screens/widget/inscription_dot_indicator_list.dart';
import 'package:arch_team_power/features/home/domain/entities/inscriptions_library_ruin_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InscriptionDetailsPageView extends StatelessWidget {
  const InscriptionDetailsPageView({
    super.key,
    required this.inscriptionsEntity,
  });
  final InscriptionsEntity inscriptionsEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 232.h,
      child: PageView.builder(
        itemCount: inscriptionsEntity.images.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  InscriptionDetailsImage(
                    ruinImageEntity: inscriptionsEntity.images[index],
                  ),

                  Positioned(
                    bottom: 7.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: InscriptionDotIdctorList(
                        cruntPageIndex: index,
                        inscriptionsEntity: inscriptionsEntity,
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

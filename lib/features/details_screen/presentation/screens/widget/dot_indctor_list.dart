import 'package:arch_team_power/features/details_screen/presentation/screens/widget/dot_indctor.dart';
import 'package:arch_team_power/features/home/domain/entities/sub_places_entity.dart';
import 'package:flutter/material.dart';

class DotIdctorList extends StatelessWidget {
  const DotIdctorList({
    super.key,
    required this.cruntPageIndex,
    required this.subPlaceEntity,
  });

  final int cruntPageIndex;
  final SubPlaceEntity subPlaceEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(subPlaceEntity.images.length, (index) {
        return CustomDotIndicator(isActive: index == cruntPageIndex);
      }),
    );
  }
}
